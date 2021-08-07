package com.contact.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.contact.app.model.Medical;

public interface MedicalRepository extends JpaRepository<Medical, Long> {
	
	@Query("SELECT t From medical t")
    public List<Medical> findAll();
	
}
