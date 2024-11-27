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
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
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
    
    <c:if test="${loginUser.empNo != '1005'}">
        <div class="menu-item">
            <label>
                <input type="checkbox" id="personalSchedulesCheckbox" onclick="reloadCalendar()" checked>  ${loginUser.empName} 일정 
            </label>
        </div>
    </c:if>
        
        <div class="menu-item">
            <label>
                <input type="checkbox" id="allSchedulesCheckbox"  onclick="reloadCalendar()"> 전사 일정
            </label>
        </div>
    
   </div>

    <!-- 캘린더 영역 -->
    <div id="calendar-container">
        <div id="calendar"></div>
    </div>
</div>

<script>

let calendar; // 전역 변수로 캘린더 객체 선언



document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    // FullCalendar 초기화
    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth',
        selectable: true,
        editable: true,
        events: function(fetchInfo, successCallback, failureCallback) {
            let filters = {
                personal: $('#personalSchedulesCheckbox').is(':checked'),
                all: $('#allSchedulesCheckbox').is(':checked')
            };


            $.ajax({
                url: `${contextPath}/calendar/selectEvents.do`,
                type: 'GET',
                data: filters, // 필터 조건 전송
                dataType: 'json',
                success: function(response) { 
                    successCallback(response.map(event => ({
                        ...event,
                        backgroundColor: event.color === 'B' ? 'SteelBlue' : 'SeaGreen',
                    })));
                },
                error: function(err) {
                    console.error('이벤트 조회 실패:', err);
                    failureCallback(err);
                }
            });
        },
        dateClick: function(info) {
            let title = prompt('새로운 이벤트 제목을 입력하세요:');
            if (title) {
                let color = (loginUser.empNo === '1005') ? 'R' : 'B';

                $.ajax({
                    url: `${contextPath}/calendar/addEvent.do`,
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        empNo: loginUser.empNo,
                        calSubject: title,
                        calStartDate: info.dateStr,
                        calEndDate: info.dateStr,
                        calContent: '',
                        calColor: color,
                        calStatus: 'N' // 기본 상태
                    }),
                    success: function(res) {
                        alert('성공적으로 등록되었습니다.');
                        calendar.refetchEvents();
                    },
                    error: function(err) {
                        console.error('이벤트 추가 실패:', err);
                    }
                });
            }
        },
        eventClick: function(info) {
            let action = prompt(`"${info.event.title}" 이벤트 작업 선택(숫자로 입력해주세요)\n1: 수정\n2: 삭제`);
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
                            calEndDate: info.event.end ? info.event.end.toISOString() : null,
                            modifier: loginUser.empNo
                        }),
                        success: function(res) {
                            alert('성공적으로 수정 되었습니다.');
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
                            alert('성공적으로 삭제되었습니다.');
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

    // 캘린더 렌더링
    calendar.render();
});

// reloadCalendar 함수 정의
function reloadCalendar() {
    let filters = {
        personal: $('#personalSchedulesCheckbox').is(':checked'),
        all: $('#allSchedulesCheckbox').is(':checked')
    };

    console.log('필터 상태:', filters);

    // 전역 변수 calendar를 사용하여 이벤트 다시 로드
    if (calendar) {
        calendar.refetchEvents();
    } else {
        console.error('캘린더 인스턴스가 초기화되지 않았습니다.');
    }
}
//일정 유형별 필터링
$('.schedule-type-filter').on('change', function() {
    $('#calendar').fullCalendar('rerenderEvents');
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
