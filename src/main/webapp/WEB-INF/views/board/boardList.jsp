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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />

	<style>
	.left {
		display: flex;
		justify-content: flex-end;
	}

	.card {
		margin-bottom: 30px;
		border: none;
		border-radius: 5px;
		box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
	}

	.card-body {
		padding: 0 20px 20px 20px;
	}

	/* 넓이 높이만 수정해서 사용하세요 인풋 스타일*/
	input {
		border: 1px solid gray;
		border-radius: 2px;
		height: 35px;
		width: 480px;
	}

	.icon>button {
		border: none;
		background: none;
		outline: none;
	}

	.search_box {
		display: flex;
		width: 250px;
		border: 1px solid rgb(112, 112, 112);
		border-radius: 3px;
		align-items: center;
	}

	.input_b {
		border-style: none;
		outline: none;
		box-shadow: none;
		margin-left: 10px;
		margin-right: 10px;
	}

	.icon {
		margin-right: 10px;
	}

	.pagination .page-link {
		color: rgba(109, 105, 108, 1);
		background-color: white;
		border: none;
	}

	.pagination .page-item.active .page-link {
		border: 1px solid red;
		color: red;
		background-color: white;
	}

	button.btn3-hover {
		margin-right: 0px;
	}
	</style>

	<div class="body-body">
		<!-- 여기 채워서 작업하시면 됩니다 .-->

		<div class="text-box">
			<div class="text-box1">
				<div class="d-flex" style="flex-direction: column; width: 100%; padding: 20px;">
					<!-- 공지사항 제목 -->
					<div>
						<b style="font-size: 25px; margin-left: 10px;">공지사항</b>
					</div>

					<!-- 글 작성 버튼 (공지사항 아래) -->
					<c:if test="${ loginUser.empNo eq '1003'}">
					<div class="btn-box-hover" style="display: flex; justify-content: flex-end; align-items: center;">
						<button class="btn3-hover" onclick="window.location.href='${ contextPath }/board/boardRegist.do'">글 작성</button>
					</div>
					</c:if>
					<!-- 드롭다운과 인풋박스를 아래쪽에 세로로 정렬 -->
					<div style="margin-top: 20px;">
						<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px;">
							<form action="${ contextPath }/board/search.do" method="get" id="search_form" class="d-flex">
								<select class="datatable-selector" id="custom-select" name="condition"
									style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px; height:37px; width:125px; margin-top:10px;">
								 	<option value="board_dept">구분</option>
								 	<option value="board_title">제목</option>
								 	<option value="board_content">내용</option>
								</select>
								<input type="hidden" name="page" value="1">	
								<div class="search_box" style="margin-top: 10px; width: 500px;">
									<input class="input_b" type="text" placeholder="검색" name="keyword" value="${ search.keyword }">
									<div class="icon">
										<button type="submit">
											<i class="bi bi-search"></i>
										</button>
									</div>
								</div>
							</form>
								<c:if test="${ not empty search }">
									<script>
									$(document).ready(function(){
									    $("#search_form select").val('${search.condition}');
									    
									    // 페이징 항목을 클릭했을 때
									    $("#paging_area a").on("click", function() {
									        let pageText = $(this).find('span').text(); // <a> 태그 내의 <span> 텍스트 가져오기
									        let page;
									        
									        // "이전" 버튼 클릭 시
									        if(pageText == '이전') {
									            page = ${pi.currentPage - 1}; // 현재 페이지에서 1 감소
									        } 
									        // "다음" 버튼 클릭 시
									        else if(pageText == '다음') {
									            page = ${pi.currentPage + 1}; // 현재 페이지에서 1 증가
									        } 
									        // 숫자 페이지 클릭 시
									        else {
									            page = $(this).text(); // <a> 태그의 텍스트 그대로 페이지 번호로 사용
									        }

									        // 페이지 번호를 숨겨진 input에 설정하고, 폼을 제출
									        $("#search_form input[name=page]").val(page);
									        $("#search_form").submit();

									        return false; // 기본 동작을 막고, form 제출만 수행
									    });
									});

									</script>
									
								</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="card" style="margin-top: 80px; box-shadow: none;">
				<div class="card-body">
				<div style="text-align: center; vertical-align: middle;">

					<!-- Table with hoverable rows -->
					<table class="table table-hover">
						<c:choose>
							<c:when test="${ empty list }">
								<!-- 데이터가 없을 때 메시지 출력 -->
								<tr>
									<td colspan="7">조회된 게시글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- 데이터가 있을 때 테이블 내용 출력 -->
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">구분</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">조회</th>
										<th scope="col">첨부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="b" items="${ list }">
										<tr onclick='location.href="${contextPath}/board/${ loginUser.empNo eq b.empNo ? "boardDetail.do" : "increase.do" }?no=${ b.boardNo }";'>
											<td>${ b.boardNo }</td>
											<td>${ b.boardDept }</td>
											<td>${ b.boardTitle }</td>
											<td>${ b.empName }</td>
											<td>${ b.createDate }</td>
											<td>${ b.boardCount }</td>
											<td>${ b.attachCount > 0 ? '★' : '' }</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>
					</div>
					<!-- End Table with hoverable rows -->

					<div class="paging" id="paging_area">
						<ul class="pagination d-flex justify-content-center text-dark" style="margin-top: 40px;">
							<li class="page-item ${ pi.currentPage == 1 ? 'disabled' : ''}">
								<a class="page-link" href="${contextPath}/board/list.do?page=${pi.currentPage-1}">
									<i class="bi bi-chevron-double-left"></i> <span>이전</span>
								</a>
							</li>

							<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
								<li class="page-item ${pi.currentPage == p ? 'active' : ''}">
									<a class="page-link" href="${contextPath}/board/list.do?page=${p}">${p}</a>
								</li>
							</c:forEach>

							<li class="page-item ${pi.currentPage == pi.maxPage ? 'disabled' : ''}">
								<a class="page-link" href="${contextPath}/board/list.do?page=${pi.currentPage+1}">
									<span>다음</span>&nbsp;
									<i class="bi bi-chevron-double-right"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
		function toggleSubmenu(element) {
			const submenu = element.nextElementSibling;
			if (submenu.style.maxHeight === "0px" || submenu.style.maxHeight === "") {
				submenu.style.maxHeight = submenu.scrollHeight + "px";
			} else {
				submenu.style.maxHeight = "0";
			}
		}
	</script>
	
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
