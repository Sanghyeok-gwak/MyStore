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

.dropdown {
	width: 150px;
	height: 35px;
	margin-right: 15px;
	border: 1px solid gray;
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
				<div class="d-flex"
					style="flex-direction: column; width: 100%; padding: 20px;">
					<!-- 공지사항 제목 -->
					<div>
						<b style="font-size: 25px; margin-left: 10px;">공지사항</b>
					</div>

					<!-- 글 작성 버튼 (공지사항 아래) -->
					<div class="btn-box-hover"
						style="display: flex; justify-content: flex-end; align-items: center;">
						<button class="btn3-hover">글 작성</button>
					</div>

					<!-- 드롭다운과 인풋박스를 아래쪽에 세로로 정렬 -->
					<div style="margin-top: 20px;">
						<div
							style="display: flex; justify-content: flex-end; align-items: center; gap: 10px;">
							<select class="dropdown dropdown-toggle dropdown-toggle-split"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="margin-top: 10px;">
								<option selected>제목</option>
								<option>제목+내용</option>
							</select>
							<div class="search_box" style="margin-top: 10px; width: 500px;">
								<input class="input_b" type="text" placeholder="검색">
								<div class="icon">
									<button>
										<i class="bi bi-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>




			<div class="card" style="margin-top: 80px; box-shadow: none;">
				<div class="card-body">

					<!-- Table with hoverable rows -->
					<table class="table table-hover">
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
							<tr style="background-color: #858484;">
								<th scope="row" style="background-color: #bbb9b9;">1</th>
								<td style="background-color: #bbb9b9;">전체</td>
								<td style="background-color: #bbb9b9;">공지사항입니다</td>
								<td style="background-color: #bbb9b9;">관리자</td>
								<td style="background-color: #bbb9b9;">2024-11-02</td>
								<td style="background-color: #bbb9b9;">389</td>
								<td style="background-color: #bbb9b9;"></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">5</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">6</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">7</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">8</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">9</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>전체</td>
								<td>공지사항입니다</td>
								<td>관리자</td>
								<td>2024-11-02</td>
								<td>389</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<!-- End Table with hoverable rows -->

					<div class="paging">
						<ul class="pagination d-flex justify-content-center text-dark"
							style="margin-top: 40px;">
							<li class="page-item disabled"><a class="page-link" href="">
									<i class="bi bi-chevron-double-left"></i> <span>이전</span>
							</a></li>
							<li class="page-item active"><a class="page-link" href="">1</a></li>
							<li class="page-item"><a class="page-link" href="">2</a></li>
							<li class="page-item"><a class="page-link" href="">3</a></li>
							<li class="page-item"><a class="page-link" href="">4</a></li>
							<li class="page-item"><a class="page-link" href="">5</a></li>
							<li class="page-item"><a class="page-link" href=""> <span>다음</span>&nbsp;<i
									class="bi bi-chevron-double-right"></i>
							</a></li>
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