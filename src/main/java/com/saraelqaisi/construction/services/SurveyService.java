package com.saraelqaisi.construction.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saraelqaisi.construction.models.Survey;
import com.saraelqaisi.construction.repositories.SurveyRepository;

@Service
public class SurveyService {
	@Autowired
	private SurveyRepository surveyRepo;
	
	public List<Survey> allSurveys(){
		return surveyRepo.findAll();
	}
	
	public Survey oneSurvey(Long id) {
		Optional<Survey> optionalSurvey = surveyRepo.findById(id);
		if(optionalSurvey.isPresent()) {
			return optionalSurvey.get();
		}else {
			return null;
		}
	}
	public Survey createSurvey(Survey survey) {
		return surveyRepo.save(survey);
	}
	public Survey updateSurvey(Survey survey) {
		return surveyRepo.save(survey);
	}
	public void deleteSurvey(Long id) {
		surveyRepo.deleteById(id);
	}
	public void deleteAllSurvey() {
		surveyRepo.deleteAll();
	}
}
