package com.saraelqaisi.construction.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saraelqaisi.construction.models.Review;
import com.saraelqaisi.construction.repositories.ReviewRepository;

@Service
public class ReviewService {
	@Autowired
	private ReviewRepository reviewRepo;
	
	public List<Review> allReviews(){
		return reviewRepo.findAll();
	}
	
	public Review oneReview(Long id) {
		Optional<Review> optionalReview = reviewRepo.findById(id);
		if(optionalReview.isPresent()) {
			return optionalReview.get();
		}else {
			return null;
		}
	}
	
	public Review createReview(Review review) {
		return reviewRepo.save(review);
	}
	public Review updateReview(Review review) {
		return reviewRepo.save(review);
	}
	public void deleteReview(Long id) {
		reviewRepo.deleteById(id);
	}
}
