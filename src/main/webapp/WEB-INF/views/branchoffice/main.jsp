<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
 .branch {
      display: flex;
      flex-direction: column;
    }

    .branch-top {
      border-radius: 20px;
      padding: 30px;
      background-color: white;
      width: 100%;
      height: 300px;
    }

    .branch-top-box {
      display: flex;
      justify-content: space-between;
      height: 15%;
    }

    .branch-top-box-sales {
      justify-content: space-around;
      display: flex;
      height: 85%;
      padding: 20px 0;
    }

    .branch-top-box-sales-box {
      border-radius: 20px;
      padding: 30px;
      background-color: rgba(153, 161, 239, 1);
      width: 500px;
      display: flex;
      justify-content: space-between;
      height: 100%; /* 높이도 100%로 설정 */
    }

    .branch-top-box-sales-box-btn {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .branch-top-box-sales-box-btn button {
      font-size: 18px;
      padding: 20px 30px;
      border-radius: 10px;
      border: 0;
    }
    #salesChart {
      width: 100% !important; /* width를 100%로 설정 */
      height: 100% !important; /* 높이도 100%로 설정 */
      max-width: 500px; /* 최대 폭 제한 */
    }
    .branch-body{
      display: flex;
      margin-top: 30px;
      height: 360px;
    }
    .branch-body-box1{
      margin-right: 10px;
      width: 50%;
      border-radius: 20px;
      padding: 30px;
      background-color: white;
      
    }
    .branch-body-box2{
      margin-left: 10px;
      width: 50%;
      border-radius: 20px;
      padding: 30px;
      background-color: white;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
     <div class="branch">
        <div class="branch-top">
          <div class="branch-top-box">
            <div class="branch-top-box1">경기지점</div>
            <div class="branch-top-box2">홍길동 점주님</div>
          </div>
          <hr>
          <div class="branch-top-box-sales">
            <div class="branch-top-box-sales-box">
              <div class="branch-top-box-sales-box-text">
                <span class="ffont2" style="color: white;">00월 00일 매출금액 기준</span><br><br><br>
                <span class="ffont1" style="color: white;">총 9,999,999,999원</span>
              </div>
              <div class="branch-top-box-sales-box-btn">
                <button>매출현황 확인</button>
              </div>
            </div>
            <div class="branch-top-box-graph-box">
              <canvas id="salesChart"></canvas>
            </div>
          </div>
        </div>
        <div class="branch-body">
          <div class="branch-body-box1">
            
          </div>
          <div class="branch-body-box2">

          </div>
        </div>
      </div>
	</div>
	<script>
    $(document).ready(function() {
      const ctx = document.getElementById('salesChart').getContext('2d');
  
      let gradient = ctx.createLinearGradient(0, 0, 0, 400);
      gradient.addColorStop(0, 'rgba(255, 99, 132, 1)');
      gradient.addColorStop(1, 'rgba(54, 162, 235, 1)');
  
      const salesData = [
        { time: "09:00", amount: 120000 },
        { time: "10:00", amount: 135000 },  
        { time: "11:00", amount: 180000 },
        { time: "12:00", amount: 210000 },
        { time: "13:00", amount: 190000 },
        { time: "14:00", amount: 220000 },
        { time: "15:00", amount: 250000 },
        { time: "16:00", amount: 230000 },
        { time: "17:00", amount: 300000 },
        { time: "18:00", amount: 320000 }
      ];
  
      const salesChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: salesData.map(entry => entry.time),
          datasets: [{
            data: salesData.map(entry => entry.amount),
            backgroundColor: 'rgba(255, 255, 255, 0)',  
            borderColor: gradient,  
            borderWidth: 3,  // 두께 조정
            pointRadius: 5,  // 포인트 크기
            pointBackgroundColor: '#fff', // 포인트 배경색
            pointHoverRadius: 6,  // 포인트 크기 확대
            tension: 0.4,  // 부드러운 곡선
            fill: false  
          }]
        },
        options: {
          responsive: true,
          scales: {
            x: {
              grid: {
                display: false  
              },
              ticks: {
                font: {
                  size: 14,
                  weight: 'bold'
                },
                color: '#6c757d'  
              },
              title: {
                display: false
              }
            },
            y: {
              grid: {
                display: true,
                color: '#f2f2f2'
              },
              ticks: {
                beginAtZero: true,
                font: {
                  size: 14
                },
                color: '#6c757d'
              },
              title: {
                display: false
              }
            }
          },
          plugins: {
            legend: {
              display: false // 라벨 제거
            }
          }
        }
      });
    });
  </script>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>