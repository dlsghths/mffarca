package com.example.service;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.mapper.ArenaConfigMapper;

@Service
public class ArenaManageService {

    @Value("${arena.upload.dir}")
    private String uploadDir;

    private final ArenaConfigMapper arenaConfigMapper;
    
    private static final List<String> ALLOWED_EXT =
            Arrays.asList("jpg", "jpeg", "png", "webp", "gif");

    public ArenaManageService(ArenaConfigMapper arenaConfigMapper) {
        this.arenaConfigMapper = arenaConfigMapper;
    }

    public String getNote() {
        String note = arenaConfigMapper.selectArenaNote();
        return (note == null) ? "" : note;
    }

    public void saveNote(String note) {
        arenaConfigMapper.upsertArenaNote(note == null ? "" : note);
    }

    public String getExistingImageName(String baseName) throws IOException {
    	Path dir = Paths.get(uploadDir);
        if (!Files.exists(dir)) return null;

        DirectoryStream<Path> stream = null;
        try {
            // baseName.* 형태만 걸러서 조회 (glob 패턴)
            stream = Files.newDirectoryStream(dir, baseName + ".*");

            for (Path p : stream) {
                return p.getFileName().toString(); // 첫 번째 파일명 리턴
            }
            return null;
        } finally {
            if (stream != null) stream.close();
        }
    }

    public void saveImage(MultipartFile file, String baseName) throws IOException {
        if (file == null || file.isEmpty()) return;

        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new IllegalArgumentException("이미지 파일만 업로드 가능합니다.");
        }

        String original = file.getOriginalFilename();
        String ext = "jpg";
        if (original != null) {
            int dot = original.lastIndexOf('.');
            if (dot >= 0 && dot < original.length() - 1) {
                ext = original.substring(dot + 1).toLowerCase();
            }
        }

        // 허용 확장자 제한
        if (!ALLOWED_EXT.contains(ext)) {
            throw new IllegalArgumentException("허용되지 않는 이미지 확장자입니다.");
        }

        Files.createDirectories(Paths.get(uploadDir));

        String savedName = baseName + "." + ext; // challenger.png 같은 형태
        Path target = Paths.get(uploadDir).resolve(savedName);

        Files.copy(file.getInputStream(), target, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
    }
}

