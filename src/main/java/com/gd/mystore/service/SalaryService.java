package com.gd.mystore.service;

import com.gd.mystore.dto.SalaryDto;

public interface SalaryService {
	
	// 급여 확인
	SalaryDto selectSalary(String empNo);

	
	// 급여 등록

}
