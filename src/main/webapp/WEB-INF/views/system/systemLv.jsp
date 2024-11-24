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
        background-color: rgba(123, 131, 211, 0.9) !important;
        color: #ffffff !important;
    }
    .left_body{
        width: 50%;
    }

    /* 오른쪽 css */
    .right_body{
        border-left: 1px solid rgb(219, 219, 219);
        width: 26%;
        padding: 95px 20px;
        margin-left: 2%;
    }
    .right_Lv_title{
        background-color: rgba(123, 131, 211, 0.9);
        color: #ffffff;
        font-weight: 600;
        font-size: 22px;
        display: flex;
        justify-content: center;
    }
    .lv_list{
        padding: 10px 0px 20px 0px;
        font-weight: 600;
        display: flex;
        align-items: center;
        flex-direction: column
        
    }
    .lv_list > div > input{
        margin: 5px 0px;
        border-color: rgb(175, 175, 175);
    }
    #right_btn{
        justify-content: center;
        margin-top: 30px;
    }
    .text-box{
    	display: flex;
    }
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />

	<div class="body-body">
		<!-- 여기 채워서 작업하시면 됩니다 .-->

		<div class="text-box">
			<!-- 왼쪽 -->
			<div class="left_body">
				<span class="ffont1" style="font-weight: bold;">시스템 레벨 관리</span>
				<!-- <form action="${ contextPath }/system/systemLvSearch.do"> -->
				<form action="${ contextPath }/system/systemLv.do" method="get">
					<div class="input_contoller">
						<div class="search_box">
							<div>
								<input class="input_b" name="search" type="text" placeholder="검색">
							</div>
							<div>
								<div class="icon">
									<button type="submit">
										<i class="bi bi-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>

				<form action="${ contextPath }/system/lvUpdate.do" method="post">
					<table class="table table-hover">
						<thead>
							<tr class="table_head_color">
								<th scope="col">NO</th>
								<th scope="col">사원번호</th>
								<th scope="col">이름</th>
								<th scope="col">레벨</th>
								<th scope="col">부서</th>
								<th scope="col">가입일</th>
								<th scope="col">수정일</th>
							</tr>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${ empty list }">
									<tr>
										<td colspan="7">조회된 사원이 없습니다.</td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="e" items="${ list }" varStatus="status">
										<tr>
											<th scope="row">${ e.getListNo() }<input type="hidden" name="lvList[${status.index}].empNo" value="${ e.empNo }"></th>
											<td>${ e.getEmpNo() }</td>
											<td>${ e.getEmpName() }</td>
											<td>
												<div>
													<select id="target_box" name="lvList[${status.index}].empAuth"  class="form-select" aria-label="Default select example" data-Lv="${	e.getEmpAuth() }" >
														<option value="PS005">Lv 5</option>
														<option value="PS004">Lv 4</option>
														<option value="PS003">Lv 3</option>
														<option value="PS002">Lv 2</option>
														<option value="PS001">Lv 1</option>
													</select>
												</div>
											</td>
											<td>${ e.getDeptCode() }</td>
											<td>${ e.getCreateDate() }</td>
											<td>${ e.getModifyDate() }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<!-- End Table with hoverable rows -->
					<div class="btn-box-hover">
						<button class="btn3-hover">수정하기</button>
					</div>
				</form>
				
				<script>
				    document.addEventListener('DOMContentLoaded', function () {
				        const selectElements = document.querySelectorAll('.form-select');
				
				        //select 요소 value 설정
				        selectElements.forEach(function (select) {
				            const empAuth = select.getAttribute('data-Lv');
				            select.value = empAuth;
				        });
				    });
				</script>

				<div class="paging">
					<ul class="pagination d-flex justify-content-center text-dark" style="margin-top: 40px;">
						<li class="page-item ${ pi.currentPage == 1 ? 'disabled' : ''}" >
							<a class="page-link" href="${ contextPath }/system/systemLv.do?page=${pi.currentPage-1}">
							<i class="bi bi-chevron-double-left"></i> <span>이전</span></a>
						</li>
	
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" >						
						<li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a class="page-link" href="${ contextPath }/system/systemLv.do?page=${p}">${ p }</a></li>
						</c:forEach>
						
						<li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' } ">
							<a class="page-link" href="${ contextPath }/system/systemLv.do?page=${pi.currentPage+1}"> <span>다음</span>&nbsp;
							<i class="bi bi-chevron-double-right"></i></a>
						</li> 
					</ul>
				</div>
			</div>
			<!-- 왼쪽끝 -->

			<!-- 오른쪽 -->
			<div class="right_body">
				<form action="">
					<div
						style="border: 1px solid rgb(167, 167, 167); border-radius: 5px;">

						<div class="right_Lv_title">레벨명</div>
						<div class="lv_list">
							<div>
								1LV <input type="text" name="" id="" value="서버 관리자">
							</div>
							<div>
								2LV <input type="text" name="" id="" value="대표">
							</div>
							<div>
								3LV <input type="text" name="" id="" value="이사">
							</div>
							<div>
								4LV <input type="text" name="" id="" value="사원">
							</div>
							<div>
								5LV <input type="text" name="" id="" value="지점">
							</div>
						</div>
					</div>

					<div class="btn-box-hover" id="right_btn">
						<button class="btn3-hover">확인</button>
					</div>
				</form>
			</div>
			<!-- 오른쪽 끝 -->
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>