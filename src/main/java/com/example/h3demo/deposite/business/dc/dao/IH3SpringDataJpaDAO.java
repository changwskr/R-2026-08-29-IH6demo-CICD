package com.example.h3demo.deposite.business.dc.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.h3demo.deposite.business.dc.dao.model.H3Member;

import java.util.Optional;

public interface IH3SpringDataJpaDAO extends JpaRepository<H3Member, Long>, IH3MemberDAO {
    @Override
    Optional<H3Member> findByName(String name);
}