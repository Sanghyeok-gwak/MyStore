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
            boarder-radius: 5px;
        }	
     	
     	.input-box-top input {
     		padding-left: 10px;
     	}
</style>
    <!-- 다음 주소 API 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
		 // 이미지 업로드
			function fnChangeImg(){
					const changeImgUrl = document.getElementById('imageChUrlInput').value;
				
					document.getElementById('imageUrlInput').src=changeImgUrl;
					console.log(document.getElementById('imageUrlInput').value);
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
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      <div class="product-add-top">
      
        <div class="product-img-box">
          <!-- 이미지 영역 -->
		   <div class="img-box" style="width:100%; height:100%;">
		      <img id="imageUrlInput" src="${ e.empProfile }" style="width: 100%; height: 100%;">
		   </div>
		</div>
        
        <div class="input-box-top">
        <form action="${contextPath}/personnel/updateEmp" method="post">
        
        	<div class="input-box-top-box" hidden>
            <div class="input-box-top-box-text">
              <span class="ffont3">사번</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.empNo}" name="empNo" >
            </div>
          </div>	
        	
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
	          <select class="input-box-top-box-input" id="empRank" name="empRank" value="${e.empRank}">
				    <option value="RK001" ${e.empRank == '서버관리자' ? 'selected' : ''}>서버관리자</option>
				    <option value="RK002" ${e.empRank == '대표' ? 'selected' : ''}>대표</option>
				    <option value="RK003" ${e.empRank == '이사' ? 'selected' : ''}>임원 (이사)</option>
				    <option value="RK004" ${e.empRank == '사원' ? 'selected' : ''}>사원</option>
				    <option value="RK005" ${e.empRank == '과장' ? 'selected' : ''}>과장</option>
				    <option value="RK006" ${e.empRank == '대리' ? 'selected' : ''}>대리</option>
				    <option value="RK007" ${e.empRank == '주임' ? 'selected' : ''}>주임</option>
			 </select>


          </div>
          
          <div class="input-box-top-box">
            <div class="input-box-top-box-text">
              <span class="ffont3">사번</span>
            </div>
            <div class="input-box-top-box-input">
              <input type="text" value="${e.empNo}" disabled name="empNo">
            </div>
          </div>
          
          <!-- 이미지 입력 -->
			<div class="input-box-top-box">
			    <div class="input-box-top-box-text">
			        <span class="ffont3">이미지</span>
			    </div>
			    <div class="input-box-top-box-input" style="display: flex;">
			        <input type="text" name="empProfile" id="imageChUrlInput" value="${e.empProfile != null ? e.empProfile : ''}" placeholder="사진경로를 입력해주세요">
			        <button class="btn4" type="button" onclick="fnChangeImg()">적용하기</button>
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
                            <input type="text" id="sample6_postcode" value="${e.empPostcode}" style="margin-bottom: 3%;" name="empPostcode" readonly>
                        </div>
                        <div class="addr-box-right">
                            <button type="button" onclick="sample6_execDaumPostcode()">
                                <i class="bi bi-shop"></i>
                            </button>
                        </div>
                    </div>
                    <input type="text" id="sample6_address" value="${e.empAddress}"  style="margin-bottom: 3%;" name="empAddress" readonly>
                    <input type="text" id="sample6_detailAddress" value="${e.empDetailAddress}" style="margin-bottom: 3%;" name="empDetailAddress">
                </div>
            </div>
          
                <div class="btn-box-hover" style="display: flex; justify-content: center; margin-left: 200px; gap: 20px;">
                    <!-- '수정하기' 버튼 -->
                    <button type="submit" class="btn3-hover ffont3" style="width: 300px; height: 35px;">수정하기</button>
            </form>
            
				<form action="${contextPath}/personnel/quit.do" method="post" id="confirmQuit">
				    <div class="input-box-top-box" hidden>
				        <div class="input-box-top-box-input">
				            <input type="text" value="${e.empNo}" name="empNo" >
				        </div>
				    </div>  
				
				    <!-- '퇴사' 버튼 -->
				    <button type="button" class="btn3-hover ffont3" style="background-color: red; width: 300px; height: 35px;" onclick="confirmQuit()">
				        퇴사
				    </button>
				</form>
				
				<script>
				function confirmQuit() {
				    // confirm 다이얼로그 띄우기
				    if (confirm("정말 퇴사처리를 진행 하시겠습니까?")) {
				        // 사용자가 확인을 누르면 폼 제출
				        document.getElementById("confirmQuit").submit();  // form ID를 'confirmQuit'로 수정
				    } else {
				        // 사용자가 취소를 누르면 콘솔에 메시지 출력
				        console.log("취소되었습니다.");
				    }
				}
				</script>

      
      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>