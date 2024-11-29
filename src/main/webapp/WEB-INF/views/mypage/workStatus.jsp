<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* paging 스타일 start*/
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
/* paging 스타일 end*/
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      <div class="text-box">             
      <span class="ffont1" style="font-weight: bold;">근태조회</span>

      <div class="card-body">
        <br>


        <table class="table table-bordered" style="width: 500px; text-align: center;  ">
            <thead>
            <!--  <tr>
                <th scope="col">조회일자</th>
                <th scope="col">
                    <input type="date"  style="cursor: pointer; " onclick="">
                </th>
              </tr> --> 
            </thead>

            <tbody>
              <tr>
                <th scope="row">성명</th>
                <th>${empName}</th>
              </tr>
            </tbody>

        </table>

        <br>

        <!-- Table with hoverable rows -->
        <table class="table table-hover" style="text-align: center;" >
         <c:choose>
          <c:when test= "${ empty list }">
          <thead>
            <tr>
              <th scope="co1">일자</th>
              <th scope="col">요일</th>
              <th scope="col">구 분</th>
              <th scope="col">출근시간</th>
              <th scope="col">퇴근시간</th>
              <th scope="col">부여된연차</th>
              <th scope="col">사용가능연차</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td colspan="7">조회된 근태가 없습니다.</td>
            </tr>
          </tbody>
          </c:when>
          </c:choose>
          	 <thead>
            <tr>
              <th scope="co1">일자</th>
              <th scope="col">요일</th>
              <th scope="col">구 분</th>
              <th scope="col">출근시간</th>
              <th scope="col">퇴근시간</th>
              <th scope="col">부여된연차</th>
              <th scope="col">사용가능연차</th>
            </tr>
          </thead>
          <tbody>
  					<c:forEach var="status" items="${list}">
                        <tr>
                            <td>${status.workDay}</td> 
                            <td>${status.dayOfWeek}</td> <!-- 요일 -->
                            <td>${status.workType}</td> 
                            <td>${status.workStartTime}</td> 
                            <td>${status.workEndTime}</td> 
                            <td>${status.assignedLeave}</td> 
                            <td>${status.availableLeave}</td> 
                        </tr>
             </c:forEach>

              
              </tbody>
              </table>
<c:if test="${ not empty list }">							
 <div class="paging" >
    <ul class="pagination d-flex justify-content-center text-dark" style="margin-top: 40px;">
        <!-- 이전 페이지 버튼 -->
        <li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
            <a class="page-link" href="${contextPath}/mypage/workStatus.wo?page=${pi.currentPage - 1}">
                <i class="bi bi-chevron-double-left"></i> <span>이전</span>
            </a>
        </li>

        <!-- 페이지 번호 -->
        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            <li class="page-item ${pi.currentPage == p ? 'active' : ''}">
                <a class="page-link" href="${contextPath}/mypage/workStatus.wo?page=${p}">${p}</a>
            </li>
        </c:forEach>

        <!-- 다음 페이지 버튼 -->
        <li class="page-item ${pi.currentPage == pi.maxPage ? 'disabled' : ''}">
            <a class="page-link" href="${contextPath}/mypage/workStatus.wo?page=${pi.currentPage + 1}">
                <span>다음</span>&nbsp;
                <i class="bi bi-chevron-double-right"></i>
            </a>
        </li>
    </ul>
 </div>
</c:if>						
							
							
              <div class="btn-box-hover" style="display: flex; justify-content: flex-end;">
                <button class="btn3-hover" style="width:150px; border-radius: 10px;" onclick="location.href='${contextPath}'">홈으로</button> 
              </div>


            </div>
            
            
      </div>
      
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>