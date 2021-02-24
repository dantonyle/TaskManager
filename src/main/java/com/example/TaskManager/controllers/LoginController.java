package com.example.TaskManager.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	
    @RequestMapping(value="/login")
    public String showLoginPage(ModelMap model){
        return "login";
    }
    
    @RequestMapping(value="/register_New", params="register_Btn", method = RequestMethod.GET)
    public String showNewRegiseter() {
    	return "redirect:register";
    }

}
