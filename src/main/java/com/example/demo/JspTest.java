package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspTest {
	 @RequestMapping("/member/login")
	    private String login(){
	        return "/member/login"; 
	}
}
