package com.travelblogger.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.travelblogger.entities.TblPost;

@Repository
public interface IPostRepository extends JpaRepository<TblPost, Integer>{

}
