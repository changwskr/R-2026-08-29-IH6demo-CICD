package com.example.h3demo.deposite.business.dc.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import com.example.h3demo.deposite.business.dc.dao.model.DMember;
import com.example.h3demo.deposite.business.dc.dao.model.H3Member;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public class H3JDBCTemplateDepositeDAOImpl implements IH3DepositeDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public H3JDBCTemplateDepositeDAOImpl(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public DMember save(DMember member) {
        SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
        jdbcInsert.withTableName("dmember").usingGeneratedKeyColumns("id");
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("name", member.getName());
        Number key = jdbcInsert.executeAndReturnKey(new MapSqlParameterSource(parameters));
        member.setId(key.longValue());
        return member;
    }

    @Override
    public Optional<DMember> findById(Long id) {
        List<DMember> result = jdbcTemplate.query("select * from dmember where id = ?", memberRowMapper(), id);
        return result.stream().findAny();
    }

    @Override
    public Optional<DMember> findByName(String name) {
        List<DMember> result = jdbcTemplate.query("select * from dmember where name = ?", memberRowMapper(), name);
        return result.stream().findAny();
    }

    @Override
    public List<DMember> findAll() {
        return jdbcTemplate.query("select * from dmember", memberRowMapper());
    }

    private RowMapper<DMember> memberRowMapper(){
    	return 
    		new RowMapper<DMember>() {
    			@Override
    			public DMember mapRow(ResultSet rs, int rowNum) throws SQLException 
    			{
    				DMember member = new DMember();
    				member.setId(rs.getLong("id"));
    				member.setName(rs.getString("name"));
    				return member;    		
    			}
    	
    		};

//          return (rs, rowNum) -> {
//          DMember member = new DMember();
//          member.setId(rs.getLong("id"));
//          member.setName(rs.getString("name"));
//          return member;
//      };

    }
}