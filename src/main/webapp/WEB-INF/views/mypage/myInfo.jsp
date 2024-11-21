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
.product-img-box, .input-box-top, .input-box-body {
            border-radius: 20px;
            background-color: white;
            padding: 30px;
        }

        .body-body {
            display: flex;
            flex-direction: column;
        }

        .product-add-top {
            display: flex;
            margin-bottom: 20px;
            height: 100%;
        }

        .product-img-box {
            width: 30%;
            margin-right: 20px;
            height: 400px;
        }

        .input-box-top {
            width: 70%;
            height: 100%;
        }

        .upload-image {
            height: 100%;
            width: 100%;
        }

        .input-box-top {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .input-box-top-box {
            display: flex;
            margin-bottom: 30px;
        }

        .input-box-top-box-text {
            width: 30%;
            padding-: 3%;
        }

        .input-box-top-box-input {
            width: 70%;
            margin-right: 3%;
        }

        .input-box-top input {
            height: 30px;
            width: 100%;
            border: 1px solid lightgray;
        }

        .addr-box {
            display: flex;
        }

        .addr-box-left {
            width: 95%;
        }

        .addr-box-right {
            width: 5%;
        }

        .addr-box-right button {
            width: 100%;
            background-color: white;
            height: 30px;
            border: 1px solid lightgray;
        }

        .btn-box-hover button {
            width: 373px;
            height: 35px;
        }	
     	
     	.input-box-top input {
     		padding-left: 10px;
     	}
</style>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

        // 주소 API 실행
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = '';
                    if (data.userSelectedType === 'R') { 
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
        
     </script>    
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <span class="ffont1" style="font-weight: bold;">마이페이지</span>
      
      	
      
      
      
      
      
      
      <div class="product-add-top">
      
        <br>
        
        <!-- input type = image 라서 value값이 아니고 src 사용했음, 뒤에는 만약에 이미지 안뜰까봐 디폴트값 처리 -->
        <div class="product-img-box">
          <div class="upload-image"  style="">
            <input type="image" id="preview" src="${ loginUser.empProfile }"  style="width: 100%; height: 100%;" readonly>
          </div>
        </div>
        
        
        <div class="input-box-top">
        <form action="${ contextPath }/mypage/update.do" method="post" id="myinfo_form">
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">부서</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text"  id="deptCode" name="deptCode" value="${ loginUser.deptCode }" style="background-color: lightgray;" readonly>
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">직급</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" id="empRank" name="empRank" value="${ loginUser.empRank }" style="background-color: lightgray;" readonly>
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">성명</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" id="empName" name="empName" value="${ loginUser.empName }" style="background-color: lightgray;" readonly>
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">사번</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" id="empNo" name=empNo value="${ loginUser.empNo }" style="background-color: lightgray;" readonly>
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">휴대폰</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" id="empPhone" name="empPhone" value="${ loginUser.empPhone }">
              
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">이메일</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" id="empEmail" name="empEmail" value="${ loginUser.empEmail }">
            </div>
          </div>

           <!-- 주소 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">주소</span>
                </div>
                <div class="input-box-top-box-input">
                    <div class="addr-box">
                        <div class="addr-box-left">
                            <input type="text" id="sample6_postcode" value="${ loginUser.empPostcode }" style="margin-bottom: 3%;" name="empPostcode" readonly>
                        </div>
                        <div class="addr-box-right">
                            <button type="button" onclick="sample6_execDaumPostcode()">
                                <i class="bi bi-shop"></i>
                            </button>
                        </div>
                    </div>
                    <input type="text" id="sample6_address" value="${ loginUser.empAddress }"  style="margin-bottom: 3%;" name="empAddress" readonly>
                    <input type="text" id="sample6_detailAddress" value="${ loginUser.empDetailAddress }" style="margin-bottom: 3%;" name="empDetailAddress">
                </div>
            </div>
          
                <br>

                <div class="btn-box-hover" style="display: flex; justify-content: center;">
                    <button class="btn3-hover ffont3" style="width: 300px; height: 35px;">수정하기</button>
                    <a href="${ contextPath }">
                    <button type="button" class="btn3-hover ffont3" style="width: 300px; height: 35px;">홈으로</button> 
                    </a>
                </div>
                

            
		</form>
        </div>

        
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>