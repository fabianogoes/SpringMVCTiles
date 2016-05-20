package com.eprogramar.sampletiles;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping
	public String login(){
		return "login";
	}

	@RequestMapping(method=RequestMethod.POST)
	public String in(String username, String passowrd, HttpSession session, Model model){
		
		if ( StringUtils.isEmpty(username) || StringUtils.isEmpty(passowrd) ){
			model.addAttribute("loginError", "Invalid Login!");
			return "login";
		}
		
		session.setAttribute("username", username);
		return "redirect:/";
	}
	
}
