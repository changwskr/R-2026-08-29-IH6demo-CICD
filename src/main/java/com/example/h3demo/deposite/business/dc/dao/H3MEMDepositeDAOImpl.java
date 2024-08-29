package com.example.h3demo.deposite.business.dc.dao;

import java.util.*;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.example.h3demo.deposite.business.dc.dao.model.DMember;

@Repository
public class H3MEMDepositeDAOImpl implements IH3DepositeDAO {

	// 전체 메모리 저장으로 STATIC 하게 잡아서 사용한다.
	// JVM 이 있는한 살아 있다.
	// 현재 DB 대신에 사용한다.
    private static Map<Long, DMember> store = new HashMap<>();
    private static long sequence = 0L;


	@Override
	public DMember save(DMember depositeMemberModelDDTO) {
		// TODO Auto-generated method stub
		depositeMemberModelDDTO.setId(++sequence);
        store.put(depositeMemberModelDDTO.getId(), depositeMemberModelDDTO);
        return depositeMemberModelDDTO;

	}

	@Override
	public Optional<DMember> findById(Long id) {
		// TODO Auto-generated method stub
		// 스토에서 꺼낸다.
		// store.get(id);
		// 만약 store.get(id)에서 null이 반환되는것을 막기위해 Optional를 사용한다.
		// 그래서 null 이어도 Optional 을 주면 감쌀수가 있다.

		return Optional.ofNullable(store.get(id));
	}

	@Override
	public Optional<DMember> findByName(String name) {
		// TODO Auto-generated method stub
		// store 맵에서 루팅을 돌면서 같은 이름인것을 하나라도 찾으면. 람다 이용
		return store.values().stream()
					.filter(memberDTO -> memberDTO.getName().equals(name))
					.findAny();
	}

	@Override
	public List<DMember> findAll() {
		// TODO Auto-generated method stub
		return new ArrayList <>(store.values());
	}
	
	   public void clearStore(){
	        store.clear();
	    }

}
