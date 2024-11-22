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
        <div class="search-box" style="margin-bottom: 70px;">
          <div>
						<b style="font-size: 25px; margin-left: 10px;">발주 관리 리스트</b>
					</div>
					<hr>
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
            div#ordering-pro-box {
						    height: 300px;
						    overflow-y: scroll;
						}
						#ordering-pro-box{
							border: 1px solid lightgray;
						}
						
          </style>
          
          <div class="search-text">
            <div class="search-text-text">
              <span class="ffont3">요청자</span>
            </div>
            <div class="search-text-box">
              <input type="text">
              <button><i class="bi bi-search"></i></button>
            </div>
          </div>
        </div>
        <div class="table-box">
          <table class="table" style="text-align: center;">
            <thead>
              <tr>
                <th width="100px">번호</th>
                <th width="200px">발주 요청일</th>
                <th width="150px">요청자</th>
                <th width="150px">지점명</th>
                <th width="150px">상태</th>
                <th width="150px"></th>
              </tr>
            </thead>
            <tbody>
              <!-- case1. 조회된 게시글이 없을 경우 -->
             <c:choose>
            		<c:when test="${empty list }">
	                <tr>
	                  <td colspan="7" style="text-align: center;">존재하는 상품이 없습니다.</td>
	                </tr>
            		</c:when>
              	<c:otherwise>
		              <c:forEach var="o" items="${list }">
              			<!-- case2. 조회된 게시글이 있을 경우 -->
			              <tr>
			                <td>${o.orderNo }</td>
			                <td>${o.orderCheckDate }</td>
			                <td>${o.empNo }</td>
			                <td>${o.branchName }</td>
			                <td>${o.orderStatus }</td>
			                <td>
			                  <button class="btn4"  data-bs-toggle="modal" data-bs-target="#basicModal">
			                    조회
			                  </button>
			                  <button class="btn4" data-bs-toggle="modal" data-bs-target="#basicModal2">
			                    배차
			                  </button>
			                </td>
			
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
              	<a class="page-link" href="${contextPath }/ordering/adminList.or?page=${pi.currentPage-1}"><i class="bi bi-chevron-double-left"></i><span>이전</span></a>
              </li>
              
              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              	<li class="page-item ${ pi.currentPage == p ? 'active' : '' }">
              		<a class="page-link" href="${contextPath }/ordering/adminList.or?page=${p}">${ p }</a>
              	</li>
              </c:forEach>
              
              <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
              	<a class="page-link" href="${contextPath }/ordering/adminList.or?page=${pi.currentPage+1}"><span>다음</span>&nbsp;<i
									class="bi bi-chevron-double-right"></i></a>
              </li>
              
            </ul>
          </div>
          
        </div>
      </div>     
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	 <div class="modal fade" id="basicModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"> 
                    <h5 class="modal-title">발주 영수증</h5>  
                </div>
                <div class="modal-body">
                    <!-- Branch and Date Information -->
                    <div class="branch_and_date">
                        <div class="branch">서울 ㅇㅇ 지점</div>
                        <div class="ok_date">승인 날짜: 2024.11.05</div>
                    </div>

                    <!-- Order Details Table -->
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">발주일자</th>
                                <td>2021.05.14</td>
                                <th scope="col">지점장</th>
                                <td>김개똥</td>
                            </tr>
                        </thead>
                    </table>

                    <!-- Main Table with Overflow Scroll -->
                    <div id="ordering-pro-box">
	                    <table class="table table-bordered" id="body_main_table" style="border-radius: 30px;">
	                        <thead>
	                            <tr>
	                                <th scope="col">번호</th>
	                                <th scope="col">고유번호</th>
	                                <th scope="col">분류</th>
	                                <th scope="col">상품명</th>
	                                <th scope="col">수량</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr><th>1</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>2</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>3</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>4</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>5</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>5</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>5</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>5</th><td></td><td></td><td></td><td></td></tr>
	                            <tr><th>5</th><td></td><td></td><td></td><td></td></tr>
	                        </tbody>
	                    </table>
										</div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger">반려</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">승인</button>
                    </div>

                    <!-- Pick-Up Table -->
                    <div class="pickUp_table">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">배차 차량종류</th>
                                    <td>트럭</td>
                                    <th scope="col">배차 운송기사</th>
                                    <td>김개똥</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">전화번호</th>
                                    <td>010-1234-1235</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Approval Section -->
                    <div style="display: flex; justify-content: end;">
                        <div style="border: 1px solid rgb(185, 185, 185); width: 103px; height: 55px; display: flex; align-items: center; justify-content: center;">승인자</div>
                        <div style="border: 1px solid rgb(185, 185, 185); width: 210px; height: 55px; display: flex; align-items: center; justify-content: center;">팀장 강개똥</div>
                    </div>

                    <!-- Footer Approval Button -->
                    <div class="footer_btn" style="display:flex; justify-content: end;">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
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
                                    <td>트럭</td>
                                    <th scope="col">배차 운송기사</th>
                                    <td>김개똥</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">전화번호</th>
                                    <td>010-1234-1235</td>
                                    <td>배차 일자</td>
                                    <td>2024.11.11</td>
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
</body>
</html>