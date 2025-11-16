package com.example.service;

import java.util.List;

import com.example.model.Setting;

public interface SettingService {

	List<Setting> getAllSettings();
	
	int getCombToday();
}
