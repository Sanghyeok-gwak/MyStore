<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
       <div class="text-box">
        <div class="search-box">
          <style>
            .search-text {
              display: flex;
              justify-content: end;
            }
            .search-text-text {
              width: 100px;
              border: 1px solid lightgray;
              text-align: center;
              border-radius: 5px;
              height: 30px;
              margin-right: 5px;
            }
            .search-text-box {
              position: relative;
              height: 30px;
              width: 300px; 
            }
            .search-text-box input {
              width: 100%;
              border: 1px solid lightgray;
              border-radius: 5px;
              height: 100%;
              padding-right: 30px; 
            }
            .search-text-box button {
              position: absolute;
              right: 5px;
              top: 50%;
              transform: translateY(-50%);
              background-color: white;
              border: none;
              padding: 0;
              cursor: pointer;
            }
            .add-edit-box{
              margin-top: 20px;
              margin-bottom: 20px;
              display: flex;
              justify-content: end;
            }
          </style>
          
         	<div>
						<b style="font-size: 25px; margin-left: 10px;">상품 관리 리스트</b>
					</div>
					<hr>
          <div class="search-text">
            <div class="search-text-text">
              <span class="ffont3">상품명</span>
            </div>
            <div class="search-text-box">
              <input type="text">
              <button><i class="bi bi-search"></i></button>
            </div>
          </div>
          <div class="add-edit-box">
            <button class="btn4" onclick='location.href="${contextPath}/branchoffice/regist.po"' style="margin-right: 5px;">추가</button>
            <button class="btn4">삭제</button>
          </div>
        </div>
        <div class="table-box">
          <table class="table table-hover" style="text-align: center;">
            <thead>
              <tr>
                <th width="100px"></th>
                <th width="100px">번호</th>
                <th width="150px">분류</th>
                <th width="300px">상품명</th>
                <th width="100px">원가</th>
                <th width="100px">매가</th>
                <th width="100px">매익률</th>
              </tr>
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${empty list }">
	                <tr>
	                  <td colspan="8" style="text-align: center;">존재하는 상품이 없습니다.</td>
	                </tr>
            		</c:when>
              	<c:otherwise>
		              <c:forEach var="p" items="${list }">
			              <tr id="proNo" onclick='location.href="${contextPath}/branchoffice/detail.po?prono=${p.productNo }"'>
			                <td ><input type="checkbox" name="list-checkBox"></td>
			                <td>${p.productNo }</td>
			                <td>${p.productDivision }</td>
			                <td>${p.productName }</td>
			                <td>${p.cost }</td>
			                <td>${p.sailPrice }</td>
			                <td>${p.profitMargin }</td>
			              </tr>
		              </c:forEach>
              	</c:otherwise>
            	</c:choose>
            </tbody>
          </table>
         
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
          </style>
          <div class="paging"> 
            <ul id="paging_area" class="pagination d-flex justify-content-center">
            
              <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
              	<a class="page-link" href="${contextPath }/branchoffice/adminList.po?page=${pi.currentPage-1}"><i class="bi bi-chevron-double-left"></i><span>이전</span></a>
              </li>
              
              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              	<li class="page-item ${ pi.currentPage == p ? 'active' : '' }">
              		<a class="page-link" href="${contextPath }/branchoffice/adminList.po?page=${p}">${ p }</a>
              	</li>
              </c:forEach>
              
              <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
              	<a class="page-link" href="${contextPath }/branchoffice/adminList.po?page=${pi.currentPage+1}"><span>다음</span>&nbsp;<i
									class="bi bi-chevron-double-right"></i></a>
              </li>
              
            </ul>
          </div>
        </div>
      </div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>