package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.dto.WorkStatusDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MypageDao {
	
	private final SqlSessionTemplate sqlSession;

	// 마이페이지 수정
	public int updateEmployee(EmpMemberDto e) {
		return sqlSession.update("personnelMapper.updateEmployee", e);
	}
	
	// 비밀번호 변경
	public int passwordRecovery(EmpMemberDto e) {
		return sqlSession.update("personnelMapper.passwordRecovery", e);
	}
	
	// 비밀번호 확인
	public int selectEmpPwd(String checkpwd)	{
		return sqlSession.selectOne("personnelMapper.selectEmpPwd", checkpwd);
	}
	
	public int selectworkStatusCount(int empNo) {
		return sqlSession.selectOne("workStatusMapper.selectworkStatusCount");
		
	}
	public List<WorkStatusDto> selectworkStatusList(PageInfoDto pi, int empNo){
		
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1 ) * pi.getBoardLimit() ,  pi.getBoardLimit());
		
		return sqlSession.selectList("workStatusMapper.selectworkStatusList", empNo, rowBounds);

		
	}
	public String selectEmpName(int empNo) {
		return sqlSession.selectOne("workStatusMapper.selectEmpName", empNo);
	}
}
