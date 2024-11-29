package com.gd.mystore.serviceimpl;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.MypageDao;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.service.MypageService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class MypageServiceImpl implements MypageService {
	
	private final MypageDao mypageDao;
	
	//private final BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화 객체


	// 마이페이지 내 정보 수정
	@Override
	public int updateEmployee(EmpMemberDto e) {
		return mypageDao.updateEmployee(e);
	}
	
	// 비밀번호 변경
	@Override
	public int passwordRecovery(EmpMemberDto e) {
		return mypageDao.passwordRecovery(e);
	}
	
	// 비밀번호 확인 검사
	@Override
	public int selectEmpPwd(String checkpwd) {
		return mypageDao.selectEmpPwd(checkpwd);
	}


}
