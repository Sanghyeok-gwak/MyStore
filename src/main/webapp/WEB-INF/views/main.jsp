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
	<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
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
        padding: 20px;
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
      .info_top{
        display: flex;
        justify-content: space-between;
        height: 40%;
      }
      .emp_img{
        display: flex;
        width: 50%;
        margin-right: 25px;
      }
      .top_empInfo{
	    width: 50%;
	    color: white;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-evenly;
	    align-items: center;
	    background: rgb(252, 168, 168);
	    border-radius: 5px;
      }
      .info_img{
        width: 100%;
        border-radius: 5px;
      }
      .info_body_width{
        padding: 0 20%;
      }
      .info_body{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 5% 0;
      }
      .emp_time{
        display: flex;
	    flex-direction: column;
	    justify-content: center;
        margin: 5% 0 10% 0;
      }
      .date_time{
        font-size: x-large;
      }
      #calendar {
        width: 100%; /* 초기 너비 */
        height: 100%; /* 초기 높이 */
        border: 1px solid #ddd;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
      .emp_dept{
      	font-weight: bold;
    	font-size: larger;
      }
      .emp_name{
      	margin-bottom: -19px;
      }
      #btn_info{
      	width: 100%;
	    display: flex;
	    justify-content: center;
      }
		.fc-day-sun a {
		    color: red;
		}
		.fc-day-sat a {
		    color: blue;
		}
		.fc-day-mon a {
		    color: black;
		}
		.fc-day-tue a{
		    color: black;
		}
		.fc-day-wed a {
		    color: black;
		}
		.fc-day-thu a {
		    color: black;
		}
		.fc-day-fri a {
		    color: black;
		}
		.main-home-top-calender {
        display: flex;
        flex-direction: column;
        height: 100%; 
   		}
   		
		#calendar {
        width: 100%; 
        height: 100%;
        border: 1px solid #ddd;
   		}
   		
   		.edocInpo{
        display: flex;
        font-size: larger;
        font-weight: 700;
      }
      .edoc_btn_top{
        height: 30%;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: center;
        border: 1px solid #8d8d8d;
        border-radius: 10px;
        box-shadow: 5px 3px 12px -5px gray;
      }
      .edoc_btn_top_font{
        font-size: larger;
        font-weight: 500;
      }
      .edoc_btn_top_btn{
        width: 58%;
        display: flex;
        justify-content: center;
      }
      .edoc_btn_top_btn button{
        width: 80%;
        justify-content: center;
      }
      .edoc_btn_controll{
        display: flex;
        height: 100%;
        padding: 0% 20%;
        flex-direction: column;
        justify-content: space-evenly;
      }
		

    </style>
	
    <div class="body-body">
      <div class="main-home">
        <div class="main-home-top">
          <div class="main-home-top-mypage" style="margin-right: 20px;">
            
            <div class="info_top">
              <div class="emp_img">
				<img src="<c:out value='${ loginUser.empProfile }' default='${ contextPath }/resources/images/defaultImg.png' />" class="info_img">
              </div>
              <div class="top_empInfo">
                <div class="emp_dept">${ loginUser.deptCode }</div>
                <div class="emp_name"><b>${ loginUser.empName }</b></div>
                <div class="emp_name"><b>${ loginUser.empRank }</b></div>
                <div class="emp_phone">${ loginUser.empPhone }</div>
              </div>
            </div>            
            
            <div class="info_body_width">
              <div class="info_body">
                <div class="date_time">00:00:00</div>
              </div>
              <div class="emp_time">

                <div>출근시간:&nbsp&nbsp
                	<c:choose>
                		<c:when test="${ empty loginUser.getWorkStartTime() }">
                			<span></span>
                		</c:when>
                		<c:otherwise>
                			<span>${ loginUser.getWorkStartTime() }</span>
                		</c:otherwise>
                	</c:choose>
                	
               	</div>
               	
                <div>퇴근시간:&nbsp&nbsp
                	<c:choose>
                		<c:when test="${ empty loginUser.getWorkEndTime() }">
                			<span></span>
                		</c:when>
                		<c:otherwise>
                			<span>${ loginUser.getWorkEndTime() }</span>
                		</c:otherwise>
                	</c:choose>
                </div>

              </div>
              	<c:choose>
              		<c:when test="${ empty loginUser.getWorkStartTime() }">
		                <button type="button" id="btn_info" class="btn btn-outline-primary" onclick="workColockIn()">출근하기</button>
              		</c:when>
              		<c:when test="${not empty loginUser.workStartTime && empty loginUser.workEndTime}">
			                <button type="button" id="btn_info" class="btn btn-outline-danger" onclick="workColockOut()">퇴근하기</button>
              		</c:when>
              		<c:otherwise>
		                <button disabled type="button" id="btn_info" class="btn btn-outline-primary" onclick="workCheck()">업무종료</button>
              		</c:otherwise>
              	</c:choose>
            </div>
          </div>
          
          <script>
            const contextPath = '${contextPath}';
            const empNo = '${loginUser.empNo}';
            const workStartTime = '${loginUser.workStartTime}';
            const workEndTime = '${loginUser.workEndTime}';
          	
          	function workColockIn(){
	          		$.ajax({
	          			url: '${contextPath}/work/clockIn',
	          			type: 'get',
	          			data: {
							empNo: empNo,
			                workStartTime: workStartTime,
			                workEndTime: workEndTime
	          			},
	          			success: function(resData){
	          				console.log("정상")
	          				console.log(resData)
	          				
	          				if(resData > 0){
		          				alert("출근처리가 완료되었습니다!");
		          	            location.reload();
	          				} else{
	          					alert("오류 발생! Error Code : cyc1");
	          				}
	          			},
	          			error: function(){
							console.log('근태 버튼에 대한 ajax 통신 실패')
						}
	          		})
          	}
          	
          	function workColockOut(){
         		if (confirm("퇴근하시겠습니까?")) {
	          		$.ajax({
	          			url: '${contextPath}/work/clockOut',
	          			type: 'get',
	          			data: {
							empNo: empNo,
			                workStartTime: workStartTime,
			                workEndTime: workEndTime
	          			},
	          			success: function(resData){
	          				console.log("정상")
	          				console.log(resData)
	          				
	          				if(resData > 0){
		          				alert("퇴근 처리가 완료되었습니다!");
		          	            location.reload();
	          				}else{
	          					alert("오류 발생! Error Code : cyc1");
	          				}
	          			},
	          			error: function(){
							console.log('근태 버튼에 대한 ajax 통신 실패')
						}
	          		})
          		}
          	}
		  </script>
          
          <script>
		        const clock = document.querySelector(".date_time");
		
		        function getClock() {
		            const date = new Date();
		            const hours = String(date.getHours()).padStart(2, "0");
		            const minutes = String(date.getMinutes()).padStart(2, "0");
		            const seconds = String(date.getSeconds()).padStart(2, "0");
		
		            // 시간 갱신
		            clock.innerText = hours + ":" + minutes + ":" + seconds;
		        }
		
		        getClock();
		        setInterval(getClock, 1000);
		    	</script>
		    	
          <div class="main-home-top-edsm" style="margin-right: 20px;">
            <div class="edocInpo">
                <div>📜</div>
                <div>전자결재</div>
            </div>

            <div class="edoc_btn_controll">
              <div class="edoc_btn_top">
                <div class="edoc_btn_top_font">결재 대기 문서 ${count1}개</div>
                <div class="edoc_btn_top_btn"><a type="button" class="btn btn-outline-primary" href="${contextPath}/edoc/aprvlwaitList.do">이동하기</a></div>
              </div>
              
              <div class="edoc_btn_top">
                <div class="edoc_btn_top_font">기안 진행 문서 ${count2}개</div>
                <div class="edoc_btn_top_btn"><a type="button" class="btn btn-outline-primary" href="${contextPath}/edoc/draftprogressList.do">이동하기</a></div>
              </div>
            </div>

          </div>
          
           <!-- 캘린더 시작 -->
          <div class="main-home-top-calender">
          	
          	<!-- 캘린더 부분 -->
           	<div id="calendar" ></div>
          
          <script>
          document.addEventListener('DOMContentLoaded', function () {
        	    var calendarEl = document.getElementById('calendar');

        	    var calendar = new FullCalendar.Calendar(calendarEl, {
        	        headerToolbar: {
        	            left: '',
        	            center: 'title',
        	            right: '' 
        	        },
        	        locale: 'ko', 
        	        initialView: 'dayGridMonth', 
        	        height: '100%',
        	    });

        	    calendar.render();
        	});

          </script>
          <!-- 캘린더 끝 -->
          
          
          	
          </div>
          
          
        </div>
        <div class="main-home-bottom">
          <div class="main-home-bottom-weather" style="margin-right: 20px;">
						<br><br>
							
							
						<form action="${contextPath}/weather/coord" method="get">
						    <input type="hidden" name="lat" value="37.4765509">
						    <input type="hidden" name="lon" value="126.8801713">
						    <div>날씨는 1시간 마다 업데이트</div>
						    <div class="btn-box-hover">
						        <button style="overflow-z: auto;"class="btn3-hover" type="submit">날씨 확인</button>
						    </div>
						</form>
						<div id="weatherInfo"></div>
				    
          </div>
          
          <script>
		          var weatherObject = ${weatherData};
		          
		          console.log(weatherObject)
		
		          // 필요한 데이터만 추출
		          var coord1 = weatherObject.coord.lat; // 좌표
		          var coord2 = weatherObject.coord.lon; // 좌표
		          var temperature = weatherObject.main.temp; // 기온
		          var temp_max = weatherObject.main.temp_max; // 최고기온
		          var temp_min = weatherObject.main.temp_min; // 최저기온
		          var weatherDescription = weatherObject.weather[0].description; // 날씨 설명
		          var humidity = weatherObject.main.humidity; // 습도
		          var windSpeed = weatherObject.wind.speed; // 바람 속도
		          var cityName = weatherObject.name; // 도시 이름
		
		          // 원하는 데이터를 화면에 출력
		          document.getElementById("weatherInfo").innerHTML = 
		              "위치: " + cityName + "<br>" +
		              "좌표: " + coord1 + ", " + coord2 + "<br>" + 
		              "기온: " + temperature + "°C<br>" +
		              "최고: " + temp_max + "°C<br>" +
		              "최저: " + temp_min + "°C<br>" +
		              "날씨: " + weatherDescription + "<br>" +
		              "습도: " + humidity + "%<br>" +
		              "바람: " + windSpeed + " m/s";
          </script>
          
          <div class="main-home-bottom-message" style="margin-right: 20px;">
							공간#
          </div>
          <div class="main-home-bottom-board">
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
        </div>
      </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>
</html>