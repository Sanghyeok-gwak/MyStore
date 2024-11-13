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
    #calendar {
      max-width: 900px;
      margin: 0 auto;
    }

    /* 일요일 토요일 색상 */
    .sunday {
      background-color: #f8d7da;
      color: #dc3545;
    }

    .saturday {
      background-color: #d1ecf1;
      color: #17a2b8;
    }
</style>

</head>
<body>

	<div class="body-body">
	      <!-- 여기 채워서 작업하시면 됩니다 .-->
	    <div class="text-box">
	     	<div id='calendar'></div>
		</div>
	</div>


	<!-- 일정 추가 모달 -->
	<div id="add-event-modal" class="modal">
	  <div class="modal-header">일정 추가</div>
	  <input type="text" id="event-title" placeholder="일정 제목 입력" style="width: 80%; padding: 5px; margin-bottom: 10px;" />
	  <input type="hidden" id="event-date" />
	  <div class="modal-footer btn-box-hover">
	    <button id="add-event-btn" class="btn3-hover">추가</button>
	    <button onclick="$.modal.close()" class="btn2-hover">취소</button>
	  </div>
	</div>
	
	<!-- 일정 삭제 모달 -->
	<div id="delete-event-modal" class="modal">
	  <div class="modal-header">일정 삭제</div>
	  <p id="delete-event-title" style="font-weight: bold;"></p>
	  <p>이 일정을 삭제하시겠습니까?</p>
	  <div class="modal-footer btn-box-hover">
	    <button id="delete-event-btn" class="btn1-hover">삭제</button>
	    <button onclick="$.modal.close()" class="btn2-hover">취소</button>
	  </div>
	</div>
	
	
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        editable: true, // 일정 위치 변경 가능
        selectable: true,

        droppable: true, // 일정 드래그 가능
        locale: 'ko',
        initialView: 'dayGridMonth',
        headerToolbar: {
          left: 'prev,next today', // 이전, 다음, 오늘 버튼
          center: 'title', // 제목 중앙 표시
          right: 'dayGridMonth,timeGridWeek,timeGridDay' // 월별, 주간별, 일별 버튼
        },
        dayHeaderClassNames: function (info) {
          if (info.date.getDay() === 0) {
            return ['sunday']; // 일요일에 'sunday' 클래스 추가
          }
          if (info.date.getDay() === 6) {
            return ['saturday']; // 토요일에 'saturday' 클래스 추가
          }
        },
        // 특정 요일에 셀 클래스를 추가하는 옵션
        dayCellClassNames: function (info) {
          if (info.date.getDay() === 0) {
            return ['sunday']; // 일요일에 'sunday' 클래스 추가
          }
          if (info.date.getDay() === 6) {
            return ['saturday']; // 토요일에 'saturday' 클래스 추가
          }

        },
        views: {
          dayGridMonth: {

            buttonText: '월간'
          },
          timeGridWeek: {

            buttonText: '주간'
          },
          timeGridDay: {

            buttonText: '일간'
          }
        },
        events: [
          // 이벤트 추가
          { title: 'Sample Event', date: '2024-11-15' }

        ],
        dateClick: function (info) {
          $('#event-date').val(info.dateStr);
          $('#add-event-modal').modal();
        },
        eventClick: function (info) {
          var event = info.event;
          $('#delete-event-title').text(event.title);
          $('#delete-event-modal').modal();
        }
      });
      calendar.render();
      // 일정 추가 버튼 클릭
      $('#add-event-btn').click(function () {
        var eventTitle = $('#event-title').val();
        var eventDate = $('#event-date').val();
        var eventColor = '';
        if (eventTitle.includes("공지사항")) {
          eventColor = '#FF5733'; // 빨간색
        } else if (eventTitle.includes("일정")) {
          eventColor = '#FFEB3B'; // 노란색
        } else if (eventTitle.includes("휴가")) {
          eventColor = '#2196F3'; // 파란색
        } else if (eventTitle.includes("회의")) {
          eventColor = '#4CAF50'; // 초록색
        } else {
          eventColor = '#B0BEC5'; // 기본 색상 (회색)
        }

        if (eventTitle && eventDate) {
          calendar.addEvent({
            title: eventTitle,
            start: eventDate,
            color: eventColor // 일정 색상 설정
          });
          $.modal.close();
        }
      });

      // 일정 삭제 버튼 클릭
      $('#delete-event-btn').click(function () {
        var event = $('#delete-event-title').text();
        var eventToDelete = calendar.getEvents().find(e => e.title === event);
        if (eventToDelete) {
          eventToDelete.remove();
          $.modal.close();
        }
      });
    });
  </script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/locales/ko.js"></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


  
  <script>
    function toggleSubmenu(element) {
      const submenu = element.nextElementSibling;
      if (submenu.style.maxHeight === "0px" || submenu.style.maxHeight === "") {
        submenu.style.maxHeight = submenu.scrollHeight + "px";
      } else {
        submenu.style.maxHeight = "0";
      }
    }
  </script>
</body>


</html>