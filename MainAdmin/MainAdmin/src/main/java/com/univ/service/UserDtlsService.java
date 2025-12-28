package com.univ.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.entity.UserDtls;
import com.univ.repo.UserDtlsRepository;

@Service
public class UserDtlsService {
	@Autowired
	private UserDtlsRepository userDtlsRepository;

	
	 // Check if email exists
    public Boolean existsEmail(String email) {
        return userDtlsRepository.existsByEmail(email);
    }

    // Get user by email and password
    public UserDtls getUserDtls(String email, String password) {
        return userDtlsRepository.findByEmailAndPassword(email, password);
    }

    // Save user
    public UserDtls save(UserDtls user) {
        return userDtlsRepository.save(user);
    }

    // ✅ Find users by role
    public List<UserDtls> findByRole(String role) {
        return userDtlsRepository.findByRole(role);
    }
	/*
	 * public List<UserDtls> findAll() { return userDtlsRepository.findAll(); }
	 * 
	 * // Utility method to validate status private boolean isValidStatus(String
	 * status) { return status != null && (status.equals("Active") ||
	 * status.equals("Inactive") || status.equals("Pending")); } public Boolean
	 * existsEmail(String email) { return userDtlsRepository.existsByEmail(email); }
	 * 
	 * // Get user by email and password public UserDtls getUserDtls(String email,
	 * String password) { return userDtlsRepository.findByEmailAndPassword(email,
	 * password); }
	 * 
	 * // Save user details public UserDtls save(UserDtls user) { return
	 * userDtlsRepository.save(user); }
	 * 
	 * 
	 * public List<UserDtls> findByRole(String id) { return
	 * userDtlsRepository.findByRole(id); } public List<UserDtls> findByRole(String
	 * role) { return userDtlsRepository.findByRole(role); }
	 */

    public List<UserDtls> getUsers(String role) {
        if (role == null || role.isEmpty()) {
            return userDtlsRepository.findAll(); // Sab users
        } else {
            return userDtlsRepository.findByRole(role); // Role ke users
        }
    }
}
