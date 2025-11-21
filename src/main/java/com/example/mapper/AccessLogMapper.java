package com.example.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AccessLogMapper {

	Map<String, Object> getAccessLog(@Param("url") String url, @Param("accessDate") java.sql.Date accessDate);
    void insertAccessLog(@Param("url") String url, @Param("accessDate") java.sql.Date accessDate);
    void updateAccessLog(@Param("url") String url, @Param("accessDate") java.sql.Date accessDate);
}
