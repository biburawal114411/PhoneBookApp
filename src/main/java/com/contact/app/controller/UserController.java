package com.contact.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.contact.app.dao.MedicalRepository;
import com.contact.app.dao.UserRepository;
import com.contact.app.model.Medical;
import com.contact.app.model.User;

@Controller
public class UserController {

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private MedicalRepository medicalRepo;

	@GetMapping("")
	public String viewHomePage() {
		return "index";
	}

	@GetMapping("/login")
	public String viewIndexPage() {
		return "login";
	}

	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		model.addAttribute("user", new User());

		return "signup_form";
	}

	@PostMapping("/process")
	public String processRegister(User user) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		userRepo.save(user);

		return "success";
	}

	@GetMapping("/list_users")
	public String getAllUsers(Model model) {
		List<User> listUsers = userRepo.findAll();
		model.addAttribute("listUsers", listUsers);

		return "users";
	}

	// search functionality
	@RequestMapping(value = "/contact_search")
	public String contactSearch(Model model, @RequestParam("medlist") String medlist) {
		List<Medical> listMedical = medicalRepo.findAll();
		List<Medical> listMedicals = new ArrayList<Medical>();
		System.out.println(medlist + "haaaaaaaaaaa");
		if (medlist.equalsIgnoreCase("Arlington") || medlist.equalsIgnoreCase("Dallas")
				|| medlist.equalsIgnoreCase("FortWorth")) {
			System.out.println("inside if");
			for (Medical medical : listMedical) {
				if (medical.getCity().equalsIgnoreCase(medlist)) {
					listMedicals.add(medical);
				}
			}
		} else {
			System.out.println("inside else");
			for (Medical medical : listMedical) {
				if (medical.getOrgtype().equalsIgnoreCase(medlist)) {
					listMedicals.add(medical);
				}
			}
		}
		model.addAttribute("listMedicals", listMedicals);
		model.addAttribute("listsize", listMedicals.size());

		return "users";
	}
	
	@GetMapping("/contact_favorite")
	public String findFavorite(Model model) {
		List<User> listUsers = userRepo.findAll();
		List<User> favoriteList = userRepo.findAll();

		for (User user : listUsers) {
			if(user.getId()==4) {
				favoriteList.add(user);
			}
		}
		
		model.addAttribute("favoriteList", favoriteList);
		return "favorite";
	}
	
	
	
}
