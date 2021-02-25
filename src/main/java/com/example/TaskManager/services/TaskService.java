package com.example.TaskManager.services;

import com.example.TaskManager.entities.Task;
import com.example.TaskManager.exceptions.TaskNotFoundException;
import com.example.TaskManager.repositories.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.Optional;

@Service
public class TaskService {

	@Autowired
	private TaskRepository taskRepository;

	public Iterable<Task> GetAllTasks() {
		return taskRepository.findAll();
	}

	public Iterable<Task> getAllTasksByUsername(String username) {
		return taskRepository.getAllTasksByUsername(username);
	}

	public boolean addTask(String username, Date startdate, Date enddate, String description, String email, String severity) {
       
    	try {
    	
    		Task newTask = new Task();
    		newTask.setUsername(username);
    		newTask.setStartDate(startdate);
    		newTask.setEndDate(enddate);
    		newTask.setDescription(description);
    		newTask.setEmail(email);
    		newTask.setSeverity(severity);
    		taskRepository.save(newTask);
    	
    	} catch (Exception e) {
    		return false;
    	}
    	
    	return true;
    }

	public void DeleteTask(Task task) {
		taskRepository.delete(task);
	}
	
	public boolean updateTaskWithId(Integer id, Date startdate, Date enddate, String description, String email, String severity) {
		
		
		Task task = taskRepository.getTaskById(id);
		
		task.setStartDate(startdate);
		task.setEndDate(enddate);
		task.setDescription(description);
		task.setEmail(email);
		task.setSeverity(severity);
		
		try {
			taskRepository.save(task);
		} catch (Exception e) {
			return false;
		}
		
		
		return true;
	}
	
	public Task getTaskById(Integer id) {
		return taskRepository.getTaskById(id);
	}

}
