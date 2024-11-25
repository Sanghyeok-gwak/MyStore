 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>  
 <div class="my-body">
    <div class="body-side">
    	<c:if test="${loginUser.empAuth eq 'PS001' || loginUser.empAuth eq 'PS002' || loginUser.empAuth eq 'PS003'}">
	      <div class="side-icon" onclick="toggleSubmenu(this)">
	        <img src="https://i.ibb.co/8XMrbQt/hr-management.png"> 
	        <span>인사 관리</span>
	      </div>
	      <div class="submenu">
	        <a href="${ contextPath }/department/departmentModify.do">부서관리</a>					<!-- lv3 003-->
	        <a href="${ contextPath }/department/departmentChangeHistory.do">부서 이동 이력</a>		<!-- lv3 003-->
	        <a href="${ contextPath }/personnel/employeeManager">사원관리</a>						<!-- lv3 003-->
	        <a href="${ contextPath }/salary/salaryMaster">급여관리</a>								<!-- lv3 003-->
	      </div>
			</c:if>
	      <div class="side-icon" onclick="toggleSubmenu(this)">										
	        <img src="https://i.ibb.co/W0yxB5v/noticeboard.png">
	        <span>게시판</span>
	      </div>
	      <div class="submenu">																		<!-- 예찬님 파트  추가 삭제 수정 처리-->
	        <a href="${ contextPath }/board/list.do">공지사항</a>									<!-- lv5 -->
	        <a href="#">자유게시판</a>																<!-- lv5 -->
	        <a href="#">익명게시판</a>																<!-- lv5 -->
	      </div>
      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/pndFm5W/content-writing.png">
        <span>전자 결재</span>
      </div>
      <div class="submenu">
        <a href="${ contextPath }/edoc/edocwrite.do">작성하기</a>
        <a href="${ contextPath }/edoc/aprvlwaitList.do">결재 대기 문서함</a>
        <a href="${ contextPath }/edoc/aprvlscheduledList.do">결재 진행 문서함</a>
        <a href="${ contextPath }/edoc/aprvlcompleteList.do">결재 완료 문서함</a>
        <a href="${ contextPath }/edoc/draftwaitList.do">기안 대기 문서함</a>
        <a href="${ contextPath }/edoc/draftprogressList.do">기안 진행 문서함</a>
        <a href="${ contextPath }/edoc/draftcompleteList.do">기안 승인 문서함</a>
        <a href="${ contextPath }/edoc/draftrejectList.do">기안 반려 문서함</a>
        <a href="${ contextPath }/edoc/draftrecoveryList.do">기안 회수 문서함</a>
        <a href="${ contextPath }/edoc/formlist.do">문서 양식 관리</a>
        <a href="${ contextPath }/note/test.do">문서 양식 관리</a>
      </div>
			
      <div class="side-icon" onclick="toggleSubmenu(this)">										
        <img src="https://i.ibb.co/1z1G1XW/user-profile.png"> 
        <span>마이페이지</span>
      </div>
      <div class="submenu">
        <a href="${ contextPath }/mypage/myInfo">회원수정</a>									<!-- lv5 -->	
        <a href="${ contextPath }/mypage/passwordRecovery">비밀번호 수정</a>					<!-- lv5 -->	
        <a href="${ contextPath }/salary/payCheck">급여 조회</a>								<!-- lv5 -->
        <a href="${ contextPath }/mypage/workStatus">근태조회</a>								<!-- lv5 -->
      </div>
			
			<div class="side-icon" onclick='location.href="${contextPath }/note/test.do"'>
        <img src="https://i.ibb.co/bK3vZM2/message-ww.png">
        <span>쪽지</span>																		<!-- lv5 -->
      </div>
      
			<div class="side-icon" onclick='location.href="여기 작성해주시면됩니다."'>
        <img src="https://i.ibb.co/fQtpVbV/wall-calendar-2.png">
        <span>일정</span>																		<!-- lv5 -->
      </div>
			
      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/ryTmFqw/store.png">											<!-- 상혁님 파트 -->
        <span>지점</span>																		<!-- LV 4빼고 전부 다  -->
      </div>
      <div class="submenu">
      	<c:if test="${loginUser.empAuth eq 'PS001' || loginUser.empAuth eq 'PS002' || loginUser.empAuth eq 'PS003' }">
        	<a href="${contextPath }/ordering/adminList.or">발주 관리</a>						<!-- LV  @ <= 3    -->
        	<a href="${contextPath }/branchoffice/adminList.po">상품 관리</a>					<!-- LV  @ <= 3    -->
        </c:if>
        <c:if test="${loginUser.empAuth eq 'PS005'}">
	        <a href="${contextPath }/ordering/insertPage.or">발주등록</a>							<!-- LV  @ == 5    -->
	        <a href="${contextPath }/branchoffice/list.po">상품조회</a>						<!-- LV  @ == 5    -->
      	</c:if>
      </div>
			<c:if test="${loginUser.empAuth eq 'PS001'}">
	      <div class="side-icon" onclick="toggleSubmenu(this)">
	        <img src="https://i.ibb.co/pWvPVQz/image.png">
	        <span>시스템 관리</span>
	      </div>
	      <div class="submenu">
	        <a href="${ contextPath }/system/log.do">시스템로그</a>									<!-- LV  @ == 1    -->
	        <a href="${ contextPath }/system/systemLv.do">시스템 레벨 관리</a>
	        <a href="${ contextPath }/system/systemBoardsList.do">세부메뉴관리</a>
	      </div>
      </c:if>
    </div>