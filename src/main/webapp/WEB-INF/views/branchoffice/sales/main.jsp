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
	 .graph-box{
      border-radius: 20px;
      background-color: white;
      padding:30px;
      width: 100%;
      height: 60%;
      margin-bottom: 15px;
    }
    .text-graph-box{
      margin-top: 15px;
      border-radius: 20px;
      background-color: white;
      padding:30px;
      width: 100%;
      height: 40%;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
       <div class="sales-box">
        <div class="graph-box">
          <!-- Column Chart -->
          <div id="columnChart"></div>

          <script>
            document.addEventListener("DOMContentLoaded", () => {
              new ApexCharts(document.querySelector("#columnChart"), {
                series: [{
                  name: 'Net Profit',
                  data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
                }, {
                  name: 'Revenue',
                  data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
                }, {
                  name: 'Free Cash Flow',
                  data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
                }],
                chart: {
                  type: 'bar',
                  height: 350
                },
                plotOptions: {
                  bar: {
                    horizontal: false,
                    columnWidth: '55%',
                    endingShape: 'rounded'
                  },
                },
                dataLabels: {
                  enabled: false
                },
                stroke: {
                  show: true,
                  width: 2,
                  colors: ['transparent']
                },
                xaxis: {
                  categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                },
                yaxis: {
                  title: {
                    text: '$ (thousands)'
                  }
                },
                fill: {
                  opacity: 1
                },
                tooltip: {
                  y: {
                    formatter: function(val) {
                      return "$ " + val + " thousands"
                    }
                  }
                }
              }).render();
            });
          </script>
         
        </div>
        <style>
          .sales-box{
            display: flex;
            flex-direction: column;
            height: 100%;
          }
          .text-graph-box table{
            border: 1px solid lightgray;
            width: 100%;
            text-align: center;
          }
          tr,td,th{
            border: 1px solid lightgray;
          }
          .text-graph-box-box{
            display: flex;
            height: 100%;
          }
        </style>
        <div class="text-graph-box">
          <div class="text-graph-box-box">
            <table>
              <thead>
                <tr>
                  <th colspan="2"><span class="ffont3">기간(월)</span></th>
                  <th ><span class="ffont3">2024.01</span></th>
                  <th ><span class="ffont3">2024.02</span></th>
                  <th ><span class="ffont3">2024.03</span></th>
                  <th ><span class="ffont3">2024.04</span></th>
                  <th ><span class="ffont3">2024.05</span></th>
                  <th ><span class="ffont3">2024.06</span></th>
                  <th ><span class="ffont3">2024.07</span></th>
                  <th ><span class="ffont3">2024.08</span></th>
                  <th ><span class="ffont3">2024.09</span></th>
                  <th ><span class="ffont3">2024.10</span></th>
                  <th ><span class="ffont3">2024.11</span></th>
                  <th ><span class="ffont3">2024.12</span></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td rowspan="2">
                    <span class="ffont3">매출액</span><br>
                    <span class="ffont3">(단위:원)</span>
                  </td>
                  <td>조회기간</td>
                  <td>1</td>
                  <td>2</td>
                  <td>3</td>
                  <td>4</td>
                  <td>5</td>
                  <td>6</td>
                  <td>7</td>
                  <td>8</td>
                  <td>9</td>
                  <td>10</td>
                  <td>11</td>
                  <td>12</td>
                </tr>
                <tr>
                  <td>비교기간</td>
                  <td>1</td>
                  <td>2</td>
                  <td>3</td>
                  <td>4</td>
                  <td>5</td>
                  <td>6</td>
                  <td>7</td>
                  <td>8</td>
                  <td>9</td>
                  <td>10</td>
                  <td>11</td>
                  <td>12</td>
                </tr>
                <tr>
                  <td rowspan="2">
                    <span class="ffont3">매익률</span><br>
                    <span class="ffont3">(단위:%)</span>
                  </td>
                  <td>조회기간</td>
                  <td>1</td>
                  <td>2</td>
                  <td>3</td>
                  <td>4</td>
                  <td>5</td>
                  <td>6</td>
                  <td>7</td>
                  <td>8</td>
                  <td>9</td>
                  <td>10</td>
                  <td>11</td>
                  <td>12</td>
                </tr>
                <tr>
                  <td>비교기간</td>
                  <td>1</td>
                  <td>2</td>
                  <td>3</td>
                  <td>4</td>
                  <td>5</td>
                  <td>6</td>
                  <td>7</td>
                  <td>8</td>
                  <td>9</td>
                  <td>10</td>
                  <td>11</td>
                  <td>12</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>  
      </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>