package com.example.model;

import java.util.List;

public class Setting {

    private String type;
    private int day;
    private int slot;
    private String attribute;
    private Integer heroIdx;
    private String note;
    
    private String name;
    private int ctpId;
    private String ctpName;
    private String ctpNameEng;
    private String color;
    private Integer groupIdx;
    
    private List<String> attributeList;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getSlot() {
		return slot;
	}

	public void setSlot(int slot) {
		this.slot = slot;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public List<String> getAttributeList() {
		return attributeList;
	}

	public void setAttributeList(List<String> attributeList) {
		this.attributeList = attributeList;
	}

	public Integer getHeroIdx() {
		return heroIdx;
	}

	public void setHeroIdx(Integer heroIdx) {
		this.heroIdx = heroIdx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCtpNameEng() {
		return ctpNameEng;
	}

	public void setCtpNameEng(String ctpNameEng) {
		this.ctpNameEng = ctpNameEng;
	}

	public int getCtpId() {
		return ctpId;
	}

	public void setCtpId(int ctpId) {
		this.ctpId = ctpId;
	}

	public String getCtpName() {
		return ctpName;
	}

	public void setCtpName(String ctpName) {
		this.ctpName = ctpName;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getGroupIdx() {
		return groupIdx;
	}

	public void setGroupIdx(Integer groupIdx) {
		this.groupIdx = groupIdx;
	}
}
