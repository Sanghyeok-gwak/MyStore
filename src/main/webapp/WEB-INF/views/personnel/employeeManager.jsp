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
	width: 100%;
	margin-left: 3%;
}

.icon {
	margin-right: 10px;
}

.enroll {
	border: none;
	background-color: white;
	color: black;
}

.simple-btn {
	background: none;
	border: none;
	cursor: pointer;
	padding: 0;
	font-size: 16px;
}

.simple-btn:hover {
	text-decoration: none;
}
</style>


</head>

<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	<div class="body-body">
		<!-- 여기 채워서 작업하시면 됩니다 .-->

		<div class="text-box">
			<span class="ffont1" style="font-weight: bold;">사원관리</span>

			<div class="card-body">

				<br>

				<form id="search_form" action="${ contextPath }/personnel/search"
					method="get">
					<input type="hidden" name="page" value="1">

					<div style="display: flex; justify-content: flex-end;">
						<!-- 드롭다운 버튼 -->
						<select class="datatable-selector" id="per-page" name="condition"
							style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px;">
							<option value="emp_name">이름</option>
							<option value="emp_no">사번</option>
						</select>

						<!-- width값은 페이지에 맞게 조절해주세요 -->
						<div class="search_box" style="width: 300px;">
							<input class="input_b" type="text" name="keyword"
								placeholder="검색">
							<div class="icon">
								<button type="submit">
									<i class="bi bi-search"></i>
								</button>
							</div>

						</div>

					</div>
				</form>

				<div class="btn-box-hover"
					style="display: flex; justify-content: flex-end; margin-top: 20px;">
					<a href="${contextPath}/personnel/empEntry">
						<button class="btn3-hover"
							style="height: 40px; margin-right: 0px;">사원등록</button>
					</a>
				</div>


				<br>


				<c:choose>
					<c:when test="${ empty list }">
						<tr>
							<td colspan="7">존재하는 사원이 없습니다</td>
						</tr>
					</c:when>

					<c:otherwise>
						<table class="table table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th scope="col">이름</th>
									<th scope="col">사번</th>
									<th scope="col">부서</th>
									<th scope="col">직위/직급</th>
									<th scope="col">입사일자</th>
									<th scope="col">이메일</th>
									<th scope="col">휴대폰</th>
									<th scope="col">급여</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="e" items="${ list }">
									<tr>
										<th scope="row"><a
											href="${contextPath}/personnel/detailEmp?no=${e.empNo}">${ e.empName }</a></th>
										<td>${ e.empNo }</td>
										<td>${ e.deptCode }</td>
										<td>${ e.empRank }</td>
										<td>${ e.createDate }</td>
										<td>${ e.empEmail }</td>
										<td>${ e.empPhone }</td>
										<td><button id="salarybutton" class="enroll"
												data-bs-toggle="modal" data-bs-target="#scrollingModal">등록</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>


				<div class="paging">

					<ul class="pagination d-flex justify-content-center text-dark"
						style="margin-top: 40px;">
						<li class="page-item ${ pi.currentPage == 1 ? 'disabled' : ''}">
							<a class="page-link"
							href="${ contextPath }/personnel/employeeManager?page=${pi.currentPage-1}">
								<i class="bi bi-chevron-double-left"></i> <span>이전</span>
						</a>
						</li>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a
								class="page-link"
								href="${ contextPath }/personnel/employeeManager?page=${p}">${ p }</a></li>
						</c:forEach>

						<li
							class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' } ">
							<a class="page-link"
							href="${ contextPath }/personnel/employeeManager?page=${pi.currentPage+1}">
								<span>다음</span>&nbsp; <i class="bi bi-chevron-double-right"></i>
						</a>
						</li>

					</ul>

				</div>


			</div>


		</div>

	</div>

	<!-- 급여등록 모달 -->
	<div class="modal fade" id="scrollingModal" tabindex="-1"
		aria-labelledby="salaryModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="">${ e.empName }님급여지급</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">

					<div class="mb-3">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">항목</th>
									<th scope="col">금액</th>
								</tr>
							</thead>
							<tbody>
								<!-- 기본급 입력 -->
								<tr>
									<td><label for="baseSalary" class="form-label">기본급</label></td>
									<td><input type="number" class="form-control"
										id="baseSalary" placeholder="기본급을 입력하세요" min="0" required>
										<button class="btn btn-secondary mt-2" id="salBase">보험료
											적용</button></td>
								</tr>

								<!-- 국민연금 -->
								<tr>
									<td><label for="nationalPension" class="form-label">국민연금</label></td>
									<td><input type="text" class="form-control" id="salNp"
										readonly></td>
								</tr>

								<!-- 건강보험 -->
								<tr>
									<td><label for="healthInsurance" class="form-label">건강보험</label></td>
									<td><input type="text" class="form-control" id="salHi"
										readonly></td>
								</tr>

								<!-- 고용보험 -->
								<tr>
									<td><label for="unemploymentInsurance" class="form-label">고용보험</label></td>
									<td><input type="text" class="form-control" id="salEi"
										readonly></td>
								</tr>

								<!-- 실지급급액 -->
								<tr>
									<td><label for="actualPayment" class="form-label">실지급급액</label></td>
									<td><input type="text" class="form-control"
										id="salNetSalary" readonly></td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="saveSalary">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->




	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>