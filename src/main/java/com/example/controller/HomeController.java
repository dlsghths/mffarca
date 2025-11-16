package com.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.model.Setting;
import com.example.service.SettingService;

@Controller
public class HomeController {

	@Autowired
	private SettingService settingService;
	
    @GetMapping({"/", "/tab1"})
    public String tab1(Model model) {
    	List<Setting> settings = settingService.getAllSettings();
    	
    	for (Setting s : settings) {
            if (s.getAttribute() != null) {
                s.setAttributeList(Arrays.asList(s.getAttribute().split(",")));
            } else {
                s.setAttributeList(new ArrayList<>());
            }
        }
    	
    	int combToday = settingService.getCombToday();
    	
    	model.addAttribute("settings", settings);
    	model.addAttribute("combToday", combToday);
        model.addAttribute("pageName", "tab1");
        return "tab1";
    }

    @GetMapping("/tab2")
    public String tab2(Model model) {
        model.addAttribute("pageName", "tab2");
        return "tab2";
    }
}
