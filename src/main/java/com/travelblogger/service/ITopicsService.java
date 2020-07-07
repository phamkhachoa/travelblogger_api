package com.travelblogger.service;

import java.util.List;

import com.travelblogger.entities.TblPost;
import com.travelblogger.entities.TblTopics;

public interface ITopicsService {
	List<TblTopics> fillAll();
}
