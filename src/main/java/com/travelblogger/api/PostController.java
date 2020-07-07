package com.travelblogger.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travelblogger.entities.TblPost;
import com.travelblogger.service.IPostService;

@RestController
public class PostController {
	
	@Autowired
	IPostService iPostService;
	
	@RequestMapping(value = "/home")
	public List<TblPost> findAll() {
		List <TblPost> list = iPostService.fillAll();
		return list;
	}
}
