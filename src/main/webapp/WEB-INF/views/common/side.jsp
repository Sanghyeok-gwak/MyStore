 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>  
 <div class="my-body">
    <div class="body-side">
      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/8XMrbQt/hr-management.png"> 
        <span>인사 관리</span>
      </div>
      <div class="submenu">
        <a href="${ contextPath }/department/departmentModify">부서관리</a>
        <a href="#">사원관리</a>
        <a href="#">급여관리</a>
      </div>

      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/W0yxB5v/noticeboard.png">
        <span>게시판</span>
      </div>
      <div class="submenu">
        <a href="${ contextPath }/board/boardList">공지사항</a>
        <a href="#">자유게시판</a>
        <a href="#">익명게시판</a>
      </div>

      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/pndFm5W/content-writing.png">
        <span>전자 결재</span>
      </div>
      <div class="submenu">
        <a href="#">작성하기</a>
        <a href="#">결재 대기 문서</a>
        <a href="#">결재 진행 문서</a>
        <a href="#">결재 완료 문서</a>
        <a href="#">개인 문서함</a>
        <a href="#">대기 문서함</a>
        <a href="#">승인 문서함</a>
        <a href="#">반려 문서함</a>
        <a href="#">회수 문서함</a>
        <a href="#">문서 양식 관리</a>
      </div>

      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/1z1G1XW/user-profile.png"> 
        <span>마이페이지</span>
      </div>
      <div class="submenu">
        <a href="#">회원수정</a>
        <a href="#">비밀번호 수정</a>
        <a href="#">급여 조회</a>
        <a href="#">근태조회</a>
      </div>

      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/ryTmFqw/store.png">
        <span>지점</span>
      </div>
      <div class="submenu">
        <a href="#">발주 관리</a>
        <a href="#">지점 이동</a>
      </div>

      <div class="side-icon" onclick="toggleSubmenu(this)">
        <img src="https://i.ibb.co/pWvPVQz/image.png">
        <span>시스템 관리</span>
      </div>
      <div class="submenu">
        <a href="${ contextPath }/system/log.do">시스템로그</a>
        <a href="${ contextPath }/system/systemLv.do">시스템 레벨 관리</a>
        <a href="${ contextPath }/system/systemBoardsList.do">세부메뉴관리</a>
      </div>
    </div>