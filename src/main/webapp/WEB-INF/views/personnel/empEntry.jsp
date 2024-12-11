<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사원 등록</title>
    
    <!-- CSS 스타일 -->
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
        }

        .input-box-top-box-input {
            width: 70%;
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
    	// 이미지 업로드
    	function fnChangeImg(){
  			const changeImgUrl = document.getElementById('imageChUrlInput').value;
  		
  			document.getElementById('imageUrlInput').src=changeImgUrl;
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
    <!-- 헤더 및 사이드바 포함 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/side.jsp" />

   	<div class="body-body">
    <div class="product-add-top">
   	
    <!-- 이미지 영역 -->
    <div class="product-img-box">
        <div class="img-box" style="width:100%; height:100%;">
            <img id="imageUrlInput" src="https://i.ibb.co/25hzpPd/Component-5.png" style="width: 100%; height: 100%;">
        </div>
    </div>

    <!-- 폼 시작 -->
        <div class="input-box-top">
		    <form action="${contextPath}/personnel/insert" method="post">
            <!-- 성명 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">성명</span>
                </div>
                <div class="input-box-top-box-input">
                    <input type="text" name="empName">
                </div>
            </div>

            <!-- 이미지 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">이미지</span>
                </div>
                <div class="input-box-top-box-input" style="display: flex;">
                    <input type="text" name="empProfile" id="imageChUrlInput" value="" placeholder="사진경로를 입력해주세요">
                    <button class="btn4" type="button" onclick="fnChangeImg()">적용하기</button>
                </div>
            </div>

            <!-- 부서 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">부서</span>
                </div>
                <select class="input-box-top-box-input" id="dept_code" name="deptCode">
                    <option value="D001">본사</option>
                    <option value="D002">본사 인사부</option>
                    <option value="D003">본사 재정관리부</option>
                    <option value="D004">본사 영업부</option>
                    <option value="D005">본사 IT부</option>
                    <option value="D006">본사 지점</option>
                    <option value="D007">인사부 경영지원실</option>
                    <option value="D008">인사부 HR실</option>
                    <option value="D009">재정관리부 회계팀</option>
                    <option value="D010">재정관리부 재무팀</option>
                    <option value="D011">영업부 영업지원1팀</option>
                    <option value="D012">영업부 영업지원2팀</option>
                    <option value="D013">영업부 온라인 마케팅팀</option>
                    <option value="D014">IT부 개발팀</option>
                    <option value="D015">IT부 정보보안팀</option>
                    <option value="D016">지점 서울지점</option>
                    <option value="D017">지점 경기지점</option>
                    <option value="D018">지점 인천지점</option>
                </select>
            </div>

            <!-- 성별 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">성별</span>
                </div>
                <select class="input-box-top-box-input" id="gender" name="empGender">
                    <option value="M">남</option>
                    <option value="F">여</option>
                </select>
            </div>

            <!-- 휴대폰 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">휴대폰</span>
                </div>
                <div class="input-box-top-box-input">
                    <input type="text" name="empPhone">
                </div>
            </div>

            <!-- 이메일 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">이메일</span>
                </div>
                <div class="input-box-top-box-input">
                    <input type="email" name="empEmail">
                </div>
            </div>

            <!-- 생년월일 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">생년월일</span>
                </div>
                <div class="input-box-top-box-input">
                    <input type="text" name="empBirth" placeholder="YYYY-MM-DD">
                </div>
            </div>

            <!-- 은행명 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">은행명</span>
                </div>
                <div class="input-box-top-box-input">
                    <input type="text" name="acBank">
                </div>
            </div>

            <!-- 계좌번호 입력 -->
            <div class="input-box-top-box">
                <div class="input-box-top-box-text">
                    <span class="ffont3">계좌번호</span>
                </div>
                <div class="input-box-top-box-input">
                    <input type="text" name="acNo">
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
                            <input type="text" id="sample6_postcode" placeholder="우편번호" style="margin-bottom: 3%;" name="empPostcode" readonly>
                        </div>
                        <div class="addr-box-right">
                            <button type="button" onclick="sample6_execDaumPostcode()">
                                <i class="bi bi-shop"></i>
                            </button>
                        </div>
                    </div>
                    <input type="text" id="sample6_address" placeholder="주소" style="margin-bottom: 3%;" name="empAddress" readonly>
                    <input type="text" id="sample6_detailAddress" placeholder="상세주소" style="margin-bottom: 3%;" name="empDetailAddress">
                </div>
            </div>

            <!-- 버튼 -->
            <div class="btn-box-hover" style="display: flex; justify-content: center;  margin-left: 200px;">
                <button type="submit" class="btn3-hover ffont3" style="width: 373px; height: 35px; :">등록하기</button>
                <a href="${ contextPath }">
                <button type="button" class="btn3-hover ffont3" style="width: 373px; height: 35px;">홈으로</button>
                </a>
            </div>
            
   		 </form>
        </div>
    </div>
</div>

           
	   

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
