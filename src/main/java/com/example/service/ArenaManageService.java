package com.example.service;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import javax.imageio.ImageIO;

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
    
    public enum ArenaImageType {
        CHALLENGER("challenger"),
        VIBRANIUM("vibranium");

        private final String fixedBaseName;
        ArenaImageType(String fixedBaseName) { this.fixedBaseName = fixedBaseName; }
        public String baseName() { return fixedBaseName; }
    }

    public void saveImage(MultipartFile file, String baseName) throws IOException {
    	if (file == null || file.isEmpty()) return;

        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new IllegalArgumentException("이미지 파일만 업로드 가능합니다.");
        }

        // 실제 이미지 디코딩(확장자/파일명 믿지 않음)
        BufferedImage src;
        try (InputStream in = file.getInputStream()) {
            src = ImageIO.read(in);
        }
        if (src == null) {
            throw new IllegalArgumentException("지원하지 않는 이미지 형식입니다.");
        }

        // PNG 투명도 등 -> JPEG는 알파가 없으니 흰 배경으로 합성
        BufferedImage rgb = new BufferedImage(src.getWidth(), src.getHeight(), BufferedImage.TYPE_INT_RGB);
        Graphics2D g = rgb.createGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, rgb.getWidth(), rgb.getHeight());
        g.drawImage(src, 0, 0, null);
        g.dispose();

        Path dir = Paths.get(uploadDir);
        Files.createDirectories(dir);

        String savedName = baseName + ".jpg";   // ✅ 무조건 .jpg
        Path target = dir.resolve(savedName);

        // JPEG로 저장 (기존 파일 있으면 덮어씀)
        ImageIO.write(rgb, "jpg", target.toFile());
    }
}

