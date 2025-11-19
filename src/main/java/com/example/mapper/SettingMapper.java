package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.Setting;

@Mapper
public interface SettingMapper {

	List<Setting> selectAllSettings();
	
	int getCombToday();
	
	List<Map<String, Object>> getHeroGroupCount(Map<String, Object> map);
}
