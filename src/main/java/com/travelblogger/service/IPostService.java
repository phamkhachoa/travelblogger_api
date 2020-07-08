package com.travelblogger.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.query.Param;

import com.travelblogger.entities.TblPost;

public interface IPostService {
	List<TblPost> fillAll();
	TblPost add(TblPost tblPost);
	Optional<TblPost> findById(long id);
	TblPost save(TblPost tblPost);
	TblPost delete(int id);
	List<TblPost> findLikeContent(String content);
}
