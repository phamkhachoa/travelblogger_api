package com.travelblogger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.travelblogger.entities.TblTopics;
import com.travelblogger.repositories.ITopicsRepository;
import com.travelblogger.service.ITopicsService;

@Service
public class TopicsServiceImpl implements ITopicsService{
	
	@Autowired
	ITopicsRepository iTopicsRepository;
	
	@Override
	public List<TblTopics> fillAll() {
		return iTopicsRepository.findAll();
	}

}
