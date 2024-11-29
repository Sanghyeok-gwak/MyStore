<%@page import="org.springframework.http.server.reactive.ContextPathCompositeHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

		<!-- Vendor CSS Files -->
   <link href="${contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">
 	
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 	
   <!-- Template Main CSS File -->
   <link href="${contextPath}/assets/css/style.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
      @import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Noto+Sans+KR:wght@100..900&display=swap");

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      .my_body {
        display: flex;
        height: calc(100vh);
      }
      .body_left {
        width: 65%;
        height: 100%;
        background-color: rgba(153, 161, 239, 1);
        display: flex;
        flex-direction: column;
      }
      .body_right {
        flex: 1;
        background-color: rgb(255, 255, 255);
        box-shadow: -20px 0px 8px 20px #ffffff;
        z-index: 1;
        height: 100%;
        width: 100%;
        display: flex;
        align-items: center;
      }
      .body_right1 {
        width: 100%;
        display: flex;
        justify-content: center;
      }
      .body_right_list {
        width: 546px;
        padding-right: 20px;
      }
      .login_logo {
        height: 100%;
        width: 100%;
        display: flex;
        align-items: center;
      }
      .img_controller {
        display: flex;
        justify-content: center;
      }
      .login_logo img {
        width: 45%;
        height: 11%;
      }
      .right_login {
        font-size: 40px;
        margin-bottom: 40px;
      }
      .right_id {
        display: flex;
        border: 1px solid rgb(153, 161, 239, 1);
        border-radius: 3px;
        margin-top: 10px;
        padding: 0px 0px 0px 24px;
        align-items: center;
        color: gray;
      }
      .input-bar1 {
        border: none;
        outline: none;
        box-shadow: none;
        margin-left: 62px;
        height: 40px;
        width: 400px;
      }
      #right_pwd {
        border: none;
        outline: none;
        box-shadow: none;
        margin-left: 30px;
        height: 40px;
      }
      .password_recovery {
        margin-top: 10px;
        font-weight: 500;
      }
      .password_recovery > a {
        color: #000000;
        text-decoration: none;
      }
      .btn-primary {
        margin-top: 30px;
        height: 50px;
        --bs-btn-color: #fff;
        --bs-btn-bg: rgb(153, 161, 239, 1);
        --bs-btn-border-color: #ffffff;
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: rgb(121, 128, 189);
        --bs-btn-hover-border-color: rgb(121, 128, 189);
        --bs-btn-focus-shadow-rgb: 49, 132, 253;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: rgb(121, 128, 189);
        --bs-btn-active-border-color: rgb(121, 128, 189);
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #0d6efd;
        --bs-btn-disabled-border-color: #0d6efd;
      }
      .save_id {
        margin-top: 10px;
      }
    </style>
		
	<script>
		if('${alertMsg}' != ''){
			alert('${alertMsg}');
			if('${historyBackYN}' == 'Y'){
				history.back();
			}
		}
	</script>
	
</head>
<body>
    <div class="my_body">
      <!-- 왼쪽 백그라운드 및 로고 -->
      <div class="body_left">
        <div class="login_logo">
          <div class="img_controller">
            <img src="${ contextPath }/resources/images/login_Logo.png" alt="" />
          </div>
        </div>
      </div>

      <div class="body_right">
        <div class="body_right1">
          <div class="body_right_list">
            <div class="right_login">LOGIN</div>
            
            <form action="${ contextPath }/login/signin.do" method="post" id="loginForm">
		            <div class="right_id">
		              계정
		              <div class="input-bar">
		                <input id="userId" type="number" class="input-bar1" name="empNo" placeholder="사번을 입력해주세요" value="${empNo}" required/>
		              </div>
		            </div>
		            <div class="right_id">
		              비밀번호
		              <div class="input-bar">
		                <input type="password" class="input-bar1" name="empPwd" id="right_pwd" placeholder="비밀번호 입력해주세요" required/>
		              </div>
		            </div>
		
		            <div class="save_id">
		              <input class="form-check-input" name="remember-empNo" type="checkbox" id="idSaveCheck" />
		              아이디 저장
		            </div>
		
		            <div class="login_btn">
		              <div class="d-grid gap-2 mt-3">
		                <button class="btn btn-primary" type="submit">로그인</button>
		              </div>
		            </div>
            </form>

            <div class="password_recovery">
              <a href="${ contextPath }/login/pwdRecovery.do">비밀번호 찾기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    

    <script>
    $(document).ready(function(){
        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var userInputId = getCookie("userInputId");
        $("input[name='empNo']").val(userInputId); 
         
        if($("input[name='empNo']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
            $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }
         
        $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
            if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                var userInputId = $("input[name='empNo']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
            }
        });
         
        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[name='empNo']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
            if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                var userInputId = $("input[name='empNo']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }
        });
    });
    
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
	</script>
		
    
</body>
</html>



























