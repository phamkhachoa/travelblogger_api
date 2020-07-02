package com.travelblogger.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelblogger.entities.TblPost;
import com.travelblogger.repositories.IPostRepository;
import com.travelblogger.service.IPostService;

@Service
public class PostServiceImpl implements IPostService{

	@Autowired
	IPostRepository iPostRepository;
	
	@Override
	public List<TblPost> fillAll() {
		List<TblPost> list = iPostRepository.findAll();
		
		return list;
	}

}
