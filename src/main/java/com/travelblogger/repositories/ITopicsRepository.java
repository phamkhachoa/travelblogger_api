package com.travelblogger.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.travelblogger.entities.TblTopics;

public interface ITopicsRepository extends JpaRepository<TblTopics, Integer>{

}
