package com.example.TaskManager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.example.TaskManager.services.UserService;

@Controller
public class RegisterController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/register")
	public String showRegister(ModelMap model) {
		return "register";
	}
	
	@RequestMapping(value= "/register-new")
	public String registerNew(ModelMap model, @RequestParam String username, @RequestParam String password, @RequestParam String email) {
		
		try {
			userService.addNewUser(username, password, email);
			
		} catch(UsernameNotFoundException e) {
			model.put("error", "Database Issue");
			return "register";
			
		}
		
		model.put("username", username);
		return "register-successful";
	}
	
	
	@RequestMapping(value= "/register-successful")
	public String successfullyRegistered() {
		return "register-successful";
	}
	
	@RequestMapping(value="/login_New", params="login_Btn", method = RequestMethod.GET)
    public String showNewRegiseter() {
    	return "redirect:login";
    }

	
	
}
