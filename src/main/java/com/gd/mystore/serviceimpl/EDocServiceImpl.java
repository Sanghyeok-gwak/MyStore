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
import lombok.extern.slf4j.Slf4j;

@Slf4j
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

	
	// 결재 대기 상세페이지
	@Override
	public EDocDto aprvlWait(int no) {
		return edocDao.aprvlWait(no);
	}
	
	// 결재 예정 상세페이지
	@Override
	public EDocDto aprvlscheduled(int no) {
		return edocDao.aprvlscheduled(no);
	}

	// 결재 완료 상세페이지
	@Override
	public EDocDto aprvlcomplete(int no) {
		return edocDao.aprvlcomplete(no);
	}

	// 결재자 정보 불러오기
	@Override
	public List<EDocApprovalDto> aprvlList(int no) {
		return edocDao.aprvlList(no);
	}
	
	
	// 결재 반려
	// 결재하기
	@Override
	public int aprvlcpl(EDocApprovalDto approval1, EDocApprovalDto approval2, EDocDto edocDto, String no) {
		
		// 로그인한 사용자가 1번 결재자일 경우
        if (approval1.getEmpNo().equals(no)) {
            // 1번 결재자 승인 처리
            approval1.setAprvlStatus("Y");
            approval2.setAprvlStatus("N"); // 2번 결재자의 상태를 'N'으로 설정
            edocDto.setEdocStatus("O"); // 전자문서 상태를 'O'로 설정
        } else if (approval2.getEmpNo().equals(no)) {
            // 2번 결재자 승인 처리
            approval1.setAprvlStatus("Y");
            approval2.setAprvlStatus("Y"); // 2번 결재자도 승인 처리
            edocDto.setEdocStatus("F"); // 전자문서 상태를 'F'로 설정
        }

        // 결재 정보 및 전자문서 상태 업데이트
        int updateApprovalResult = edocDao.updateApprovalStatusOF(approval1, approval2);
        int updateEdocResult = edocDao.updateEdocStatusOF(edocDto);

        // 두 업데이트가 모두 성공적으로 처리되었는지 확인
        if (updateApprovalResult > 0 && updateEdocResult > 0) {
            return 1; // 성공
        } else {
            return 0; // 실패
        }
    }
	
	
	// 반려하기
	@Override
	public int aprvlrjt(EDocApprovalDto approval1, EDocApprovalDto approval2, EDocDto edocDto, String no) {
		
		// 1번 결재자일 경우
        if (approval1.getEmpNo().equals(no)) {
            approval1.setAprvlStatus("R"); // 1번 결재자 상태를 'Y'로 변경
            approval2.setAprvlStatus(""); // 2번 결재자 상태도 'Y'로 변경
            edocDto.setEdocStatus("R");   // 전자문서 상태를 'R'로 변경
        }
        // 2번 결재자일 경우
        else if (approval2.getEmpNo().equals(no)) {
        	approval1.setAprvlStatus("Y"); // 1번 결재자 상태를 'Y'로 변경
            approval2.setAprvlStatus("R"); // 2번 결재자 상태를 'R'로 변경
            edocDto.setEdocStatus("R");   // 전자문서 상태를 'R'로 변경
        }

        // 반려 상태 업데이트
        int updateApprovalResult = edocDao.updateApprovalStatusR(approval1, approval2);
        int updateEdocResult = edocDao.updateEdocStatusR(edocDto);

        // 결과 반환
        return (updateApprovalResult > 0 && updateEdocResult > 0) ? 1 : 0;
    }

	
	// 기안 상세페이지
	// 기안 대기 상세페이지
	@Override
	public EDocDto draftwait(int no) {
		return edocDao.draftwait(no);
	}

	// 기안 진행 상세페이지
	@Override
	public EDocDto draftprogress(int no) {
		return edocDao.draftprogress(no);
	}

	// 기안 완료 상세페이지
	@Override
	public EDocDto draftcomplete(int no) {
		return edocDao.draftcomplete(no);
	}

	// 기안 반려 상세페이지
	@Override
	public EDocDto draftreject(int no) {
		return edocDao.draftreject(no);
	}

	// 기안 회수 상세페이지
	@Override
	public EDocDto draftrecovery(int no) {
		return edocDao.draftrecovery(no);
	}

	// 기안서 회수
	@Override
	public int draftrcv(EDocApprovalDto approval1, EDocApprovalDto approval2, EDocDto edocDto) {

        approval1.setAprvlStatus(""); // 1번 결재자 상태를 ''로 변경
        approval2.setAprvlStatus(""); // 2번 결재자 상태도 ''로 변경
        edocDto.setEdocStatus("T");   // 전자문서 상태를 'T'로 변경

        // 상태 업데이트
        int updateEdocResult = edocDao.updateEdocStatusT(edocDto);
        int updateApprovalResult = edocDao.updateApprovalStatusT(approval1, approval2);
        
        log.debug("updateEdocResult : {}", updateEdocResult);
        log.debug("updateApprovalResult : {}", updateApprovalResult);


        // 결과 반환
        return (updateApprovalResult > 0 && updateEdocResult > 0) ? 1 : 0;
	}

	@Override
	public int draftUseN(EDocDto edocDto) {
		
		edocDto.setUseYN("N");
		
		return edocDao.draftUseN(edocDto);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
