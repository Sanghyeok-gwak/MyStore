package com.gd.mystore.serviceimpl;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.SalaryDao;
import com.gd.mystore.dto.SalaryDto;
import com.gd.mystore.service.SalaryService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SalaryServiceImpl implements SalaryService {
	
	private final SalaryDao salarydao;
	
	//급여조회
	@Override
	public SalaryDto selectSalary(String empNo) {
		return salarydao.selectsalary(empNo);
	}

	@Override
	public SalaryDto getSalary(String empNo) {
		return salarydao.getSalary(empNo);
	}

	@Override
	public int saveSalary(SalaryDto s) {
		return salarydao.saveSalary(s);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
