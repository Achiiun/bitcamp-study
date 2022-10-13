package com.test.tennis.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j // 로그 찍기
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }
}
