package com.gd.mystore.serviceimpl;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.EmpMemberDao;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.EmpMemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class EmpMemberServiceImpl implements EmpMemberService {
	private final EmpMemberDao empMemberDao;
	
	@Override
	public EmpMemberDto selectEmpMember(EmpMemberDto em) {
		return empMemberDao.selectEmpMember(em);
	}

	@Override
	public int updatePwdMember(EmpMemberDto em) {
		return empMemberDao.updatePwdMember(em);
	}

	
}
