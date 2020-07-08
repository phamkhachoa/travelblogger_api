package com.travelblogger.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

	@Override
	public TblPost add(TblPost tblPost) {
		return iPostRepository.save(tblPost);
	}

	@Override
	public Optional<TblPost> findById(long id) {
		return iPostRepository.findById((int) id);
	}

	@Override
	public TblPost save(TblPost tblPost) {
		return iPostRepository.save(tblPost);
	}

	@Override
	public TblPost delete(int id) {
		TblPost tblPost = iPostRepository.getOne(id);
		tblPost.setActiveFlag(0);
		return iPostRepository.save(tblPost);
	}

	@Override
	public List<TblPost> findLikeContent(String content) {
		return iPostRepository.findLikeContent(content);
	}

}
