package com.example.h3demo.deposite.business.dc.dao;

import java.util.List;
import java.util.Optional;

import com.example.h3demo.deposite.business.dc.dao.model.DMember;



public interface IH3DepositeDAO {
	
	DMember save(DMember memberDto);
	Optional<DMember> findById(Long id);
	Optional<DMember> findByName(String name);
	List<DMember> findAll();
//	Optional<DMember> findByNameAndId(String name, Long id);

}
