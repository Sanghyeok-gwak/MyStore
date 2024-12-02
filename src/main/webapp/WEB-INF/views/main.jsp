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
    		.main-home-bottom-message-box-top {
				    display: flex ;
				    justify-content: space-between;
				}
        .main-home-top-mypage,
        .main-home-bottom-weather,
        .main-home-top-edsm,
        .main-home-bottom-message,
        .main-home-top-calender,
        .main-home-bottom-board {
            border-radius: 20px;
            background-color: white;
            padding: 20px;
        }

        .main-home,
        .main-home-top,
        .main-home-bottom {
            display: flex;
        }

        .main-home {
            flex-direction: column;
            height: 100%;
            width: 100%;
        }

        .main-home-top,
        .main-home-bottom {
            height: 50%;
        }

        .main-home-top {
            margin-bottom: 10px;
        }

        .main-home-bottom {
            margin-top: 10px;
        }

        .main-home-top-mypage,
        .main-home-bottom-weather {
            width: 25%;
        }

        .main-home-top-edsm,
        .main-home-bottom-message {
            width: 35%;
        }

        .main-home-top-calender,
        .main-home-bottom-board {
            width: 40%;
        }

        .info_top {
            display: flex;
            justify-content: space-between;
            height: 40%;
        }

        .emp_img {
            display: flex;
            width: 50%;
            margin-right: 25px;
        }

        .top_empInfoM {
            width: 50%;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            background: rgb(168 178 252);
            border-radius: 5px;
        }
        .top_empInfoF {
            width: 50%;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            background: rgb(255 124 124);
            border-radius: 5px;
        }

        .info_img {
            width: 100%;
            border-radius: 5px;
        }

        .info_body_width {
            padding: 0 20%;
        }

        .info_body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 5% 0;
        }

        .emp_time {
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin: 5% 0 10% 0;
        }

        .date_time {
            font-size: x-large;
        }

        #calendar {
            width: 100%;
            /* 초기 너비 */
            height: 100%;
            /* 초기 높이 */
            border: 1px solid #ddd;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .emp_dept {
            font-weight: bold;
            font-size: larger;
        }

        .emp_name {
            margin-bottom: -19px;
        }

        #btn_info {
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

        .fc-day-tue a {
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

        .edocInpo {
            display: flex;
            font-size: larger;
            font-weight: 700;
        }

        .edoc_btn_top {
            height: 30%;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            border: 1px solid #8d8d8d;
            border-radius: 10px;
            box-shadow: 5px 3px 12px -5px gray;
        }

        .edoc_btn_top_font {
            font-size: larger;
            font-weight: 500;
        }
        
        .edoc_btn_top2_font {
            font-size: larger;
            font-weight: 500;
        }

        .edoc_btn_top_btn {
            width: 58%;
            display: flex;
            justify-content: center;
        }

        .edoc_btn_top_btn button {
            width: 80%;
            justify-content: center;
        }

        .edoc_btn_controll {
            display: flex;
            height: 90%;
            padding: 0% 20%;
            flex-direction: column;
            justify-content: space-evenly;
        }

        #weather {
            color: white;
            background: linear-gradient(154deg, #99a1ef, #75cefa);
        }

        .weather-body {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 2% 0;
        }
		.weather-body-top{
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

        .location-icon {
            display: flex;
            font-size: 200%;
			display: flex;
			justify-content: space-between;
			align-items: center;
        }

        .bottom-info {
            display: flex;
            justify-content: space-around;
            font-size: 130%;
            font-weight: 500;
        }

        .bottom-item {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .bottom-icon {
            display: flex;
        }

        .weather-main {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 300%;
        }

        .main-temp {
            display: flex;
            margin: 0 2%;
        }

        #nowtime {
            font-size: 130%;
        }
        .weather-icon{
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 500%;
        }
        .main-home-bottom-message-box {
				    width: 100%;
				    height: 100%;
				    display: flex ;
				    flex-direction: column;
				}
				.main-home-bottom-message-box-body {
				    overflow-y: scroll;
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
                        <div class="${ loginUser.empGender == 'M' ? 'top_empInfoM' : 'top_empInfoF' }">
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

                    function workColockIn() {
                        $.ajax({
                            url: '${contextPath}/work/clockIn',
                            type: 'get',
                            data: {
                                empNo: empNo,
                                workStartTime: workStartTime,
                                workEndTime: workEndTime
                            },
                            success: function(resData) {
                                console.log("정상")
                                console.log(resData)

                                if (resData > 0) {
                                    alert("출근처리가 완료되었습니다!");
                                    location.reload();
                                } else {
                                    alert("오류 발생! Error Code : cyc1");
                                }
                            },
                            error: function() {
                                console.log('근태 버튼에 대한 ajax 통신 실패')
                            }
                        })
                    }

                    function workColockOut() {
                        if (confirm("퇴근하시겠습니까?")) {
                            $.ajax({
                                url: '${contextPath}/work/clockOut',
                                type: 'get',
                                data: {
                                    empNo: empNo,
                                    workStartTime: workStartTime,
                                    workEndTime: workEndTime
                                },
                                success: function(resData) {
                                    console.log("정상")
                                    console.log(resData)

                                    if (resData > 0) {
                                        alert("퇴근 처리가 완료되었습니다!");
                                        location.reload();
                                    } else {
                                        alert("오류 발생! Error Code : cyc1");
                                    }
                                },
                                error: function() {
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
                        <div style="font-size:30px; margin-right:10px;">📜</div>
                        <div style="font-size:30px">전자결재</div>
                    </div>

                    <div class="edoc_btn_controll">
                        <div class="edoc_btn_top">
                            <div class="edoc_btn_top_font"></div>
                            <div class="edoc_btn_top_btn"><a type="button" class="btn btn-outline-primary" href="${contextPath}/edoc/aprvlwaitList.do">이동하기</a></div>
                        </div>

                        <div class="edoc_btn_top">
                            <div class="edoc_btn_top2_font"></div>
                            <div class="edoc_btn_top_btn"><a type="button" class="btn btn-outline-primary" href="${contextPath}/edoc/draftprogressList.do">이동하기</a></div>
                        </div>
                    </div>

                </div>
                
                <script>
                	window.onload = edocCount();
										
                    function edocCount() {
                        $.ajax({
                            url: '${contextPath}/edoc/edocCount',
                            type: 'get',
                            data: {
                                empNo: empNo,
                            },
                            success: function(resData) {
                                console.log("정상")
                                console.log(resData)
                             		
                                const awlcount = resData.awlcount;
                                document.querySelector(".edoc_btn_top_font").textContent = '결재 대기 문서 ' + awlcount + '개';
                                
                                const dplcount = resData.dplcount;
                                document.querySelector(".edoc_btn_top2_font").textContent = '기안 진행 문서 ' + dplcount + '개';
                                                        
                            },
                            
                            error: function() {
                                console.log('결재 갯수에 대한 ajax 통신 실패')
                            }
                        })
                    }
                </script>

                <!-- 캘린더 시작 -->
                <div class="main-home-top-calender">

                    <!-- 캘린더 부분 -->
                    <div id="calendar"></div>

                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
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
                <div class="main-home-bottom-weather" id="weather" style="margin-right: 20px;">
                    <!-- 
											<br><br>
											    <div>날씨는 3시간 마다 업데이트</div>
													<div id="weatherInfo"></div>
													<div id="nowtime"></div>
					           -->
                    <div class="weather-body">
                        <div>
	                        <div class="location-icon">
								<div class="weather-body-top">
									<div id="city">위치</div>
									<div><i class="ri-map-pin-2-fill"></i></div>
								</div>
	                        </div>
	                        <div style="display: flex;justify-content: space-between;">
	                            <div id="nowtime"></div>                              
	                        </div>
                        </div>
                        
                        <div>
	                        <div class="weather-icon">
		                      	<div id="weatherInfo">아이콘</div>
	                        </div>
	                      	
	                        <div class="weather-main">
	                            <div><i class="bi bi-thermometer-half"></i></div>
	                            <div class="main-temp">
	                                <div id="temp">현재 기온</div>
	                                <i class="ri-celsius-line"></i>
	                            </div>
	                        </div>
                        </div>
                        
                        <div class="bottom-info">
                            <div class="bottom-item">
                                <div>최고 기온</div>
                                <div class="bottom-icon">
                                    <div id="temp_max">0</div>
                                </div>
                            </div>
                            <div class="bottom-item">
                                <div>최저 기온</div>
                                <div class="bottom-icon">
                                    <div id="temp_min">0</div>
                                    <i class="ri-celsius-line"></i>
                                </div>
                            </div>
                            <div class="bottom-item">
                                <div>습도</div>
                                <div class="bottom-icon">
                                    <div id="humidity">0</div>
                                    <div>%</div>
                                </div>
                            </div>
                            <div class="bottom-item">
                                <div>바람</div>
                                <div class="bottom-icon">
                                    <div id="wind">0</div>
                                    <div>m/s</div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <script>
                    window.onload = weather();

                    function weather() {
                        $.ajax({
                            url: '${contextPath}/weather/coord',
                            type: 'get',
                            dataType: 'json',
                            success: function(resData) {
                                console.log(resData);

                                var weatherObject = resData;

                                // 필요한 데이터 추출
                                var coord1 = weatherObject.coord.lat; // 좌표
                                var coord2 = weatherObject.coord.lon; // 좌표
                                var temperature = weatherObject.main.temp; // 기온
                                var temp_max = weatherObject.main.temp_max; // 최고기온
                                var temp_min = weatherObject.main.temp_min; // 최저기온
                                var weatherDescription = weatherObject.weather[0].id; // 날씨 설명
                                var humidity = weatherObject.main.humidity; // 습도
                                var windSpeed = weatherObject.wind.speed; // 바람 속도
                                var cityName = weatherObject.name; // 도시 이름=

                                // 날씨 데이터를 출력
                                document.getElementById("city").innerHTML = cityName;

                                document.getElementById("temp").innerHTML = temperature.toFixed(0);

                                document.getElementById("temp_max").innerHTML = temp_max.toFixed(1);

                                document.getElementById("temp_min").innerHTML = temp_min.toFixed(1);
								
								if (weatherDescription >= 200 && weatherDescription < 600) {
											document.getElementById("weatherInfo").innerHTML = '<i class="bi bi-cloud-rain"></i>';
							        console.log( "비");
							    } else if (weatherDescription >= 600 && weatherDescription < 700) {
							        console.log( "눈");
											document.getElementById("weatherInfo").innerHTML = '<i style="font-size: 228%;" class="bi bi-cloud-snow-fill"></i>';
							    } else if (weatherDescription >= 700 && weatherDescription < 800) {
							    		document.getElementById("weatherInfo").innerHTML = '<i class="bi bi-cloud-fog2"></i>';
							        console.log( "대기 상태");
							    } else if (weatherDescription >= 801 && weatherDescription < 900) {
							    		document.getElementById("weatherInfo").innerHTML = '<i class="bi bi-clouds"></i>';
							        console.log( "구름");
							    } else {
							    		document.getElementById("weatherInfo").innerHTML = '<i class="bi bi-sun"></i>';
							        console.log( "맑음");
							    }
																			
                                document.getElementById("humidity").innerHTML = humidity;

                                document.getElementById("wind").innerHTML = windSpeed;
                            },
                            error: function() {
                                console.log('날씨 데이터 ajax 통신 실패');
                            }
                        });
                    }

                    //오늘 날짜출력
                    $(document).ready(function() {

                        function convertTime() {
                            var now = new Date();

                            // 월과 일 가져오기
                            var month = now.getMonth() + 1;
                            var date = now.getDate();

                            // 요일 배열
                            var days = ['일', '월', '화', '수', '목', '금', '토'];
                            var dayOfWeek = days[now.getDay()];

                            // 날짜와 요일 반환
                            return month + ' ' + date + ', ' + dayOfWeek;
                        }

                        var currentTime = convertTime();
                        $('#nowtime').append(currentTime);
                    });
                </script>
                <!-- 
		           //날씨아이콘출력
			        //WeatherResult.weater[0].icon
			        var weathericonUrl =
			            '<img src= "http://openweathermap.org/img/wn/'
			            + WeatherResult.weather[0].icon +
			            '.png" alt="' + WeatherResult.weather[0].description + '"/>'
		
			        $('.SeoulIcon').html(weathericonUrl);
					 -->

                <div class="main-home-bottom-message" style="margin-right: 20px;">
                	<div class="main-home-bottom-message-box">
								      <div class="main-home-bottom-message-box-top">
								          <div style="font-size:30px">✉️&nbsp&nbsp쪽지함</div>
								          <div id="messageCount" style="font-size:30px;">안읽음 0 / 0</div>
								      </div>
								      <div class="main-home-bottom-message-box-body">
									      <table class="table table-hover">
									          <thead>
									              <tr>
									                  <th style="width:80px;">번호</th>
									                  <th style="width:100px;">보낸이</th>
									                  <th style="width:150px;">제목</th>
									                  <th style="width:150px;">시간</th>
									              </tr>
									          </thead>
									          <tbody id="messageTableBody">
									              <!-- AJAX로 데이터 추가 -->
									            </tbody>
									      </table>
								  	</div>
								  </div>
                	
                </div>
                <script>
                document.addEventListener("DOMContentLoaded", function () {
                    $.ajax({
                        url: '/mystore/note/mainreception.no',
                        type: 'GET',
                        dataType: 'json',
                        data: { empNo: empNo },
                        success: function (res) {
                        	
                        	const totalCount = res.readCount + res.noReadCount;
                            document.getElementById('messageCount').innerText = 
                                '안읽음 ' + res.noReadCount + ' / ' + res.readCount;
                            
                            const tbody = document.getElementById('messageTableBody');
                            tbody.innerHTML = ''; 
                            
                            if (res.list && res.list.length > 0) {
                                let tableContent = '';
                                res.list.forEach((item, index) => {
                                    tableContent += 
                                        '<tr onclick="sendReceptionNo(' + item.receptionNo + ', \'' + item.recCheck + '\')">' +
                                            '<td>' + (res.list.length - index) + '</td>' +
                                            '<td>' + item.sentId + '</td>' +
                                            '<td>' + item.title + '</td>' +
                                            '<td>' + item.sentDate + '</td>' +
                                        '</tr>';
                                });
                                tbody.innerHTML = tableContent;
                            } else {
                                tbody.innerHTML = '<tr><td colspan="4">받은 메시지가 없습니다.</td></tr>';
                            }
                        }
                    });
                });
		    	       	function sendReceptionNo(receptionNo, recCheck) {
		                console.log("receptionNo: " + receptionNo + ", recCheck: " + recCheck);
		                window.location.href = '${contextPath}/note/recepDetail.no?no=' + receptionNo + '&recCheck=' + recCheck;
		    	        }
                </script>
                <div class="main-home-bottom-board">
                         <div class="main-home-bottom-message-box">
			      <div class="main-home-bottom-message-box-top">
			          <div style="font-size:30px; margin-right:10px;">🚨&nbsp&nbsp중요 공지사항</div>
			         
			      </div>
			      <table class="table table-hover">
			          <thead style=" text-align: center; vertical-align: middle;">
			              <tr>
			                  <th style="width:80px;">구분</th>
			                  <th style="width:220px;">제목</th>
			                  <th style="width:90px;">작성자</th>
			                  <th style="width:90px;">작성일</th>
			              </tr>
			          </thead>
			          <tbody id="boardTableBody">
			              <!-- AJAX로 데이터 추가 -->
			            </tbody>
			      </table>
			  </div>      
                    
                </div>
                <script>
                $(document).ready(function() {
                    // 페이지 로딩 시 AJAX 요청을 통해 데이터를 가져옴
                    $.ajax({
                        url: '${contextPath}/board/mainlist.do',  // 데이터 요청 URL
                        type: 'GET',
                        dataType: 'json',
                        success: function(response) {
                            console.log(response);  // 서버 응답을 콘솔에 출력하여 확인
                            if (response.success) {
                                var tableBody = $('#boardTableBody');
                                if (Array.isArray(response.boardList)) {
                                    response.boardList.forEach(function(board) {
                          
                                        // 테이블 행 추가
var row = $('<tr onclick="location.href=\'${contextPath}/board/boardDetail.do?no=' + board.boardNo + '\'" style="text-align:center; vertical-align:middle; background-color: #e1e1e5">');
                                        row.append('<td style="background-color: #e1e1e5">' + board.boardDept + '</td>');  // 구분
                                        row.append('<td style="background-color: #e1e1e5">' + board.boardTitle + '</td>');  // 제목
                                        row.append('<td style="background-color: #e1e1e5">' + board.empName + '</td>');  // 작성자 (emp_name)
                                        row.append('<td	style="background-color: #e1e1e5">' + board.createDate + '</td>');  // 작성일
                                        tableBody.append(row);
                                    });
                                } else {
                                    console.error('boardList가 배열이 아닙니다');
                                }
                            } else {
                                alert(response.message || '게시물을 불러오는 데 실패했습니다.');
                            }
                        },
                        error: function() {
                            alert('AJAX 요청 실패');
                        }
                    });
                });


</script>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>