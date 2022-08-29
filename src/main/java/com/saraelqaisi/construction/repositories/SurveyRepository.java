package com.saraelqaisi.construction.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.saraelqaisi.construction.models.Survey;

@Repository
public interface SurveyRepository extends CrudRepository<Survey, Long>{
	List<Survey> findAll();
}
