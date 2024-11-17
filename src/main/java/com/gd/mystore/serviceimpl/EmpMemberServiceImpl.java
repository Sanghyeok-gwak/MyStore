package com.gd.mystore.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.mystore.dao.EmpMemberDao;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.EmpMemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EmpMemberServiceImpl implements EmpMemberService {
	private final EmpMemberDao empMemberDao;
	
	public EmpMemberDto selectEmpMember(EmpMemberDto em) {
		System.out.println("서비스 집입 : " + em.getEmpNo());
		return empMemberDao.selectEmpMember(em);
	}

	
}
