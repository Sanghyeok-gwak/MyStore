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
        width: 100%;
        margin-left: 3%;
    }
    .icon{
      margin-right: 10px;
    }
    .enroll{
      border:none; 
      background-color:  white; color: black;
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
    .payment-top{
      	margin-top:20px;
      	margin-bottom:20px;
				display:flex;   
				justify-content: space-between;   
      }
      .payment-top-right{
      	display:flex;
      }
      .search_box input{
      	 height:38px; 
    

  </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      
      <div class="text-box">             
      <span class="ffont1" style="font-weight: bold;">급여입력</span>
      
      <div class="payment-top">
      	<div class="payment-top-left">
        <table class="table table-bordered" style="width: 500px; text-align: center;  ">
            <thead>
              <tr>
                <th scope="col" style="background-color: rgba(123, 131, 211, 0.9);">정산기간</th>
                <th scope="col" >
                    <input type="date" style="cursor: pointer; " onclick="">
                    ~
                    <input type="date" style="cursor: pointer; " onclick="">
                </th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <th style="background-color: rgba(123, 131, 211, 0.9);">급여지급일</th>
                <th>11월 10일</th>
              </tr>
            </tbody>

        </table>
      	</div>
      	<div class="payment-top-right">
      		<div class="payment-top-right-text">
			      <select class="datatable-selector" name="per-page" style=" height:40px; margin-right: 5px;">
			        <option value="">이름</option>
			        <option value="">사번</option>
			      </select>
		      </div>
					<div class="payment-top-right-input">		        
		      	<!-- width값은 페이지에 맞게 조절해주세요 -->
			      <div class="search_box" style="width:300px;">
			        <input class="input_b" type="text" placeholder="검색">
			        <div class="icon">
			          <button><i class="bi bi-search"></i></button>
			        </div>  
			      </div>
		      </div>
      	</div>
      </div>



      <td><button class="enroll"  data-bs-toggle="modal" data-bs-target="#scrollingModal">등록</button></td>






<!-- 급여등록 모달 -->
          <div class="modal fade" id="scrollingModal" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog">

              <div class="modal-content" style="width: 700px;">

                <div class="modal-header">
                  <h5 class="modal-title">천예찬님 급여지급</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body" style="min-height: 400px;">

                  
                  <table class="table" style="width: 600px; height: 200px;">
                    <thead>
                      <tr>
                        <th class="details-header">지급항목</th>
                        <th class="details-header">금액</th>
                        <th class="details-header">공제항목</th>
                        <th class="details-header">금액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>기본급여</td>
                        <td><input type="number"> </td>
                        <td>국민연금</td>
                        <td><input type="number"></td>
                      </tr>
                      <tr>
                        <td>시간외수당</td>
                        <td><input type="number"></td>
                        <td>건강보험</td>
                        <td><input type="number"></td>
                      </tr>
                      <tr>
                        <td>상여금</td>
                        <td><input type="number"></td>
                        <td>고용보험</td>
                        <td><input type="number"></td>
                      </tr>
                      <tr>
                        <td>총지급금액</td>
                        <td><input type="number"></td>
                        <td>총공제금액</td>
                        <td><input type="number"></td>
                      </tr>
                      
                    </tbody>
                  </table>
                  
                  <br>

                  <div class="" style="display: flex; justify-content: center">
                    <button class="btn2-hover" style="margin-right: 5px;" >보험료 계산</button>
                    <button class="btn2-hover">실지급액 계산</button>

                  </div>

                  <br>

                  <div class=""  style="display: flex; justify-content: center">
                    <span class="ffont3">
                      실지급액 : 2,389,283 원
                    </span>
                  </div>

                </div>


                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary">저장</button>
                </div>
              </div>
            </div>
          </div>
          <!-- 모달end-->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>