package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.Setting;

@Mapper
public interface SettingMapper {

	List<Setting> selectAllSettings();
	
	int getCombToday();
}
