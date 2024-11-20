<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>  
	 	<!-- font -->
		
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Edu+AU+VIC+WA+NT+Pre:wght@400..700&family=Noto+Sans+KR:wght@100..900&display=swap');
		</style>


	<!-- Vendor CSS Files -->
   <link href="${contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
   <link href="${contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">
 
 	<!-- ajax 
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 	-->
 
   <!-- Template Main CSS File -->
   
   <link href="${contextPath}/assets/css/style.css" rel="stylesheet">
   <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body{
      font-family: "Noto Sans KR", serif;
    }
    .my-head{
      display: flex;
      height: 61px;
    }
    .head-text{
      display: flex;
      justify-content: end;
      width: 100%;
      height: 100%;
      background-color: white!important;
      z-index: 99;
      box-shadow: 30px -5px 15px #000000;
    }
    .head-icon{
      background-color: white!important;
      z-index: 99;
      box-shadow: 30px -5px 15px #000000;
    }
    .my-body{
      display: flex;
      height: calc(100vh - 61px);
    }
    .body-side {
      width: 250px;
      background-color: rgba(153, 161, 239, 1);
      display: flex;
      flex-direction: column;
      padding-top: 20px;
      box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    }

    .body-body {
      flex: 1;
      background-color: rgba(239, 237, 251, 1);
      padding-left: 50px;
      padding-right: 50px;
      padding-top: 40px;
      padding-bottom: 40px;
      z-index: 1;
    }

    .side-icon {
      display: flex;
      align-items: center;
      padding: 10px 40px;
      color: white;
      font-size: 15px;
      font-weight: 400;
      cursor: pointer;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    .side-icon:hover {
      background-color: rgba(123, 131, 211, 0.9); 
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .side-icon img {
      width: 35px;
      height: 35px;
      margin-right: 10px;
    }

    .submenu {
      display: flex;
      flex-direction: column;
      overflow: hidden;
      max-height: 0;
      transition: max-height 0.3s ease-in-out;
      margin-left: 50px;
      margin-top: 10px;
    }

    .submenu a {
      color: white;
      text-decoration: none;
      font-size: 16px;
      margin: 5px 0;
    }

    .submenu a:hover {
      text-decoration: underline;
    }
    /* body에들어가는 양식입니다. 원페이지 이신분들은 이거 사용하신됩니다. */
    .text-box{
      border-radius: 20px;
      height: 100%;
      width: 100%;
      background-color: white;
      padding:30px;
    }
  
    .head_right_logo{
      display: flex;
      align-items: center;
      justify-content: end;
      margin: 0px 3%;
    }

    .d-flex{
      justify-content: space-between;
    }
    .head_img{
        width: 23px;
        height: 23px;
        border-radius: 100%;
    }
    .header_right_list{
      display: flex;
      align-items: center;
      margin-right: 20px;
    }
    .header_right_list > a{
      text-decoration: none;
      text-decoration: none;
      color: inherit;
      font-weight: 500;
    }
    .header_right_list > i{
      font-size: 20px;
      margin-right: 5px;
    }
    .header-nav .nav-icon {
        font-size: 22px;
        color: #012970;
        margin-right: 5px;
        position: relative;
    }
    .bg-primary {
        --bs-bg-opacity: 1;
        background-color: rgb(255 72 72) !important;
    }
    .header-nav .badge-number {
        position: absolute;
		    inset: -5px -5px auto auto;
		    font-weight: normal;
		    font-size: 9px;
		    padding: 4px 6px;
    }
    .header-nav>ul {
		    margin: 0;
		    padding: 3px;
		}
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    .my-head{
      display: flex;
      height: 61px;
    }
    .head-text{
      width: 100%;
      height: 100%;
      background-color: white!important;
      z-index: 99;
      box-shadow: 30px -5px 15px #000000;
    }
    .head-icon{
      background-color: white!important;
      z-index: 99;
      box-shadow: 30px -5px 15px #000000;
    }
    .my-body{
      display: flex;
      height: calc(100vh - 61px);
    }
    .body-side {
      width: 250px;
      background-color: rgba(153, 161, 239, 1);
      display: flex;
      flex-direction: column;
      padding-top: 20px;
      box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    }

    .body-body {
      flex: 1;
      background-color: rgba(239, 237, 251, 1);
      padding-left: 50px;
      padding-right: 50px;
      padding-top: 40px;
      padding-bottom: 40px;
      z-index: 1;
    }

    .side-icon {
      display: flex;
      align-items: center;
      padding: 10px 40px;
      color: white;
      font-size: 15px;
      font-weight: 400;
      cursor: pointer;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    .side-icon:hover {
      background-color: rgba(123, 131, 211, 0.9); 
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .side-icon img {
      width: 35px;
      height: 35px;
      margin-right: 10px;
    }

    .submenu {
      display: flex;
      flex-direction: column;
      overflow: hidden;
      max-height: 0;
      transition: max-height 0.3s ease-in-out;
      margin-left: 50px;
      margin-top: 10px;
    }

    .submenu a {
      color: white;
      text-decoration: none;
      font-size: 16px;
      margin: 5px 0;
    }

    .submenu a:hover {
      text-decoration: underline;
    }
    /* body에들어가는 양식입니다. 원페이지 이신분들은 이거 사용하신됩니다. */
    .text-box{
      height: 100%;
      width: 100%;
      border-radius: 20px;
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
      height: 100px;
      margin-bottom: 10px;
    }
    .text-box2{
      border: 1px solid red;
      width: 100%;
      height: 100px;
      margin-bottom: 10px;
    }
    .text-box3{
      border: 1px solid red;
      width: 100%;
      height: 100px;
    }
    /* 일반 버튼 색상 알잘딱갈센으로 골라서 사용하시면됩니다 (*이것또한 넓이높이만 수정해서 사용하세요) */
    .btn-box button{
      margin-right: 10px;
      border-radius: 5px;
      width: 100px;
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
      
    }
    .btn4{
      border-radius: 5px;
      width: 100px;
      border: 0px;
      color: black;
      background-color: white;
      border: 1px solid lightgray;
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
  <div class="my-head">
  <div class="head-icon">
    <a href="${ contextPath }/"><img src="https://i.ibb.co/nCMNZqH/image.png" style="width: 131px; height: 90%; margin: 3px 0 0 20px;"></a>
  </div>
  <div class="head-text">
    <div class="head_right_logo">
      <div class="header_right_list"> 
      	<form action="${ contextPath }/login/signin.do" method="post" id="signup_form">
           	<button>1001 로그인</button>
           	<input type="hidden" class="input-bar1" name="empNo" placeholder="사번을 입력해주세요" value="1001"/>
           	<input type="hidden" class="input-bar1" name="empPwd" id="right_pwd" placeholder="비밀번호 입력해주세요" value="1234"/>
        </form>
        <form action="${ contextPath }/login/signin.do" method="post" id="signup_form">
           	<button>1002 로그인</button>
           	<input type="hidden" class="input-bar1" name="empNo" placeholder="사번을 입력해주세요" value="1002"/>
           	<input type="hidden" class="input-bar1" name="empPwd" id="right_pwd" placeholder="비밀번호 입력해주세요" value="1234"/>
        </form>  
          <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">

              <li class="nav-item dropdown">
              
                <a class="nav-link nav-icon" id="head_img_4" href="#" data-bs-toggle="dropdown">
                	<c:choose>
                		<c:when test="${ empty loginUser.empProfile }">
                			<img src="${ contextPath }/resources/images/defaultImg.png" class="head_img">
                		</c:when>
                		
                		<c:otherwise> 		
                			<img src="${ loginUser.empProfile }" class="head_img">
                		</c:otherwise>
                	</c:choose>
                  
                  <span class="badge bg-primary badge-number">4</span>
                </a><!-- End Notification Icon -->
      
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                  <li class="dropdown-header">
                    You have 4 new notifications
                    <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                  </li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
      
                  <li class="notification-item">
                    <i class="bi bi-exclamation-circle text-warning"></i>
                    <div>
                      <h4>Lorem Ipsum</h4>
                      <p>Quae dolorem earum veritatis oditseno</p>
                      <p>30 min. ago</p>
                    </div>
                  </li>
      
                  <li>
                    <hr class="dropdown-divider">
                  </li>
      
                  <li class="notification-item">
                    <i class="bi bi-x-circle text-danger"></i>
                    <div>
                      <h4>Atque rerum nesciunt</h4>
                      <p>Quae dolorem earum veritatis oditseno</p>
                      <p>1 hr. ago</p>
                    </div>
                  </li>
      
                  <li>
                    <hr class="dropdown-divider">
                  </li>
      
                  <li class="notification-item">
                    <i class="bi bi-check-circle text-success"></i>
                    <div>
                      <h4>Sit rerum fuga</h4>
                      <p>Quae dolorem earum veritatis oditseno</p>
                      <p>2 hrs. ago</p>
                    </div>
                  </li>
      
                  <li>
                    <hr class="dropdown-divider">
                  </li>
      
                  <li class="notification-item">
                    <i class="bi bi-info-circle text-primary"></i>
                    <div>
                      <h4>Dicta reprehenderit</h4>
                      <p>Quae dolorem earum veritatis oditseno</p>
                      <p>4 hrs. ago</p>
                    </div>
                  </li>
      
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li class="dropdown-footer">
                    <a href="#">Show all notifications</a>
                  </li>
      
                </ul><!-- End Notification Dropdown Items -->
      
              </li><!-- End Notification Nav -->
              </ul>
              </nav>
          <span>${ loginUser.empName }</span><span>님 환영합니다.</span>
      </div>

      <div class="header_right_list">
        <i class="bi bi-person-circle"></i>
        <a href="${ contextPath }/mypage/myInfo"><span>마이페이지</span></a>
      </div>
        
      <div class="icon header_right_list">
        <i class="bi bi-box-arrow-in-right"></i>
        <a href="${ contextPath }/login/logOut.do"><span>로그아웃</span></a>
      </div>

    </div>
  </div>
</div>
  