package com.gd.mystore.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.SalaryDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class SalaryDao {
	
	private final SqlSession sqlsession;
	
	public SalaryDto selectsalary(String empNo) {
		return sqlsession.selectOne("salaryMapper.selectsalary", empNo);
		
	}
	
	public SalaryDto getSalary(String empNo) {
		return sqlsession.selectOne("personnelMapper.getSalary", empNo);
	}
	
	public int saveSalary(SalaryDto s) {
		return sqlsession.insert("personnelMapper.saveSalary", s);
	}
	
	
	
	
	
	
	
	
	
}
