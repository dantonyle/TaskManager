package com.example.TaskManager.controllers;


import com.example.TaskManager.entities.Task;
import com.example.TaskManager.services.TaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;
import java.sql.Date;
import java.text.ParseException;


@Controller
public class TaskController {

    @Autowired
    TaskService taskService;

    public ModelMap showUserTasks(ModelMap model, String username) {
    	model.put("username", username);
    	model.put("tasks",  taskService.getAllTasksByUsername(username));
    	return model;
    }
    
    @RequestMapping(value="/")
    public String showTask(ModelMap model, Principal principle) {
    	model.put("username", principle.getName().toString());
    	model = showUserTasks(model, principle.getName().toString());
    	return "display-tasks";
    }
    
    @RequestMapping(value="/addTask")
	public String setTask(ModelMap model, @RequestParam("username") String username, @RequestParam("startdate") Date startDate, @RequestParam("enddate") Date endDate,
						  @RequestParam("description") String description, @RequestParam("email") String email, 
						  @RequestParam("severity") String severity) throws ParseException {
    	
		boolean saved = taskService.addTask(username,startDate,endDate,description,email,severity);
		
		if (!saved) {
			model.put("username", username);
			model = showUserTasks(model, username);
			model.put("error", "Task Save was unsuccessful");
			return "display-tasks";
		}
		model.put("username", username);
		model = showUserTasks(model, username);
		return "display-tasks";
	}
    
    
    @RequestMapping(value="/edit-this-task")
    public String showEditTask(ModelMap model, @RequestParam("id") Integer id) {
    	Task task = taskService.getTaskById(id);
		model.addAttribute("task", task);
		return "edit-task";
    }
    
    @RequestMapping(value="/edit-task")
	public String editTask(ModelMap model,  @RequestParam("id") Integer id) {
    	Task task = taskService.getTaskById(id);
    	model.addAttribute("task", task);
		return "edit-task";
	}
    
    
    @RequestMapping(value="/update-task")
    public String updateTask(ModelMap model, @RequestParam("id")Integer id, @RequestParam("startdate") Date startDate, @RequestParam("enddate") Date endDate,
			  @RequestParam("description") String description, @RequestParam("email") String email, 
			  @RequestParam("severity") String severity) throws ParseException {
    	
    	Task task = taskService.getTaskById(id);
    	
    	boolean updated = taskService.updateTaskWithId( id, startDate, endDate, description, email, severity);
		
		if (!updated) {
			model.put("username", task.getUsername());
			model = showUserTasks(model, task.getUsername());
			model.put("error", "Task Save was unsuccessful");
			return "display-tasks";
		}
		
		model.put("username", task.getUsername());
		model = showUserTasks(model, task.getUsername());
		return "display-tasks";
    }
    
    @RequestMapping(value="/complete-task")
    public String completeTask(ModelMap model, @RequestParam("id") Integer id) {
    	
    	
    	
    	Task task = taskService.getTaskById(id);
    	String username = task.getUsername();
    	taskService.DeleteTask(task);
    	
    	model.put("username", username);
		model = showUserTasks(model, username);
    	return "display-tasks";
    }
    
}
