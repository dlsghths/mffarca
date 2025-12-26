package com.example.mapper;

public interface ArenaConfigMapper {
    String selectArenaNote();
    int upsertArenaNote(String note);
}
