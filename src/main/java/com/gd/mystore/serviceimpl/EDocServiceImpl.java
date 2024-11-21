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

}
