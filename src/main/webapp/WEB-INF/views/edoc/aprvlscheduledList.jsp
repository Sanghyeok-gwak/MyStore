<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /**/
    /* body에들어가는 양식입니다. 원페이지 이신분들은 이거 사용하신됩니다. */
    .text-box{
      border-radius: 20px;
      height: 100%;
      width: 100%;
      background-color: white;
      padding:30px;
    }
    .ffont1{
      font-size: 25px;
      line-height: 30px;
      font-weight: 400;
    }
    .ffont2{
      font-size: 22px;
      line-height: 30px;
      font-weight: 400;
    }
    .ffont3{
      font-size: 18px;
      line-height: 30px;
      font-weight: 400;
    }
    /* 영역 나누려고 한거라 이건 참고안하셔도됩니다. */
    .text-box1{
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
    }

    /* 일반 버튼 색상 알잘딱갈센으로 골라서 사용하시면됩니다 (*이것또한 넓이높이만 수정해서 사용하세요) */
    .btn-box button{
      margin-right: 10px;
      border-radius: 5px;
      width: 120px;
      height: 30px;
      border: 0px;
    }
    .btn1{
      background-color: rgb(248, 103, 103);
      color: white;
    }
    .btn2{
      background-color: rgb(179, 179, 179);
      color: white;
    }
    .btn3{
      background-color: rgb(72, 72, 234);
      color: white;
    }
    /* 버튼 호버 스타일*/
    .btn-box-hover button{
      margin-right: 10px;
      border-radius: 5px;
      width: 100px;
      height: 30px;
      border: 0px;
      transition-property: background-color;
      transition-duration: 0.5s;
    }
    .btn1-hover {
      background-color: rgb(248, 103, 103);
      color: white;
    }
    .btn2-hover {
      background-color: rgb(179, 179, 179);
      color: white;
    }
    .btn3-hover {
      background-color: rgb(72, 72, 234);
      color: white;
    }
    .btn1-hover:hover {
      background-color: rgb(196, 55, 55);
      color: white;
    }
    .btn2-hover:hover {
      background-color: rgb(116, 116, 116);
      color: white;
    }
    .btn3-hover:hover {
      background-color: rgb(23, 23, 128);
      color: white;
    }

    /* 넓이 높이만 수정해서 사용하세요 인풋 스타일*/
    input{
      border: 1px solid gray;
      border-radius: 2px;
      height: 40px;
      width: 100%;
      border-radius: 5px;
      font-size: 18px;
      box-sizing: border-box;
    }


    /* topdiv 스타일 start */
    #topdiv > #menu_name{
      font-size: 25px;
      line-height: 30px; 
      font-weight: 400;
    }
    /* topdiv 스타일 end */

    /* middiv 스타일 start */
    #middiv{
      font-size: 18px;
      line-height: 30px; 
      font-weight: 400;
      display: flex;
      justify-content: flex-end;
    }
    #lang{
      width: 140px;
      font-size: 18px;
      line-height: 30px; 
      font-weight: 400;
      border-radius: 5px;
    }
    #writer {
      background-color: #99A1EF;
      color: white;
      height: 40px;
      width: 140px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #writer_content {
      background-color: #ffffff;
      color: rgb(0, 0, 0);
      height: 40px;
      width: 200px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #aprr1{
      background-color: #99A1EF;
      color: white;
      height: 120px;
      width: 60px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #aprr1_content{
      background-color: #ffffff;
      color: rgb(0, 0, 0);
      height: 20px;
      width: 120px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #aprr1_content2{
      background-color: #ffffff;
      color: rgb(0, 0, 0);
      height: 80px;
      width: 120px;
      text-align: center;
      border-radius: 5px;
    }
    .container {
    display: flex;
    gap: 30px; /* 요소 간 간격 */
    justify-content: flex-end;
    align-items: flex-end
    }
    .spacer {
    margin-left: auto; /* 왼쪽 여백을 최대화하여 오른쪽으로 밀기 */
    }

    .icon > button{
        border: none;
        background: none;
        outline: none;
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
    /* middiv 스타일 end */


    /* middiv2 스타일 start */
    #middiv2{
      display: flex;
      font-size: 18px;
      line-height: 30px; 
      font-weight: 400;
    }


    /* middiv2 스타일 end */


    /* middiv3 스타일 start */
    input[type=file]::file-selector-button{
      background-color: #99A1EF;
      color: white;
      border: none;
      width: 113.5px;
      height: 47.5px;
      font-size: 18px;
      line-height: 30px; 
      font-weight: 400;
    }
    #fileupload{
      width: 100%
    }
    /* middiv2 스타일 end */

    #smarteditor{
      margin-top: 10px;
    }


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

            <!-- 처음 start -->
            <div id="topdiv"> 

              <span class="ffont1" style="font-weight: bold;">결재 예정 문서</span>

            </div> 
            <!-- 처음 end -->

            <hr>

            <!-- 중간1 start-->
		        <form action="${contextPath}/edoc/aprvlscheduledListsearch.do" method="get">
							<div style="display: flex; justify-content: flex-end;">
								<div>
									<select name="condition" id="lang"
										style="height: 40px; margin-bottom: 20px;">
										<option value="sample_desc">제목</option>
										<option value="emp_no">기안자</option>
									</select>
								</div>
		
								<!-- width값은 페이지에 맞게 조절해주세요 -->
								<div class="search_box" style="width: 500px; height: 40px;">
									<input class="input_b" type="text" placeholder="검색"
										style="height: auto;">
									<div class="icon">
										<button type="submit">
											<i class="bi bi-search"></i>
										</button>
									</div>
								</div>
		
							</div>
						</form> 
            <!-- 중간1 end-->


            <!-- 중간2 start -->
            <div id="middiv2">  
              <table class="table table-hover">

                <thead style="cursor: pointer;">
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">유형</th>
                    <th scope="col">제목</th>
                    <th scope="col">기안자</th>
                    <th scope="col">기안일</th>
                    <th scope="col">만료일</th>
                    <th scope="col">상태</th>
                  </tr>
                </thead>

                <tbody style="cursor: pointer;">
					
								<c:choose>
											<c:when test="${ empty list }">
												<tr>
													<td colspan="6"
														style="text-align: center; vertical-align: middle;">
														조회된 결재 예정 문서가 없습니다.</td>
												</tr>
											</c:when>
				
											<c:otherwise>
												<c:forEach var="cl" items="${ list }">
													<tr>
														<td>${ cl.aprvlNo }</td>
														<td>${ cl.sampleNo }</td>
														<td>${ cl.edocTitle }</td>
														<td>${ cl.empName }</td>
														<td>${ cl.startDt }</td>
														<td>${ cl.endDt }</td>
														<td>${ cl.aprvlStatus }</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
                  

                </tbody>
              </table>
            </div> 
            <!-- 중간2 end -->


    <!-- 페이징 -->
			<c:if test="${ not empty list }">
				<div class="paging">
					<ul class="pagination d-flex justify-content-center text-dark"
						style="margin-top: 40px;">
						<li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
							<a class="page-link" href="${ contextPath }/edoc/aprvlscheduledList.do?page=${pi.currentPage-1}">
								<i class="bi bi-chevron-double-left"></i> <span>이전</span>
							</a>
						</li>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item ${ pi.currentPage == p ? 'active' : '' }">
								<a class="page-link" href="${ contextPath }/edoc/aprvlscheduledList.do?page=${p}">${p}</a>
							</li>
						</c:forEach>

						<li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
							<a class="page-link" href="${ contextPath }/edoc/aprvlscheduledList.do?page=${pi.currentPage+1}">
								<span>다음</span>&nbsp; 
								<i class="bi bi-chevron-double-right"></i>
						 </a>
						</li>
					</ul>
				</div>
			</c:if>
			<!-- 페이징 end -->


      </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>