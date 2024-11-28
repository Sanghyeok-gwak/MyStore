package com.gd.mystore.service;

import java.util.Map;

import com.gd.mystore.dto.SalaryDto;

public interface SalaryService {
	
	// 급여 확인
	SalaryDto selectSalary(String empNo);
	
	// 급여 관리에서 조회
	SalaryDto getSalary(String empNo);
	
	// 급여 등록
	int saveSalary(SalaryDto s);
}
