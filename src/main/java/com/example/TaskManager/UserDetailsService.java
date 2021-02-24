package com.example.TaskManager;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.TaskManager.entities.User;
import com.example.TaskManager.repositories.UserRepository;


@Service
public class UserDetailsService
		implements org.springframework.security.core.userdetails.UserDetailsService {
	
	@Autowired
	UserRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = repo.findByUsername(username);
		
		if(user == null) {
			throw new UsernameNotFoundException("User 404");
		}
		
		return new UserDetailsImple(user);
	}
	
	
}
