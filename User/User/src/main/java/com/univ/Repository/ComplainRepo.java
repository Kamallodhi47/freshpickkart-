package com.univ.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.univ.entity.Complain;

public interface ComplainRepo extends JpaRepository<Complain, Integer> {
}
