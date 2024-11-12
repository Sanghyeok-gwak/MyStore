<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/side.jsp"/>

	<div class="body-body">
		<div class="text-box">
			<span class="ffont1" style="font-weight: bold;">세부메뉴관리</span>

			<div class="menu_main">
				<!-- 왼쪽 메뉴 영역 -->
				<div class="left_main">
					<div class="left_line">
						<div class="left_title_txt" style="z-index: 3">메뉴 관리</div>
						<div class="btn-box-hover" id="left_head_btn">
							<button class="btn2-hover">
								<b style="font-weight: 900">-</b> 삭제
							</button>
							<button class="btn2-hover">
								<b style="font-weight: 900">+</b> 추가
							</button>
						</div>
					</div>

					<div class="left_body_list">
						<!-- 메뉴 리스트 -->
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 공지사항
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 자유게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 인사게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 공지사항
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 자유게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 인사게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 공지사항
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 자유게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 인사게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 공지사항
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 자유게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 인사게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 공지사항
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 자유게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 인사게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 공지사항
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 자유게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 인사게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 공지사항
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 자유게시판
						</div>
						<div class="left_body_listItem">
							<div class="icon">
								<i class="bi bi-file-earmark"></i>
							</div>
							&nbsp 인사게시판
						</div>
						<!-- 더 많은 메뉴 항목 추가 가능 -->
					</div>
				</div>

				<!-- 오른쪽 설정 영역 -->
				<div class="right_main">
					<div
						style="margin-left: 57px; border: 1px solid rgb(201, 201, 201); width: 100%;">
						<!-- 메뉴 세부 설정 테이블 -->
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">이름</th>
									<td>
										<div class="input-bar">
											<input type="text" class="input-bar1" />
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">권한 설정</th>
									<td>
										<div style="display: flex">
											<div style="margin: 0 50px 0 0">쓰기</div>
											<div>
												<select class="form-select"
													aria-label="Default select example">
													<option value="1">Lv 5</option>
													<option value="2">Lv 4</option>
													<option value="3">Lv 3</option>
													<option value="2">Lv 2</option>
													<option value="3">Lv 1</option>
												</select>
											</div>
										</div>
										<div style="display: flex; margin: 5px 0 5px 0">
											<div style="margin: 0 20px 0 0">댓글쓰기</div>
											<div>
												<select class="form-select"
													aria-label="Default select example">
													<option value="1">Lv 5</option>
													<option value="2">Lv 4</option>
													<option value="3">Lv 3</option>
													<option value="2">Lv 2</option>
													<option value="3">Lv 1</option>
												</select>
											</div>
										</div>
										<div style="display: flex">
											<div style="margin: 0 50px 0 0">읽기</div>
											<div>
												<select class="form-select"
													aria-label="Default select example">
													<option value="1">Lv 5</option>
													<option value="2">Lv 4</option>
													<option value="3">Lv 3</option>
													<option value="2">Lv 2</option>
													<option value="3">Lv 1</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">감추기 설정</th>
									<td style="display: flex">메뉴감추기
										<div class="form-check" style="margin: 0 0 0 10px">
											<input class="form-check-input" type="checkbox"
												id="gridCheck1" />
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">지점 여부</th>
									<td style="display: flex">지점
										<div class="form-check" style="margin: 0 0 0 10px">
											<input class="form-check-input" type="checkbox"
												id="gridCheck1" />
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 하단 버튼 -->
			<div class="body_bottom_btn">
				<div class="btn-box-hover">
					<button class="btn3-hover">적용</button>
					<button class="btn1-hover">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>