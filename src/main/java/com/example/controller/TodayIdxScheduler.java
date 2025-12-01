package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.mapper.TodayIdxMapper;

@Component
public class TodayIdxScheduler {

	@Autowired
	private TodayIdxMapper todayIdxMapper;
	
	@Scheduled(cron = "0 0 0 * * *", zone = "Asia/Seoul")
	public void updateTodayIdx() {
		todayIdxMapper.updateTodayIdx();
	}
}
