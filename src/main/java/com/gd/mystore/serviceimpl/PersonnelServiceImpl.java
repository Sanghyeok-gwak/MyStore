package com.gd.mystore.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.PersonnelDao;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.SalaryDto;
import com.gd.mystore.service.PersonnelService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	private final PersonnelDao personnelDao; 

	/* 그냥 조회용
	@Override
	public List<EmpMemberDto> selectEmpList() {
		return personnelDao.selectEmpMemberList();
	}
	*/
	
	@Override
	public EmpMemberDto selectEmpByNo(String empNo) {
		return personnelDao.selectEmpByNo(empNo);
	}

	@Override
	public EmpMemberDto selectEmpByName(String empName) {
		return personnelDao.selectEmpByName(empName);
	}

	@Override
	public int insertEmp(EmpMemberDto e) {
		return personnelDao.insertEmp(e);
	}

	@Override
	public int updateEmp(EmpMemberDto e) {
		return personnelDao.updateEmp(e);
	}

	@Override
	public int updatequit(EmpMemberDto e) {
		return personnelDao.updatequit(e);
	}
	
	@Override
	public int selectEmpListCount() {
		return personnelDao.selectEmpListCount();
	}

	@Override
	public List<EmpMemberDto> selectEmpList(PageInfoDto pi) {
		return personnelDao.selectEmpList(pi);
	}

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return personnelDao.selectSearchListCount(search);
	}

	@Override
	public List<EmpMemberDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return personnelDao.selectSearchList(search, pi);
	}

	@Override
	public int workInsertEmp(EmpMemberDto e) {
		return personnelDao.workInsertEmp(e);
		
	}



}
