package com.example.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.HeroMapper;

@Controller
@RequestMapping("/hero")
public class HeroController {

	@Autowired
    private HeroMapper heroMapper;

    @GetMapping("/search")
    public String searchHero(@RequestParam(required = false) String keyword, Model model) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<Map<String, Object>> heroList = heroMapper.searchHero(keyword);
            List<Map<String, Object>> ctpList = heroMapper.getAllCtp(); // CTP 전체 목록
            model.addAttribute("heroList", heroList);
            model.addAttribute("ctpList", ctpList);
        }
        return "searchHero";
    }
    
    @PostMapping("/updateCtp")
    public String updateCtp(@RequestParam int heroId,
                            @RequestParam int ctpId,
                            @RequestParam(required = false) String keyword) {
        heroMapper.updateHeroCtp(heroId, ctpId);
        if(keyword != null && !keyword.isEmpty()) {
            return "redirect:/hero/search?keyword=" + keyword;
        }
        return "redirect:/hero/search";
    }
}
