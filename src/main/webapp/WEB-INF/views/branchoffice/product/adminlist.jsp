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
            <form id="search_form" action="${contextPath}/branchoffice/search.po" method="get">
	            <div class="search-text-box">
	            	<input type="hidden" name="page" value="1">
	              <input type="text" id="searchValue" name="keyword" style="padding-left:10px;" value="${ search }">
	           
	              <button type="submit"><i class="bi bi-search"></i></button>
	            </div>
            </form>
            <c:if test="${ not empty search }">
	            <script>
	            	$(document).ready(function(){
										$("#paging_area a").on("click", function(){
	            			
	            			let page = $(this).text(); // Previous | Next | 페이지번호
	            			if(page == 'Previous'){
	            				page = ${pi.currentPage - 1};
	            			}else if(page == 'Next'){
	            				page = ${pi.currentPage + 1};
	            			}
	            			
	            			$("#search_form input[name=page]").val(page);
	            			$("#search_form").submit();
	            			
	            			return false;
	            	})
	            </script>
	          </c:if>  
          </div>
          <div class="add-edit-box">
            <button class="btn4" onclick='location.href="${contextPath}/branchoffice/regist.po"' style="margin-right: 5px;">추가</button>
            <button class="btn4" onclick="fnDeleteSelected()">삭제</button>
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
			                <td ><input type="checkbox" class="list-checkBox" value="${p.productNo }" onclick="event.stopPropagation();"></td>
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
	<script>
	<!-- 상품 삭제 스크립트 -->
       	function fnDeleteSelected() {
				    const checkboxes = document.querySelectorAll('.list-checkBox:checked');
				    const checkedValues = [];
				    checkboxes.forEach(checkbox => {
				        checkedValues.push(checkbox.value);
				    });
				    if (checkedValues.length === 0) {
				        alert('삭제할 상품을 선택해주세요.');
				        return;
				    }
		
				    const confirmation = confirm('선택한 상품을 삭제하시겠습니까?'); 
				    if (confirmation) {
		
				        $.ajax({
		            		
				        	url:'${contextPath}/branchoffice/deleteProduct.po',
		            		traditional: true, 
		            		type:'post',
		            		data: { checkedValues: checkedValues }, 
		            		success: function(result) {
		                        if (result>0) {
		                            alert('상품이 삭제되었습니다.'); 
		                            location.reload(); 
		                        } else {
		                            alert('삭제에 실패했습니다.'); 
		                        }
		                    },
		            	});
				    }
				}
       	</script>
       	
       	
       	
       	
       	<!-- 
       	 <script>
       	 function fnSearch(){
      	   const searchValue = document.getElementById('searchValue').value;
		     		 console.log(document.getElementById('searchValue').value);
		     		 
		     		 $.ajax({
		     			 url: "${contextPath }/branchoffice/search.po",
		     			 type: "post",
		     			 data:{
		     				 search: searchValue
		     			 }
		     		 })
		     			 
		     		 
		     	}

         </script>
          -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>