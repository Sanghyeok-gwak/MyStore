<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.text-box{
	overflow-y: scroll;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/side.jsp" />
<div class="body-body">
<!-- 여기 채워서 작업하시면 됩니다 .-->
	<div class="text-box">
		<div class="board-detail-box">
			<div class="board-detail-box-text">
				<div class="d-flex" style="flex-direction: column;">
					<span class="ffont1">${ b.boardTitle }</span><br>
					<div class="box-box" style="font-size: 18px;">
						<div class="d-flex justify-content-between" style="display: flex; justify-content: space-between; width: 100%; margin-top:10px;">
							<div>${ b.empName }</div>
							<div style="display: flex; justify-content: space-between; gap: 10px;">
								<div style="margin-right: 50px;">${ b.createDate }</div>
								<div style="margin-right: 50px;">댓글 수 ${ b.boardCount }</div>
								<div>조회 수 ${ b.boardCount }</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div style="margin-top: 20px; border-top: #000000 1px solid; border-bottom: #000000 1px solid;">
			<table>
				<td style="padding-top: 5px; padding-bottom: 5px; padding-left: 0; padding-right: 0;">
					<div style="display: flex; justify-content: space-between; width: 100%; font-size: 18px;">
						<div>첨부파일</div>
						<div style="text-align: right; margin-left: 30px; color: #afacac">첨부파일인데요.jpg</div>
					</div>
				</td>
			</table>
		</div>
		<div class="board-content" style="height:400px; padding: 10px;">
			${ b.boardContent }
		</div>

	 <c:if test="${loginUser.empNo eq b.empNo}">
			<form id="frm" action="" method="post">
		<div class="btn-box-hover">
			<div style="display: flex; justify-content: center; width: 100%;">
			<input  type="hidden" name="no" value="${b.boardNo}">
				<button type="submit" class="btn3-hover" onclick="$('#frm').attr('action','${contextPath}/board/modify.do');">글 수정</button>
				<button type="submit" class="btn1-hover" onclick="$('#frm').attr('action','${contextPath}/board/delete.do');">글 삭제</button>
			</div>
		</div>
			</form>
		</c:if>
		
		<div style="margin-top: 25px; border-top: #000000 1px solid; border-bottom: #000000 1px solid;">
			<table>
				<td style="padding-top: 5px; padding-bottom: 5px; padding-left: 0; padding-right: 0;">
					<div style="display: flex; justify-content: space-between; width: 100%; font-size: 18px;">
						<div>댓글 1개</div>
					</div>
				</td>

			</table>

		</div>
		<style>
			.reply-box{
				margin-left:5px;
				margin-right:150px;
			}
		</style>
		<div class="reply-box">		
			<div class="d-flex" style="flex-direction: column; font-size: 18px; margin-top: 10px;">
				<!-- 작성자 및 댓글 텍스트 부분 -->
				<div style="display: flex;  align-items: center;">
					<span>김개똥</span> <i class="bi bi-three-dots" style="margin-left: 230px;"></i>
				</div>
	
	
				<!-- 댓글 텍스트 -->
				<div style="padding-bottom: 5px; margin-top: 5px;">댓글</div>
	
				<!-- 댓글 관련 정보 (날짜, 답글쓰기, 하트이모티콘) -->
				<div class="d-flex" style=" margin-top: 5px; gap: 3px; width: 20%; color: #afacac;">
					<div>2024-11-02</div>
					<div style="margin-left: 20px; margin-top: -1px;">답글쓰기</div>
					<i class="bi bi-heart" style="margin-left: 20px;"></i>
				</div>
			</div>
			<div class="d-flex" style="flex-direction: column; font-size: 18px; margin-top: 10px;">
				<!-- 작성자 및 댓글 텍스트 부분 -->
				<div style="display: flex; justify-content: space-between; align-items: center;">
					<span>김개똥</span> <i class="bi bi-three-dots" style="margin-right: 15px;"></i>
				</div>
	
	
				<!-- 댓글 텍스트 -->
				<div style="padding-bottom: 5px; margin-top: 5px;">댓글</div>
	
				<!-- 댓글 관련 정보 (날짜, 답글쓰기, 하트이모티콘) -->
				<div class="d-flex" style="margin-top: 5px; gap: 3px; width: 20%; color: #afacac;">
					<div>2024-11-02</div>
					<div style="margin-left: 20px; margin-top: -1px;">답글쓰기</div>
					<i class="bi bi-heart" style="margin-left: 20px;"></i>
				</div>
			</div>
			<div class="d-flex" style="flex-direction: column; font-size: 18px; margin-top: 10px;">
				<!-- 작성자 및 댓글 텍스트 부분 -->
				<div style="display: flex; justify-content: space-between; align-items: center;">
					<span>김개똥</span> <i class="bi bi-three-dots" style="margin-right: 15px;"></i>
				</div>
	
	
				<!-- 댓글 텍스트 -->
				<div style="padding-bottom: 5px; margin-top: 5px;">댓글</div>
	
				<!-- 댓글 관련 정보 (날짜, 답글쓰기, 하트이모티콘) -->
				<div class="d-flex" style="margin-top: 5px; gap: 3px; width: 20%; color: #afacac;">
					<div>2024-11-02</div>
					<div style="margin-left: 20px; margin-top: -1px;">답글쓰기</div>
					<i class="bi bi-heart" style="margin-left: 20px;"></i>
				</div>
			</div>
		</div>
		<hr style="opacity:1;">
		<div style="margin-top: 10px; color: #afacac; display: flex; align-items: center;">
			<i class="bi bi-lock" style="margin-right: 10px; margin-bottom: 10px;">&nbsp;비밀댓글</i>
			<div class="form-check form-switch" style="margin-left: 10px; margin-bottom: 10px;">
				<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"> 
				<label class="form-check-label" for="flexSwitchCheckDefault"></label>
			</div>
		</div>
		<div style="display: flex; justify-content: space-between; align-items: center;">
			<textarea
				style="width: 90%; height: 100px; resize: none; border: 1px solid #000000"></textarea>

			<button class="btn2-hover" style="width: 8%; height: 40px;">작성하기</button>
		</div>
		
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>