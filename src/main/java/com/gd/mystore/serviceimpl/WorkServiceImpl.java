package com.gd.mystore.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.WorkDao;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.WorkDto;
import com.gd.mystore.service.WorkService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class WorkServiceImpl implements WorkService {
	
	private final WorkDao workDao;
	
	@Override
	public void insertEmpWork() {
		workDao.empAllWorkInser();
	}

	@Override
	public List<WorkDto> selectWorkCheck(EmpMemberDto em) {
		Date workDay = new Date();
		
		return workDao.selectWorkCheck(em);
	}

	@Override
	public int updateStTime(EmpMemberDto em) {
		return workDao.updateStTime(em);
	}

	@Override
	public int updateEndTime(EmpMemberDto em) {
		return workDao.upydateStTime(em);
	}
	
	
	
	
}
