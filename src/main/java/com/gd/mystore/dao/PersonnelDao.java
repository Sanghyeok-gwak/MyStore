package com.gd.mystore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EmpMemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class PersonnelDao {

	private final SqlSessionTemplate sqlSession;
	
	public List<EmpMemberDto> selectEmpMemberList(){
		return sqlSession.selectList("personnelMapper.selectEmpMemberList");
	}
	
	public EmpMemberDto selectEmpByNo(String empNo) {
		return sqlSession.selectOne("personnelMapper.selectEmpByNo", empNo);
	}
	
	public EmpMemberDto selectEmpByName(String empName) {
		return sqlSession.selectOne("personnelMapper.selectEmpByName", empName);
	}
	
	public int insertEmp(EmpMemberDto e) {
		return sqlSession.insert("personnelMapper.insertEmp", e);
	}
	
	public int updateEmp(EmpMemberDto e) {
		return sqlSession.update("personnelMapper.updateEmp", e);
	}
	
	
	
	
}
