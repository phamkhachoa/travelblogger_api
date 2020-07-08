package com.travelblogger.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.travelblogger.entities.TblPost;

@Repository
public interface IPostRepository extends JpaRepository<TblPost, Integer>{

	@Query("SELECT p FROM TblPost p WHERE p.content LIKE CONCAT('%',:content,'%') ")
	 List<TblPost> findLikeContent(@Param("content") String content);
}
