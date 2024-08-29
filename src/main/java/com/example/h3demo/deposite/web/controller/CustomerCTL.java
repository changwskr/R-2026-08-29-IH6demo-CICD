package com.example.h3demo.deposite.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.example.h3demo.deposite.business.dc.dao.IDCustomerDAO;
import com.example.h3demo.deposite.business.dc.dao.model.DCustomer;

@RestController
public class CustomerCTL {

	private IDCustomerDAO repository;

	public CustomerCTL(IDCustomerDAO repository) {
		super();
		this.repository = repository;
	}

	// 하나의 데이타를 생성한다.
	/**
	 * POSTMAN을 이용한다.
	 * PUT 방식 
	 * http://127.0.0.1:8080/customer?id=1&name=홍길동&address=대치동
	 */
	
	@PutMapping("/customer")
	public DCustomer putDCustomer(DCustomer customer) {
		System.out.println("PUT-" + customer.getId());

		return repository.save(customer);
	}
	
	@PutMapping("/customer/{id}")
	public void putCustomer(@PathVariable("id") int id, DCustomer customer) {
		System.out.println("PUT-" + id);
		
		repository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "no customer found"));
		customer.setId(id);
		repository.save(customer);
	}

	@PostMapping("/customer")
	public DCustomer postCustomer(DCustomer customer) {
		return repository.save(customer);
	}
	

	@DeleteMapping("/customer/{id}")
	public void deleteCustomer(@PathVariable("id") int id) {
		repository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "no customer found"));
		repository.deleteById(id);
	}
	
	@GetMapping("/customer/{id}")
	public DCustomer getCustomer(@PathVariable("id") int id) {
		return repository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "no customer found"));
	}
	
//	@GetMapping("/customer/search")
//	public List<DCustomer> searchCustomer(String name) {
//		return repository.findByNameLike("%" + name + "%");
//	}
	
	@GetMapping("/customer/list")
	public List<DCustomer> getCustomerList() {
		return (List<DCustomer>) repository.findAll();
	}
}
