package com.example.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.AccessLogMapper;
import com.example.mapper.HeroMapper;
import com.example.model.Setting;
import com.example.service.SettingService;

@Controller
public class HomeController {

	@Autowired
	private SettingService settingService;
	
	@Autowired
	private AccessLogMapper accessLogMapper;
	
	@Autowired
    private HeroMapper heroMapper;
	
    @GetMapping({"/", "/tab1"})
    public String tab1(@RequestParam(required = false) Integer focusHero, Model model) {
    	Integer focusGroup = null;
        if (focusHero != null) {
            focusGroup = heroMapper.getGroupIdxByHeroId(focusHero);
        }
    	
    	List<Setting> settings = settingService.getAllSettings();
    	
    	for (Setting s : settings) {
            if (s.getAttribute() != null) {
                s.setAttributeList(Arrays.asList(s.getAttribute().split(",")));
            } else {
                s.setAttributeList(new ArrayList<String>());
            }
            
            if (s.getHeroIdx() != null) {
                Integer groupIdx = heroMapper.getGroupIdxByHeroId(s.getHeroIdx());
                s.setGroupIdx(groupIdx);
            } else {
            	s.setGroupIdx(s.getHeroIdx());
            }
        }
    	
    	int combToday = settingService.getCombToday();
    	
    	model.addAttribute("settings", settings);
    	model.addAttribute("combToday", combToday);
        model.addAttribute("pageName", "tab1");
        model.addAttribute("focusGroup", focusGroup);
        
        LocalDate today = LocalDate.now();
        String url = "/";
        if ("tab1".equals(model.getAttribute("pageName"))) {
            url = "/tab1";
        }
        Map<String, Object> log = accessLogMapper.getAccessLog(url, java.sql.Date.valueOf(today));
        if (log == null) {
            accessLogMapper.insertAccessLog(url, java.sql.Date.valueOf(today));
        } else {
            accessLogMapper.updateAccessLog(url, java.sql.Date.valueOf(today));
        }
        
        return "tab1";
    }

    @GetMapping("/tab2")
    public String tab2(Model model, HttpServletRequest request) {
    	String sort = request.getParameter("sort");
    	String orderBy = "h2.name_kor ASC"; // 기본값: 사용 횟수 내림차순

    	if ("name".equals(sort)) {
    	    orderBy = "h2.name_kor ASC";
    	} else if ("count".equals(sort)) {
    	    orderBy = "use_cnt DESC";
    	}
    	
    	// CTP 체크박스 필터
        String[] ctpArray = request.getParameterValues("ctpList"); // 복수 선택 가능
        List<String> ctpList = null;
        if (ctpArray != null && ctpArray.length > 0) {
            ctpList = Arrays.asList(ctpArray);
            // 전체 선택 시 필터 해제
            if (ctpList.contains("전체")) {
                ctpList = null;
            }
        }
    	
    	Map<String, Object> param = new HashMap<>();
    	param.put("orderBy", orderBy);
    	param.put("ctpList", ctpList);
    	
    	List<Map<String, Object>> heroGroupCountList = settingService.getHeroGroupCount(param);
    	model.addAttribute("heroGroupCountList", heroGroupCountList);
        model.addAttribute("pageName", "tab2");
        model.addAttribute("sort", sort != null ? sort : "name"); // JSP에서 버튼 색상 유지
        model.addAttribute("ctpList", ctpList); // JSP 체크박스 상태 유지
        return "tab2";
    }
    
    @GetMapping("/tab3")
    public String tab3(Model model) {
    	String challengerImage = "challenger.jpg";   // /resources/images/arena/challenger.png
	    String vibraniumImage  = "vibranium.jpg";    // /resources/images/arena/vibranium.png

	    model.addAttribute("challengerImage", challengerImage);
	    model.addAttribute("vibraniumImage", vibraniumImage);
	    model.addAttribute("pageName", "tab3");
    	
    	return "arena";
    }
}
