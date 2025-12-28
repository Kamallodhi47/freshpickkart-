package com.univ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.Repository.ComplainRepo;
import com.univ.entity.Complain;

import com.univ.service.ComplainService;

@Service
public class ComplainService  {

       private ComplainRepo complainRepository;

    
       public Complain saveComplaint(Complain complain) {
           return complainRepository.save(complain);
       }
}
