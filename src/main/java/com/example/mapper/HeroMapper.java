package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface HeroMapper {

	List<Map<String, Object>> searchHero(String keyword);
	
	List<Map<String, Object>> getAllCtp();

    void updateHeroCtp(@Param("heroId") int heroId, @Param("ctpId") int ctpId);
    
    Integer getGroupIdxByHeroId(int heroId);
}
