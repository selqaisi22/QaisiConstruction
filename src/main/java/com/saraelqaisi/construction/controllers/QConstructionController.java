package com.saraelqaisi.construction.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.saraelqaisi.construction.models.LoginUser;
import com.saraelqaisi.construction.models.Review;
import com.saraelqaisi.construction.models.Survey;
import com.saraelqaisi.construction.models.User;
import com.saraelqaisi.construction.services.ReviewService;
import com.saraelqaisi.construction.services.SurveyService;
import com.saraelqaisi.construction.services.UserService;

@Controller
public class QConstructionController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private SurveyService surveyService;
	
	@GetMapping("/")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "dashboard.jsp";
		}
		Long loggedID = (Long) session.getAttribute("userId");
		User user = userService.oneUser(loggedID);
		model.addAttribute("logged", user);
		return "dashboard.jsp";
	}
	
	@GetMapping("/register")
	public String renderRegistration(Model model) {
		model.addAttribute("newUser", new User());
		return "register.jsp";
	}
	@PostMapping("/register")
	public String processRegister(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		userService.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "register.jsp";
        }
        session.setAttribute("userId", newUser.getId());
        return "redirect:/";
	}
	
	
	@GetMapping("/login")
	public String renderLogin(Model model) {
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	@PostMapping("/login")
	public String processLogin(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User user = userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/about")
	public String aboutPage() {
		return "about.jsp";
	}
	
	@GetMapping("/service")
	public String servicePage() {
		return "service.jsp";
	}
	
//	----------------------------------- REVIEW -------------------------------------
	
	@GetMapping("/review")
	public String allReviews(HttpSession session, Model model) {
		List<Review> reviewList = reviewService.allReviews();
		model.addAttribute("reviewList", reviewList);
		if(session.getAttribute("userId") != null) {
			Long loggedID = (Long) session.getAttribute("userId");
			User user = userService.oneUser(loggedID);
			model.addAttribute("logged", user);
			return "reviews.jsp";
		}
		return "reviews.jsp";
	}
	
	@GetMapping("/review/add")
	public String renderNewReview(@ModelAttribute("review")Review review, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/review";
		}
		Long loggedID = (Long) session.getAttribute("userId");
		User user = userService.oneUser(loggedID);
		model.addAttribute("logged", user);
		return "newReview.jsp";
	}
	@PostMapping("/review/add")
	public String processNewReview(@Valid @ModelAttribute("review")Review review, BindingResult result) {
		if(result.hasErrors()) {
			return "newReview.jsp";
		}else {
			reviewService.createReview(review);
			return "redirect:/review";
		}
	}
	
	@GetMapping("/review/edit/{id}")
	public String renderEditReview(@PathVariable("id")Long id, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/review";
		}
		model.addAttribute("review", reviewService.oneReview(id));
		
		Long loggedID = (Long) session.getAttribute("userId");
		User user = userService.oneUser(loggedID);
		model.addAttribute("logged", user);
		
		return "editReview.jsp";
	}
	@PutMapping("/review/edit/{id}")
	public String processEditReview(@Valid @ModelAttribute("review")Review review, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "editReview.jsp";
		}else {
			reviewService.updateReview(review);
			return "redirect:/review";
		}
	}
	
	@DeleteMapping("/review/delete/{id}")
	public String deleteReview(@PathVariable("id")Long id) {
		reviewService.deleteReview(id);
		return "redirect:/review";
	}
	
//	----------------------------------- SURVEY -------------------------------------
	

	@GetMapping("/surveys")
	public String allSurveys(HttpSession session, Model model) {
		if((Long) session.getAttribute("userId") != 1) {
			return "redirect:/";
		}
		List<Survey> surveyList = surveyService.allSurveys();
		model.addAttribute("surveyList", surveyList);
		
		Long loggedID = (Long) session.getAttribute("userId");
		User user = userService.oneUser(loggedID);
		model.addAttribute("logged", user);
		return "/survey/surveys.jsp";
	}
	
	@GetMapping("/survey/add")
	public String renderNewSurvey(@ModelAttribute("survey")Survey survey, HttpSession session, Model model) {
		if(session.getAttribute("userId") != null && (Long) session.getAttribute("userId") == 1) {
			Long loggedID = (Long) session.getAttribute("userId");
			User user = userService.oneUser(loggedID);
			model.addAttribute("logged", user);
			return "/survey/newSurvey.jsp";
		}
		return "/survey/newSurvey.jsp";
	}
	@PostMapping("/survey/add")
	public String processNewSurvey(@Valid @ModelAttribute("survey")Survey survey, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			return "/survey/newSurvey.jsp";
		}else {
			surveyService.createSurvey(survey);
			if(session.getAttribute("userId") != null && (Long) session.getAttribute("userId") == 1) {
				Long loggedID = (Long) session.getAttribute("userId");
				User user = userService.oneUser(loggedID);
				model.addAttribute("logged", user);
				return "/survey/thankyou.jsp";
			}
			return "/survey/thankyou.jsp";
		}
	}
	
	@DeleteMapping("/survey/deleteOne/{id}")
	public String deleteOneSurvey(@PathVariable("id")Long id) {
		surveyService.deleteSurvey(id);
		return "redirect:/surveys";
	}
	
	@DeleteMapping("/survey/deleteAll")
	public String deleteAllSurvey() {
		surveyService.deleteAllSurvey();
		return "redirect:/surveys";
	}
	
}
