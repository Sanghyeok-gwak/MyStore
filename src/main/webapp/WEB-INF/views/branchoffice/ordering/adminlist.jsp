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
			                <td>${o.deptCode }</td>
			                <td>
			                	${o.orderStatus == 'N' ? '반려' : o.orderStatus == 'Y' ? '승인' : o.orderStatus == 'I' ? '대기중' : '상태 미정'}
			                </td>
			                <td>
			                	<button class="btn4 view-order" 
															        data-order-no="${o.orderNo}" 
															        data-order-empNo="${o.empNo}"  
															        data-order-deptCode="${o.deptCode}"  
															        data-order-orderCheckDate="${o.orderCheckDate}" 
															        data-order-approvalNo="${o.approvalNo}"
															        data-bs-toggle="modal" 
															        data-bs-target="#basicModal">
												  조회
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
	 <script>
			 $(document).ready(function () {
				  $(".view-order").on("click", function () {
				    const orderNo = $(this).data("order-no");
				    const empNo = $(this).data("order-empno");
				    const deptCode = $(this).data("order-deptcode");
				    const orderCheckDate = $(this).data("order-ordercheckdate");
				    const approvalNo = $(this).data("order-approvalno");
				    console.log(empNo);
				    console.log(deptCode);
				    console.log(orderCheckDate);
				    
				    
				    $.ajax({
				      url: '${contextPath}/ordering/orderingPro.or', 
				      type: "post",
				      data: { "orderNo": orderNo },
				      dataType: "json",
				      success: function (data) {
				       
				        
				        
				       
				        const tbody = $("#body_main_table tbody");
		                tbody.empty();  

		               
		                data.forEach(function (item, index) {
		                	const row = "<tr>" +
		                                  "<td>" + (index + 1) + "</td>" +
		                                  "<td>" + item.productNo + "</td>" +  
		                                  "<td>" + item.productName + "</td>" +
		                                  "<td>" + item.inventory + "</td>" +
		                              "</tr>";
		                    tbody.append(row); 
		                });
		                $(".branch").text(deptCode);
		                $("#orderCheckDate-date").text(orderCheckDate); 
		                $("#empNo-name").text(empNo); 
		                $("#hidden-order-No").val(orderNo);
		                $("#empName-div").text(approvalNo);
				      },
				      error: function () {
				        alert("데이터를 불러오는 중 오류가 발생했습니다.");
				      }
				    });
				  });
				});	 
	 </script>
	
	 <div class="modal fade" id="basicModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"> 
                    <h5 class="modal-title">발주 영수증</h5>  
                    
                    <input type="hidden" id="hidden-order-No">
                </div>
                <div class="modal-body">
                    <!-- Branch and Date Information -->
                    <div class="branch_and_date" id="top_main_table">
                        <div class="branch"></div>
                        <div class="ok_date"></div>
                    </div>
			
                    <!-- Order Details Table -->
                    <table class="table table-bordered" id="middle_main_table">
                        <thead>
                            <tr>
                                <th scope="col">발주일자</th>
                                <td id="orderCheckDate-date"></td>
                                <th scope="col">지점장</th>
                                <td id="empNo-name"></td>
                            </tr>
                        </thead>
                    </table>

                    <!-- Main Table with Overflow Scroll -->
                    <div id="ordering-pro-box">
	                    <table class="table table-bordered" id="body_main_table" style="border-radius: 30px;">
	                        <thead>
	                            <tr>
	                                <th scope="col">번호</th>
	                                <th scope="col">상품번호</th>
	                                <th scope="col">상품명</th>
	                                <th scope="col">수량</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                            	<td></td>
	                            	<td></td>
	                            	<td></td>
	                            	<td></td>
	                            </tr>
	                        </tbody>
	                    </table>
										</div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="companion-btn" onclick="fnCompanion();" disabled>반려</button>
                        <button type="button" class="btn btn-primary" id="approval-btn" onclick="fnApproval();" disabled>승인</button>
                    </div>

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

                    <!-- Approval Section -->
                    <div style="display: flex; justify-content: end;" id="approver-emp-box">
                        <div style="border: 1px solid rgb(185, 185, 185); width: 103px; height: 55px; display: flex; align-items: center; justify-content: center;">승인자</div>
                        <div style="border: 1px solid rgb(185, 185, 185); width: 210px; height: 55px; display: flex; align-items: center; justify-content: center;" id="empName-div"></div>
                    </div>
                    <!-- 버튼 비활성화 -->
										<script>
										    function updateButtonState() {
										        const empNameDiv = document.getElementById("empName-div");
										        const companionBtn = document.getElementById("companion-btn");
										        const approvalBtn = document.getElementById("approval-btn");
										
										        if (empNameDiv.innerText.trim() === "") {
										            companionBtn.disabled = false;
										            approvalBtn.disabled = false;
										        } else {
										            companionBtn.disabled = true;
										            approvalBtn.disabled = true;
										        }
										    }
										
										    document.addEventListener("DOMContentLoaded", () => {
										        const empNameDiv = document.getElementById("empName-div");
										        const observer = new MutationObserver(updateButtonState);
										
										        observer.observe(empNameDiv, { childList: true, characterData: true, subtree: true });
										
										        updateButtonState();
										    });
										</script>
                    <!-- Footer Approval Button -->
                    <div class="footer_btn" style="display:flex; justify-content: end; margin-top:10px">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                    </div>
                </div> 
            </div>
        </div>
    </div>
		<script>
		function fnCompanion(){
		   	const confirmResult = confirm("반려하시겠습니까?");
		    const orderNo = $("#hidden-order-No").val();
		    
		    if (confirmResult) {
		        const empNo='${loginUser.empName}';
		        console.log(empNo);
		        $.ajax({
		        	url:'${contextPath}/ordering/companion.or',
		        	type:'post',
		        	data:{empNo:empNo , orderNo:orderNo},
	        	  success: function (data) {
	        			 console.log(data);
	        		   if(data>0){
					        alert("반려 처리되었습니다.");
					        document.getElementById("empName-div").innerText = '${loginUser.empName}';
					        location.reload();
	        			 }else{
					        alert("반려 처리가 실패되었습니다.");
	        			 }
	        	  }
		        })
		    } else {
		        alert("반려가 취소되었습니다.");
		    }
		}
		function fnApproval(){
			const confirmResult = confirm("승인하시겠습니까?");
		  const orderNo = $("#hidden-order-No").val();
	    if (confirmResult) {
	        const empNo='${loginUser.empName}';
	        console.log(empNo);
	        $.ajax({
	        	url:'${contextPath}/ordering/approval.or',
	        	type:'post',
	        	data:{empNo:empNo , orderNo:orderNo},
        	  success: function (data) {
        			 
        		   if(data!=null){
				        document.getElementById("empName-div").innerText = '${loginUser.empName}';
				        document.getElementById("car-type").innerText = data.vehicleType;
				        document.getElementById("car-name").innerText = data.opepator;
				        document.getElementById("car-number").innerText = data.licensPlate;
				        alert("승인 처리되었습니다.");
        			 }else{
				        alert("승인 처리가 실패되었습니다.");
        			 }
        	  }
	        })
	    } else {
	        alert("승인이 취소되었습니다.");
	    }
		}
		
		
		</script>
</body>
</html>