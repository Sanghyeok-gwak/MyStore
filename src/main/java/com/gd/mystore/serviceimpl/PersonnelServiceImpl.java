package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.PersonnelDao;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.PersonnelService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	private final PersonnelDao personnelDao; 

	@Override
	public List<EmpMemberDto> selectEmpList() {
		return personnelDao.selectEmpMemberList();
	}

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


}
