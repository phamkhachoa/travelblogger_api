package com.travelblogger.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travelblogger.entities.TblTopics;
import com.travelblogger.service.ITopicsService;

@RestController
public class TopicsController {

	@Autowired
	ITopicsService iTopicsService;
	
	@GetMapping("/topics")
	public List<TblTopics> findAll(){
		List<TblTopics> list = iTopicsService.fillAll();
		return list;
	}
	
	
}
