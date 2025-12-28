package com.univ.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.univ.entity.UserDtls;
import com.univ.repo.UserDtlsRepository;
import com.univ.service.UserDtlsService;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("admin")
public class Mainseller {
@RequestMapping("/")
public String index()
{
	return"index";
}

@Autowired
private UserDtlsService userDtlsService;
@Autowired
private UserDtlsRepository userDtlsRepository;
@GetMapping("sellers")
public String viewSellers(Model m) {
	List<UserDtls> sellers = userDtlsService.findByRole("SELLER");
	m.addAttribute("sellers", sellers);
	return "sellers"; // JSP page showing seller list
}

@GetMapping("/activateSeller/{id}")
public String activateSeller(@PathVariable Integer id, HttpSession session) {
	UserDtls seller = userDtlsRepository.findById(id).orElse(null);
	if (seller != null) {
		seller.setIsEnable(true);
		userDtlsRepository.save(seller);
		session.setAttribute("msg", "Seller approved successfully!");
	}
	return "redirect:http://localhost:8083/Login";
}

@GetMapping("/users")
public String getAllUsers(Model m, @RequestParam Integer type) {
	List<UserDtls> users = null;
	if (type == 1) {
		users = userDtlsService.getUsers("ROLE_USER");
	} else {
		users = userDtlsService.getUsers("ROLE_SELLER");
	}
	m.addAttribute("userType",type);
	m.addAttribute("users", users);
	return "";
}



}

  
