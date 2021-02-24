package com.example.TaskManager.services;

import com.example.TaskManager.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.TaskManager.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    PasswordEncoder passwordEncoder;

    public boolean addNewUser(String username, String password, String email) {
    	
    	try {
    		User user = new User();
    		user.setUsername(username);
    		user.setPassword(passwordEncoder.encode(password));
    		user.setEmail(email);
    		
    		userRepository.save(user);
    	} catch (Exception e) {
    		System.out.println(e.getMessage().toString());
    		return false;
    	}
    	
    	return true;
    	
    }
  
    

    public User GetUserByUsername(String username) {
        User foundUser = userRepository.findByUsername(username);
        return foundUser;
    }
    
    
    
    
}
