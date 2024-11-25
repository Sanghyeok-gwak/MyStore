package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.mystore.dao.SystemDao;
import com.gd.mystore.dao.WorkDao;
import com.gd.mystore.dto.BoardTypeDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.LogDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.SystemService;
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
	
	
	
	
}
