package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.SettingMapper;
import com.example.model.Setting;

@Service
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingMapper settingMapper;
	
	@Override
	public List<Setting> getAllSettings() {
		return settingMapper.selectAllSettings();
	}

	@Override
	public int getCombToday() {
		return settingMapper.getCombToday();
	}

	
}
