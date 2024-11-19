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
            margin-right: 3%;d
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
    <!-- 다음 주소 API 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        // 파일 업로드 미리보기
        function handleFileUpload(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('preview').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        }

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
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      <div class="product-add-top">
        <div class="product-img-box">
          <div class="upload-image" onclick="document.getElementById('fileInput').click()" style="cursor: pointer;">
            <input type="image" id="preview" src="${e.empProfile}" alt="Click to upload" style="width: 100%; height: 100%;">
            
          </div>
          <input type="file" id="fileInput" accept="image/*" style="display: none;" onchange="handleFileUpload(event)">
           
        </div>
        
        <div class="input-box-top">
        
        <form action="${contextPath}/personnel/updateEmp" method="post">
        	
           <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">성명</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.empName}" name="empName">
            </div>
          </div>	
        
           <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">직급</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text"  value="${ e.empRank }" name="empRank">
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">사번</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.empNo}" disabled name="empNo">
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">휴대폰</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.empPhone}" name="empPhone" >
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">이메일</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.empEmail}" name="empEmail">
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">생년월일</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.empBirth}" name="empBirth">
            </div>
          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">은행명</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.acBank}" name="acBank">
            </div>
          </div>
          
          <!-- 계좌번호 입력 -->
           <div class="input-box-top-box">
            <div class="input-box-top-box-text">
               <span class="ffont3">계좌번호</span>
            </div>
           <div class="input-box-top-box-input">
               <input type="text"  value="${e.acNo}" name="acNo">
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
                                <input type="text" id="sample6_postcode" value="${e.empPostcode}" name="empPostcode" style=" margin-bottom: 3%;" disabled>
                            </div>
                            <div class="addr-box-right">
                                <button onclick="sample6_execDaumPostcode()"><i class="bi bi-shop"></i></button>
                            </div>
                        </div>
                        <input type="text" id="sample6_address" style="margin-bottom: 3%;" value="${e.empAddress}" name="empAddress" disabled>
                        <input type="text" id="sample6_detailAddress" style="margin-bottom: 3%;" value="${e.empDetailAddress}" name="empDetailAddress">
                    </div>
                </div>
          

                <br>
			
			 <div class="input-box-top-box">
                <div class="btn-box-hover" style="display: block; justify-content: center; margin-left: 200px; ">
                    <button type="submit" class="btn3-hover ffont3" style="width: 300px; height: 35px; ">수정하기</button> 
                    <button class="btn3-hover ffont3" style="width: 300px; height: 35px;">홈으로</button> 
                </div>
            </div>    	
            </form>

            </div>
            
        </div>



      </div>
      
      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>