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
	
	// 결재양식
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

	
	// 기안서 작성
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
	
	
	// 결재 목록 조회
	public int aprvlWaitListCount(String no) {
		return sqlSession.selectOne("edocMapper.aprvlWaitListCount", no);
	}

	public List<EDocDto> aprvlWaitList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.aprvlWaitList", no, rowBounds);
	}

	public int aprvlScheduledListCount(String no) {
		return sqlSession.selectOne("edocMapper.aprvlScheduledListCount", no);
	}

	public List<EDocDto> aprvlScheduledList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.aprvlScheduledList", no, rowBounds);
	}

	public int aprvlCompleteListCount(String no) {
		return sqlSession.selectOne("edocMapper.aprvlCompleteListCount", no);
	}

	public List<EDocDto> aprvlCompleteList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.aprvlCompleteList", no, rowBounds);
	}

	
	// 기안서 목록 조회
	public int draftWaitListCount(String no) {
		return sqlSession.selectOne("edocMapper.draftWaitListCount", no);
	}

	public List<EDocDto> draftWaitList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.draftWaitList", no, rowBounds);
	}

	public int draftProgressListCount(String no) {
		return sqlSession.selectOne("edocMapper.draftProgressListCount", no);
	}

	public List<EDocDto> draftProgressList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.draftProgressList", no, rowBounds);
	}

	public int draftCompleteListCount(String no) {
		return sqlSession.selectOne("edocMapper.draftCompleteListCount", no);
	}

	public List<EDocDto> draftCompleteList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.draftCompleteList", no, rowBounds);
	}

	public int draftRejectListCount(String no) {
		return sqlSession.selectOne("edocMapper.draftRejectListCount", no);
	}

	public List<EDocDto> draftRejectList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.draftRejectList", no, rowBounds);
	}

	public int draftRecoveryListCount(String no) {
		return sqlSession.selectOne("edocMapper.draftRecoveryListCount", no);
	}

	public List<EDocDto> draftRecoveryList(String no, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds( (pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSession.selectList("edocMapper.draftRecoveryList", no, rowBounds);
	}
	
	
	
	
	
	
	
	
}
