<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	
	<script type="text/javascript" src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

    <!-- <head> 안에 추가 -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- 2.10.0 버전엔 js 파일 일부분이 없어 오류 발생 ! -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	
	<style>
      .main-home-top-mypage,.main-home-bottom-weather,.main-home-top-edsm,.main-home-bottom-message,.main-home-top-calender,.main-home-bottom-board{
        border-radius: 20px;
        background-color: white;
        padding:30px;
      }
      .main-home,.main-home-top,.main-home-bottom{
        display: flex;
      }
      .main-home{
        flex-direction: column;
        height: 100%;
        width: 100%;
      }
      .main-home-top,.main-home-bottom{
        height: 50%;
      }
      .main-home-top{
        margin-bottom: 10px;
      }
      .main-home-bottom{
        margin-top: 10px;
      }
      .main-home-top-mypage,.main-home-bottom-weather{
        width: 25%;
      }
      .main-home-top-edsm,.main-home-bottom-message{
        width: 35%;
      }
      .main-home-top-calender,.main-home-bottom-board{
        width: 40%;
      }
    </style>
	
    <div class="body-body">
      <div class="main-home">
        <div class="main-home-top">
          <div class="main-home-top-mypage" style="margin-right: 20px;">
            
          </div>
          <div class="main-home-top-edsm" style="margin-right: 20px;">

          </div>
          <div class="main-home-top-calender">
          	<c:choose>
          		<c:when test="${ empty loginUser.getEmpNo() }">
          			세션정보 없음
          		</c:when>
          		
          		<c:otherwise>
          			현재 로그인 세션 정보
          			<br>
          			${ loginUser.toString() }
          		</c:otherwise>
          	</c:choose>
          </div>
        </div>
        <div class="main-home-bottom">
          <div class="main-home-bottom-weather" style="margin-right: 20px;">
				
          </div>
          <div class="main-home-bottom-message" style="margin-right: 20px;">

          </div>
          <div class="main-home-bottom-board">
				<form action="${contextPath}/weather/coord" method="get">
				    <input type="hidden" name="lat" value="37.4765509">
				    <input type="hidden" name="lon" value="126.8801713">
				    <div class="btn-box-hover">
				        <button style="overflow-z: auto;"class="btn3-hover" type="submit">날씨 확인</button>
				    </div>
				</form>
				<div>
				    <h1>Weather Data</h1>
				    <p>${weatherData}</p>
				</div>
          </div>
        </div>
      </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>