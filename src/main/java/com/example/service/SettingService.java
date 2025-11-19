package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.model.Setting;

public interface SettingService {

	List<Setting> getAllSettings();
	
	int getCombToday();
	
	List<Map<String, Object>> getHeroGroupCount(Map<String, Object> param);
}
