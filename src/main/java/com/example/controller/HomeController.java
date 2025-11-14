package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/", "/tab1"})
    public String tab1(Model model) {
        model.addAttribute("pageName", "tab1");
        return "tab1";
    }

    @GetMapping("/tab2")
    public String tab2(Model model) {
        model.addAttribute("pageName", "tab2");
        return "tab2";
    }
}
