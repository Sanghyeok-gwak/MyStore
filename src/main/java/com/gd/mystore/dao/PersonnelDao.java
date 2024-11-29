package com.gd.mystore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.SalaryDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class PersonnelDao {

	private final SqlSessionTemplate sqlSession;
	
	/* 페이징없이 사원 목록 조회
	public List<EmpMemberDto> selectEmpMemberList(){
		return sqlSession.selectList("personnelMapper.selectEmpMemberList");
	}
	*/
	/* 페이징 포함 조회*/
	public int selectEmpListCount(){
		return sqlSession.selectOne("personnelMapper.selectEmpListCount");
	}
	/* 페이징 포함 조회*/
	public List<EmpMemberDto> selectEmpList(PageInfoDto pi){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("personnelMapper.selectEmpList", null, rowBounds);
	}
	
	/* 검색 조회하면서 페이징 */
	public int selectSearchListCount(Map<String, String> search) {
		return sqlSession.selectOne("personnelMapper.selectSearchListCount", search);
	}
	/* 검색 조회하면서 페이징 */
	public List<EmpMemberDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1) * pi.getBoardLimit() ,pi.getBoardLimit());
		return sqlSession.selectList("personnelMapper.selectSearchList", search, rowBounds);
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
	
	public int updatequit(EmpMemberDto e) {
		return sqlSession.update("personnelMapper.updatequit", e);
	}
	public int workInsertEmp(EmpMemberDto e) {
		return sqlSession.insert("personnelMapper.newEmpInsert", e);
	}
	
	
	
}
