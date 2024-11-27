package com.gd.mystore.service;

import java.util.Map;

import com.gd.mystore.dto.SalaryDto;

public interface SalaryService {
	
	// 급여 확인
	SalaryDto selectSalary(String empNo);
	
}
