package com.univ.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.univ.entity.Category;
@Repository
public interface CategoryRepo extends JpaRepository<Category, Integer> {
	// List<Category> findByIsActiveTrue();

}
