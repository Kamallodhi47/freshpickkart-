package com.univ.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.univ.entity.UserDtls;

public interface UserDtlsRepository extends JpaRepository<UserDtls, Integer> {
	//List<UserDtls> findByRole(Integer id);
	//List<UserDtls> findByRole(String role);

    // Optional: Email se user fetch karne ke liye
   // UserDtls findByEmail(String email);

    // Optional: Email existence check
    Boolean existsByEmail(String email);

    // Optional: Email + Password se login
    UserDtls findByEmailAndPassword(String email, String password);
	List<UserDtls> findByRole(String role);
	//List<UserDtls> findAllByOrderByRegistrationDateDesc();
   // List<UserDtls> findByStatusOrderByRegistrationDateDesc(String status);
    
    // Search methods
   // List<UserDtls> findByNameContainingIgnoreCase(String name);
   // List<UserDtls> findByEmailContainingIgnoreCase(String email);
   //<UserDtls> findByBusinessNameContainingIgnoreCase(String businessName);
    
    // Existence checks
   // boolean existsByEmail(String email);
    boolean existsByMobileNumber(String mobileNumber);
  //  boolean existsByGstNumber(String gstNumber);
    
    // Count methods
  //  long countByStatus(String status);
    
    // Custom search query
   // @Query("SELECT s FROM Seller s WHERE " +
        ///   "LOWER(s.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
        //   "LOWER(s.email) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
         //  "LOWER(s.businessName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
         //  "LOWER(s.mobileNumber) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
         //  "LOWER(s.city) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
         //  "LOWER(s.state) LIKE LOWER(CONCAT('%', :keyword, '%'))")
   // List<UserDtls> searchSellers(@Param("keyword") String keyword);
    
    // Find by email (for login/authentication)
    Optional<UserDtls> findByEmail(String email);
}
