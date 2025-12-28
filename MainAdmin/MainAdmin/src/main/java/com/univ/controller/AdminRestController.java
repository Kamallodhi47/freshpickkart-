package com.univ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.univ.entity.UserDtls;
import com.univ.service.UserDtlsService;

@RestController
@RequestMapping("/admin/api")
public class AdminRestController {
	 @Autowired
	    private UserDtlsService userDtlsService;

	    @PostMapping("/receiveSeller")
	    public String receiveSeller(@RequestBody UserDtls user) {
	        // Seller ko save ya process karo
	        System.out.println("Received seller from User service: " + user);
	        return "Seller received successfully!";
	    }
}
