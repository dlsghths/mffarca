package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.SettingMapper;
import com.example.model.SaveSettingItem;
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

	@Override
	public List<Map<String, Object>> getHeroGroupCount(Map<String, Object> param) {
		return settingMapper.getHeroGroupCount(param);
	}

	@Override
	public void updateHeroIdx(String body) {
		 if (body == null) return;

	        body = body.trim();
	        if (body.isEmpty()) return;

	        // \n, \r\n 모두 처리
	        String[] lines = body.split("\\R");

	        for (String line : lines) {
	            if (line == null) continue;

	            line = line.trim();
	            if (line.isEmpty()) continue;

	            // type|day|slot|heroCode
	            String[] p = line.split("\\|", -1);
	            if (p.length < 3) continue;

	            String type = safe(p[0]);
	            Integer day = parseIntSafe(p[1]);
	            Integer slot = parseIntSafe(p[2]);

	            // heroCode는 없을 수도 있음(= NULL로 저장하고 싶으면 빈값 보내기)
	            String heroCode = (p.length >= 4) ? safe(p[3]) : "";

	            // 최소 검증
	            if (!("ABX".equals(type) || "ABXL".equals(type))) continue;
	            if (day == null || day < 1 || day > 28) continue;
	            if (slot == null || slot < 1 || slot > 3) continue;

	            Map<String, Object> param = new HashMap<>();
	            param.put("type", type);
	            param.put("day", day);
	            param.put("slot", slot);
	            param.put("heroCode", heroCode); // HERO.name_eng

	            settingMapper.updateSettingHeroIdxByHeroCode(param);
	        }
	}	
	

    private String safe(String s) {
        return s == null ? "" : s.trim();
    }

    private Integer parseIntSafe(String s) {
        try {
            if (s == null) return null;
            s = s.trim();
            if (s.isEmpty()) return null;
            return Integer.parseInt(s);
        } catch (Exception e) {
            return null;
        }
    }
}
