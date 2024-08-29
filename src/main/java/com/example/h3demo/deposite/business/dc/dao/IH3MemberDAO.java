package com.example.h3demo.deposite.business.dc.dao;

import java.util.List;
import java.util.Optional;

import com.example.h3demo.deposite.business.dc.dao.model.H3Member;

public interface IH3MemberDAO {
    H3Member save(H3Member member);
    Optional<H3Member> findById(Long id);
    Optional<H3Member> findByName(String name);
    List<H3Member> findAll();
}