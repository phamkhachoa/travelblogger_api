package com.travelblogger.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.travelblogger.entities.TblPost;
import com.travelblogger.service.IPostService;

@RestController
@RequestMapping("/api/posts")
public class PostController {
	
	@Autowired
	IPostService iPostService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public List<TblPost> findAll() {
		List <TblPost> list = iPostService.fillAll();
		return list;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public TblPost addPost(@RequestBody TblPost tblPost) {
		return iPostService.add(tblPost);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public TblPost findById(@PathVariable Long id) {
		return iPostService.findById(id).get();
	}
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public TblPost update(@RequestBody TblPost tblPost) {
		return iPostService.save(tblPost);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public TblPost deleteById(@PathVariable long id) {
		return iPostService.delete((int) id);
	}
	
	@RequestMapping(value = "/findLikeContent", method = RequestMethod.GET)
	public List<TblPost> findLikeContent(@RequestParam String content, @RequestParam String temp) {
		return iPostService.findLikeContent(content);
	}
}
