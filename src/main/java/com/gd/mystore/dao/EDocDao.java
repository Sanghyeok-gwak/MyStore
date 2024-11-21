package com.gd.mystore.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.mystore.dto.DepartmentDto;
import com.gd.mystore.dto.EDocApprovalDto;
import com.gd.mystore.dto.EDocAttachDto;
import com.gd.mystore.dto.EDocDto;
import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class EDocDao {
	
	private final SqlSessionTemplate sqlSession;
	
	public int selectEDocSampleListCount() {
		return sqlSession.selectOne("edocMapper.selectEDocSampleListCount");
	}

	public List<EDocSampleDto> selectEDocSampleList(PageInfoDto pi){
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.selectEDocSampleList", null, rowBounds);
	}
	
	public int insertEDocSample(EDocSampleDto es) {
		return sqlSession.insert("edocMapper.insertEDocSample", es);
	}
	
	public int deleteEDocSample(String[] deleteNo) {
		return sqlSession.update("edocMapper.deleteEdocSample", deleteNo);
	}

	public List<EDocSampleDto> selectEdocFormList() {
		return sqlSession.selectList("edocMapper.selectEDocFormList");
	}

	public EDocSampleDto selectEdocForm(int sampleNoInt) {
		return sqlSession.selectOne("edocMapper.selectEDocForm", sampleNoInt);
	}

	public List<EmpMemberDto> selectEmployees(String no) {
		return sqlSession.selectList("edocMapper.selectEmployees", no);
	}

	public int insertEdoc(EDocDto edoc) {
		return sqlSession.insert("edocMapper.insertEdoc", edoc);
	}

	public int insertAttach(EDocAttachDto attach) {
		return sqlSession.insert("edocMapper.insertAttach", attach);
	}

	public int saveApproval(EDocApprovalDto approval) {
		return sqlSession.insert("edocMapper.saveApproval", approval);
	}
}
