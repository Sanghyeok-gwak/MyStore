<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
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
      <!-- 여기 채워서 작업하시면 됩니다 .-->
       <div class="text-box">
       	<div>
						<b style="font-size: 25px; margin-left: 10px;">발주 관리 리스트</b>
				</div>
				<hr>
        <div class="search-box" style="margin-bottom: 70px;">
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
              margin-top: 80px;
              margin-bottom: 20px;
              display: flex;
              justify-content: end;
            }
          </style>
          <div class="search-text">
            <div class="search-text-text">
              <span class="ffont3">발주 일</span>
            </div>
          <form id="search_form" action="${contextPath}/ordering/searchdate.or" method="get">
            <div class="search-text-box">
	            	<input type="hidden" name="page" value="1">
              <input type="date" id="searchValue" name="keyword" style="padding-left: 10px;">
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
        </div>
        <div class="order-add-box" style="display:flex; justify-content: end; margin-bottom:20px;">
        	<button class="btn4" onclick='location.href="${contextPath }/ordering/insertpage.or"'>발주등록</button>
        </div>
        <div class="table-box">
          <table class="table table-hover" style="text-align: center;">
            <thead>
              <tr>
                <th width="100px">번호</th>
                <th width="200px">발주 요청일</th>
                <th width="150px">요청자</th>
                <th width="150px">발주 승인 여부</th>
                <th width="100px"></th>
              </tr>
            </thead>
            <tbody>
                <c:choose>
			        		<c:when test="${empty list }">
              	<!-- case1. 조회된 게시글이 없을 경우 -->
		                <tr>
		                  <td colspan="6" style="text-align: center;">존재하는 발주가 없습니다.</td>
		                </tr>
			        		</c:when>
		        		<c:otherwise>
             		<!-- case2. 조회된 게시글이 있을 경우 -->
		        			<c:forEach var="o" items="${list }">
			              <tr class="order-row" data-order-no="${o.orderNo}">
			                <td>${o.orderNo }</td>
			                <td>${o.orderCheckDate }</td>
			                <td>${o.empNo }</td>
			                <td>
			                	${o.orderStatus == 'N' ? '반려' : o.orderStatus == 'Y' ? '승인' : o.orderStatus == 'I' ? '대기중' : '상태 미정'}
			                </td>
			                <td>
			                	<c:if test="${o.orderStatus == 'Y'}">
				                  <button class="btn4 view-order" data-order-no="${o.orderNo}"   data-bs-toggle="modal" data-bs-target="#basicModal2">
				                    배차
				                  </button>
			                  </c:if>
			                </td>
			              </tr>
			            </c:forEach> 
		        		</c:otherwise>
		        	</c:choose>
            </tbody>
          </table>
          <script>
	          $(document).ready(function() {
	        	    $(".order-row").click(function() {
	        	        var orderNo = $(this).data("order-no"); 
	        	        console.log(orderNo)
	        	        window.location.href = '${contextPath}/ordering/detail.or?orderNo=' + orderNo;
	        	    });
	        	});
          </script>
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
              	<a class="page-link" href="${contextPath }/ordering/list.or?page=${pi.currentPage-1}"><i class="bi bi-chevron-double-left"></i><span>이전</span></a>
              </li>
              
              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              	<li class="page-item ${ pi.currentPage == p ? 'active' : '' }">
              		<a class="page-link" href="${contextPath }/ordering/list.or?page=${p}">${ p }</a>
              	</li>
              </c:forEach>
              
              <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
              	<a class="page-link" href="${contextPath }/ordering/list.or?page=${pi.currentPage+1}"><span>다음</span>&nbsp;<i
									class="bi bi-chevron-double-right"></i></a>
              </li>
              
            </ul>
          </div>
          
        </div>
      </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<div class="modal fade" id="basicModal2" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"> 
                    <h5 class="modal-title">배차 조회</h5>  
                </div>
                <div class="modal-body">
  

                    <!-- Pick-Up Table -->
                    <div class="pickUp_table">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">배차 차량종류</th>
                                    <td id="car-type"></td>
                                    <th scope="col">배차 운송기사</th>
                                    <td id="car-name"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">차량번호</th>
                                    <td colspan="3" id="car-number"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Footer Approval Button -->
                    <div class="footer_btn">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
		   $(document).ready(function () {
			  $(".view-order").on("click", function () {
			    const orderNo = $(this).data("order-no");
			    
			    $.ajax({
			      url: '${contextPath}/ordering/orderingPro.or', 
			      type: "post",
			      data: { "orderNo": orderNo },
			      dataType: "json",
			      success: function (data) {
	             document.getElementById("car-type").innerText = data.dis.vehicleType;
				       document.getElementById("car-name").innerText = data.dis.opepator;
				       document.getElementById("car-number").innerText = data.dis.licensPlate;
			      },
			      error: function () {
			        alert("데이터를 불러오는 중 오류가 발생했습니다.");
			      }
			    });
			  });
			});	 
    </script>
</body>
</html>