package com.example.TaskManager.repositories;

import com.example.TaskManager.entities.Task;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

public interface TaskRepository extends CrudRepository<Task, Integer>{

	public Iterable<Task> getAllTasksByUsername(String username);
	
	public Task getTaskById(Integer id);
}
