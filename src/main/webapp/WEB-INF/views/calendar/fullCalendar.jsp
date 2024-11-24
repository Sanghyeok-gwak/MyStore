<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캘린더 페이지</title>
    <!-- jQuery 및 FullCalendar CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
    
    <style>
        /* 레이아웃 및 스타일 */
        .body-body {
            display: flex;
        }
        .div {
            width: 20%;
            background-color: #ffffff;
            padding: 20px;
            border-right: 1px solid #ddd;
        }
        .div h3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .div .menu-item {
            margin-bottom: 15px;
        }
        .div label {
            font-size: 16px;
            display: flex;
            align-items: center;
        }
        .div input[type="checkbox"] {
            margin-right: 10px;
        }
        #calendar-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #ffffff;
        }
        #calendar {
            width: 100%; /* 초기 너비 */
            height: 90%; /* 초기 높이 */
            border: 1px solid #ddd;
            background-color: #fafafa;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>

<!-- 로그인 사용자 정보 -->
<script>
    var loginUser = {
        empNo: "${loginUser.empNo}",
        empName: "${loginUser.empName}"
    };
</script>

<div class="body-body">
    <!-- 좌측 메뉴 -->
    <div class="div">
        <h3>내 캘린더</h3>
        <div class="menu-item">
            <label>
                <input type="checkbox" checked> ${loginUser.empName}
            </label>
        </div>
        <div class="menu-item">
            <label>
                <input type="checkbox" id="allSchedulesCheckbox" checked> 전사일정
            </label>
        </div>
        <div class="menu-item">
            <label>
                <input type="checkbox" id="hrAdminCheckbox"> 인사 관리자
            </label>
        </div>
    </div>

    <!-- 캘린더 영역 -->
    <div id="calendar-container">
        <div id="calendar"></div>
    </div>
</div>

<script>
    var loginUser = {
        empNo: "${loginUser.empNo}",
        empName: "${loginUser.empName}"
    };

    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            },
            initialView: 'dayGridMonth',
            selectable: true,
            editable: true,
            events: function(fetchInfo, successCallback, failureCallback) {
                $.ajax({
                    url: `${contextPath}/calendar/selectEvents.do`,
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        successCallback(response);
                    },
                    error: function(err) {
                        console.error('이벤트 로드 실패:', err);
                        failureCallback(err);
                    }
                });
            },
            dateClick: function(info) {
                let title = prompt('새로운 이벤트 제목을 입력하세요:');
                if (title) {
                    $.ajax({
                        url: `${contextPath}/calendar/addEvent.do`,
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            empNo: loginUser.empNo,
                            calSubject: title,
                            calStartDate: info.dateStr,
                            calEndDate: info.dateStr,
                            calColor: 'B'
                        }),
                        success: function(res) {
                            alert(res);
                        },
                        error: function(err) {
                            console.error('이벤트 추가 실패:', err);
                        }
                    });
                }
            },
            eventClick: function(info) {
                let action = prompt(`"${info.event.title}" 이벤트 작업 선택\n1: 수정\n2: 삭제`);
                if (action === '1') {
                    let newTitle = prompt('새로운 제목을 입력하세요:', info.event.title);
                    if (newTitle) {
                        $.ajax({
                            url: `${contextPath}/calendar/updateEvent.do`,
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({
                                calNo: info.event.id,
                                calSubject: newTitle,
                                calStartDate: info.event.start.toISOString(),
                                calEndDate: info.event.end ? info.event.end.toISOString() : null
                            }),
                            success: function(res) {
                                alert(res);
                                info.event.setProp('title', newTitle);
                            },
                            error: function(err) {
                                console.error('이벤트 수정 실패:', err);
                            }
                        });
                    }
                } else if (action === '2') {
                    if (confirm('이 이벤트를 삭제하시겠습니까?')) {
                        $.ajax({
                            url: `${contextPath}/calendar/deleteEvent.do`,
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({ calNo: info.event.id }),
                            success: function(res) {
                                alert(res);
                                info.event.remove();
                            },
                            error: function(err) {
                                console.error('이벤트 삭제 실패:', err);
                            }
                        });
                    }
                }
            }
        });

        calendar.render();
    });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
