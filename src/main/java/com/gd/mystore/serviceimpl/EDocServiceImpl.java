package com.gd.mystore.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd.mystore.dao.EDocDao;
import com.gd.mystore.dto.EDocApprovalDto;
import com.gd.mystore.dto.EDocAttachDto;
import com.gd.mystore.dto.EDocDto;
import com.gd.mystore.dto.EDocSampleDto;
import com.gd.mystore.dto.EmpMemberDto;
import com.gd.mystore.dto.PageInfoDto;
import com.gd.mystore.service.EDocService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EDocServiceImpl implements EDocService {
	
	private final EDocDao edocDao;

	// 문서 양식 관리
	@Override
	public int selectEDocListCount() {
		return edocDao.selectEDocSampleListCount();
	}

	@Override
	public List<EDocSampleDto> selectEDocFormList(PageInfoDto pi) {
		return edocDao.selectEDocSampleList(pi);
	}

	@Override
	public int insertEDocSample(EDocSampleDto es) {
		return edocDao.insertEDocSample(es);
	}

	@Override
	public int deleteEdocSample(String[] deleteNo) {
		return edocDao.deleteEDocSample(deleteNo);
	}

	
	// 기안서 작성
	@Override
	public List<EDocSampleDto> selectEDocFormList() {
		return edocDao.selectEdocFormList();
	}

	@Override
	public EDocSampleDto selectEDocForm(int sampleNoInt) {
		return edocDao.selectEdocForm(sampleNoInt);
	}

	@Override
	public List<EmpMemberDto> selectEmployees(String no) {
		return edocDao.selectEmployees(no);
	}

	@Override
	public int edocInsert(EDocDto edoc, List<EDocApprovalDto> approvalList) {
		
		// 1) edoc테이블에 insert
		int result = edocDao.insertEdoc(edoc);
		
		// 2) attachment테이블에 insert
		List<EDocAttachDto> list = edoc.getAttachList();
		if(result > 0 && !list.isEmpty()) {
			result = 0;
			for(EDocAttachDto attach : list) {
				result += edocDao.insertAttach(attach);
			}
		}
		
		// 3) approval테이블에 insert
		for(EDocApprovalDto approval : approvalList) {
			result += edocDao.saveApproval(approval);
		}
		
		return result;
	}

	
	// 결재 목록 조회
	@Override
	public int aprvlWaitListCount(String no) {
		return edocDao.aprvlWaitListCount(no);
	}

	@Override
	public List<EDocDto> aprvlWaitList(String no, PageInfoDto pi) {
		return edocDao.aprvlWaitList(no, pi);
	}

	@Override
	public int aprvlScheduledListCount(String no) {
		return edocDao.aprvlScheduledListCount(no);
	}

	@Override
	public List<EDocDto> aprvlScheduledList(String no, PageInfoDto pi) {
		return edocDao.aprvlScheduledList(no, pi);
	}

	@Override
	public int aprvlCompleteListCount(String no) {
		return edocDao.aprvlCompleteListCount(no);
	}

	@Override
	public List<EDocDto> aprvlCompleteList(String no, PageInfoDto pi) {
		return edocDao.aprvlCompleteList(no, pi);
	}

	
	// 기안서 목록 조회
	@Override
	public int draftWaitListCount(String no) {
		return edocDao.draftWaitListCount(no);
	}

	@Override
	public List<EDocDto> draftWaitList(String no, PageInfoDto pi) {
		return edocDao.draftWaitList(no, pi);
	}

	@Override
	public int draftProgressListCount(String no) {
		return edocDao.draftProgressListCount(no);
	}

	@Override
	public List<EDocDto> draftProgressList(String no, PageInfoDto pi) {
		return edocDao.draftProgressList(no, pi);
	}

	@Override
	public int draftCompleteListCount(String no) {
		return edocDao.draftCompleteListCount(no);
	}

	@Override
	public List<EDocDto> draftCompleteList(String no, PageInfoDto pi) {
		return edocDao.draftCompleteList(no, pi);
	}

	@Override
	public int draftRejectListCount(String no) {
		return edocDao.draftRejectListCount(no);
	}

	@Override
	public List<EDocDto> draftRejectList(String no, PageInfoDto pi) {
		return edocDao.draftRejectList(no, pi);
	}

	@Override
	public int draftRecoveryListCount(String no) {
		return edocDao.draftRecoveryListCount(no);
	}

	@Override
	public List<EDocDto> draftRecoveryList(String no, PageInfoDto pi) {
		return edocDao.draftRecoveryList(no, pi);
	}

	
	// 결재 목록 상세페이지
	@Override
	public EDocDto aprvlWait(int no) {
		return edocDao.aprvlWait(no);
	}

	@Override
	public List<EDocApprovalDto> aprvlList(int no) {
		return edocDao.aprvlList(no);
	}

}
