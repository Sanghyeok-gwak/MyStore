<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	 /* 왼쪽css */
    .body_title{
        font-size: 22px;
        font-weight: 600;
    }
    .input_contoller{
        display: flex;
        justify-content: end;
        margin-top: 30px;
        margin-bottom:5px;
    }
    .search_box{
        display: flex;
        width: 250px;
        border: 1px solid rgb(112, 112, 112);
        border-radius: 3px;
        align-items: center;
    }
    .input_b{
        border-style: none;
        outline: none;
        box-shadow: none;
        margin-left: 10px;
        margin-right: 10px;
    }
    .icon{
      margin-right: 10px;
    }
    .icon > button{
        border: none;
        background: none;
        outline: none;
    }
    .form-select{
        width: 80px;
    }
    .btn-box-hover{
        display: flex;
        justify-content: end;
    }
    .pageing{
        display: flex;
        margin-top: 40px;
        justify-content: center;
    }
    .table_head_color > th{
        background-color: rgba(123, 131, 211, 0.9);
        color: #ffffff;
        
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
	

</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/side.jsp"/>

	<div class="body-body">
		<!-- 여기 채워서 작업하시면 됩니다 .-->
		<div class="text-box">
			<!-- 왼쪽 -->
			<div class="left_body">
				<span class="ffont1" style="font-weight: bold;">시스템 사용자 로그</span>

				<div class="input_contoller">
					<div>
						<select class="form-select" aria-label="Default select example">
							<option value="1">전체</option>
							<option value="2">조회</option>
							<option value="3">수정</option>
							<option value="2">업데이트</option>
							<option value="3">이동</option>
						</select>
					</div>
					<div class="search_box">
						<input class="input_b" type="text" placeholder="검색">
						<div class="icon">
							<button>
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
				</div>

				<form action="#">
					<!-- Table with hoverable rows -->
					<table class="table table-hover">
						<thead>
							<tr class="table_head_color">
								<th scope="col">NO</th>
								<th scope="col">로그 번호</th>
								<th scope="col">사번</th>
								<th scope="col">로그유형</th>
								<th scope="col">메뉴 이름</th>
								<th scope="col">이전데이터</th>
								<th scope="col">시간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>123456781223</td>
								<td>201912345</td>
								<td>업데이트</td>
								<td>마이페이지</td>
								<td>010-1234-4567</td>
								<td>2024-11-9</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>1231231232131421</td>
								<td>201852345</td>
								<td>추가</td>
								<td>인사 관리</td>
								<td>2019121003</td>
								<td>2024-11-10</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>1231231232131421</td>
								<td>201852345</td>
								<td>추가</td>
								<td>인사 관리</td>
								<td>2019121003</td>
								<td>2024-11-10</td>
							</tr>

						</tbody>
					</table>
				</form>


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
			<!-- 왼쪽끝 -->
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>