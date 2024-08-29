package com.example.h3demo.deposite.business.dc.dao;

import java.util.List;
import java.util.Optional;

import com.example.h3demo.deposite.business.dc.dao.model.DMember;
import com.example.h3demo.deposite.business.dc.dao.model.H3Member;

import jakarta.persistence.EntityManager;

public class H3JPADepositeDAOImpl implements IH3DepositeDAO {

    private final EntityManager em; //JPA 기술은 EntityManager를 통해서 동작한다.

    public H3JPADepositeDAOImpl(EntityManager em) {
        this.em = em;
    }


	

	@Override
    public DMember save(DMember member) {
        em.persist(member);
        return member;
    }

    @Override
    public Optional<DMember> findById(Long id) {
        DMember member = em.find(DMember.class, id);
        return Optional.ofNullable(member);
    }

    @Override
    public Optional<DMember> findByName(String name) {
        //List<DMember> result = em.createQuery("select m from DMember m where m.name = :name", DMember.class)
        List<DMember> result = em.createQuery("select m from DMember m where m.name = :name")        		
                .setParameter("name", name)
                .getResultList();
        
        return result.stream().findAny();
    }

    @Override
    public List<DMember> findAll() {
        //List<DMember> result = em.createQuery("select m from DMember m", DMember.class).getResultList();
        List<DMember> result = em.createQuery("select m from DMember m").getResultList();
        return result;
    }
}
