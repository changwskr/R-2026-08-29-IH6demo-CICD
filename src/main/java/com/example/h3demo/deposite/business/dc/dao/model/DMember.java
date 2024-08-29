package com.example.h3demo.deposite.business.dc.dao.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import lombok.Data;

@Data
@Entity
public class DMember {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id; // 시스템이 정하는 아이디
    private String name;

	@Column(length=1024)
	private String address;
	private String contact;


   
}