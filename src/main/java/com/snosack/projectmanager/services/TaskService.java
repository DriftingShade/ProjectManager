package com.snosack.projectmanager.services;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snosack.projectmanager.models.Task;
import com.snosack.projectmanager.repositories.TaskRepository;

@Service
public class TaskService {
	
	@Autowired
	private TaskRepository taskRepository;
	
	public List<Task> findAllTasksByProjectId(Long projectId) {
		return taskRepository.findAllByProjectId(projectId);
	}
	
	public void saveTask(Task task) {
        taskRepository.save(task);
    }
}
