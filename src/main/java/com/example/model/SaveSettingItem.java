package com.example.model;

import java.util.List;

public class SaveSettingItem {
    private String type;     // "ABX" or "ABXL"
    private Integer day;
    private Integer slot;
    private String heroCode; // ✅ HERO.name_eng
    // getters/setters
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public Integer getSlot() {
		return slot;
	}
	public void setSlot(Integer slot) {
		this.slot = slot;
	}
	public String getHeroCode() {
		return heroCode;
	}
	public void setHeroCode(String heroCode) {
		this.heroCode = heroCode;
	}
}
