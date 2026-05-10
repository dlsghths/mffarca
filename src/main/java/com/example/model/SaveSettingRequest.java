package com.example.model;

import java.util.List;

public class SaveSettingRequest {
    private List<SaveSettingItem> list;
    public List<SaveSettingItem> getList() { return list; }
    public void setList(List<SaveSettingItem> list) { this.list = list; }
}
