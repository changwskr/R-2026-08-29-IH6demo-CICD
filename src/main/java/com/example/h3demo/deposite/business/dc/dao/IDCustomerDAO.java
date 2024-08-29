package com.example.h3demo.deposite.business.dc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.h3demo.deposite.business.dc.dao.model.DCustomer;

public interface IDCustomerDAO extends CrudRepository<DCustomer, Integer> {
	List<DCustomer> findByName(String name);
	List<DCustomer> findByNameLike(String name);
	List<DCustomer> findByNameAndAddress(String name, String address); // 교집합 -- And --
	List<DCustomer> findByNameOrAddress(String name, String address); // 합집합 -- Or --
	List<DCustomer> findByNameLikeOrderByAddressAsc(String name); // 이름을 가지고 데이타를 찾고 주소를 기준으로 오름차순 정렬
	List<DCustomer> findByNameLikeOrderByAddressDesc(String name); // 반대

	
	@Query(value="select * from DCustomer where name = ?1 and primary_contact = ?2", nativeQuery=true)
	List<DCustomer> findVipList(String value1, String value2);

	@Query("from DCustomer where name = ?1 and address = ?2") // 일반 JPA 문법 쿼리 기준
	List<DCustomer> findVipListK(String value1, String value2);

	@Query(value="select * from DCustomer where name = ?1 and address = ?2", nativeQuery=true)
	List<DCustomer> findVipListP(String value1, String value2);
	

	
	
//	List<DCustomer> findByNameLikeOrderByAddressDesc(String name);
//	List<DCustomer> findByNameOrAddress(String name, String address);
//	
//	@Query("from DCustomer where name = ?1 and primaryContact = ?2")
//	List<DCustomer> findVipList(String value1, String value2);
//	
//	@Query(value="select * from DCustomer where name = ?1 and primary_contact = ?2", nativeQuery=true)
//	List<DCustomer> findVipList2(String value1, String value2);
}