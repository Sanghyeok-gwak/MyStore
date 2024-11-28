<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.graph-box {
	border-radius: 20px;
	background-color: white;
	padding: 30px;
	width: 100%;
	height: 60%;
	margin-bottom: 15px;
}

.text-graph-box {
	margin-top: 15px;
	border-radius: 20px;
	background-color: white;
	padding: 30px;
	width: 100%;
	height: 40%;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	
	<div class="body-body">
		<!-- 여기 채워서 작업하시면 됩니다 .-->
		<div class="sales-box">
			<div class="graph-box">
				<!-- Column Chart -->
				<div id="columnChart"></div>

				<script>
            document.addEventListener("DOMContentLoaded", () => {
							// 랜덤 값 생성 함수 (min과 max 사이의 값)
							function generateRandomData(min, max, length) {
							  return Array.from({ length }, () => Math.floor(Math.random() * (max - min + 1)) + min);
							}
							
							// 데이터 생성
							const netProfitData = generateRandomData(40, 70, 9); // Net Profit: 40~70 사이의 값
							const revenueData = generateRandomData(40, 120, 9);  // Revenue: 75~120 사이의 값
							const freeCashFlowData = generateRandomData(25, 70, 9); // Free Cash Flow: 25~55 사이의 값
             
              new ApexCharts(document.querySelector("#columnChart"), {
                series: [{
                  name: 'Net Profit',
                  data: netProfitData
                }, {
                  name: 'Revenue',
                  data: revenueData
                }, {
                  name: 'Free Cash Flow',
                  data: freeCashFlowData
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
			.sales-box {
				display: flex;
				flex-direction: column;
				height: 100%;
			}
			
			.text-graph-box table {
				border: 1px solid lightgray;
				width: 100%;
				text-align: center;
			}
			
			tr, td, th {
				border: 1px solid lightgray;
			}
			
			.text-graph-box-box {
				display: flex;
				height: 100%;
			}
			</style>

			<div class="text-graph-box">
				<div class="text-graph-box-box">
					<table>
						<thead>
							<tr>
								<th colspan="2">기간(월)</th>
								<th>2024.01</th>
								<th>2024.02</th>
								<th>2024.03</th>
								<th>2024.04</th>
								<th>2024.05</th>
								<th>2024.06</th>
								<th>2024.07</th>
								<th>2024.08</th>
								<th>2024.09</th>
								<th>2024.10</th>
								<th>2024.11</th>
								<th>2024.12</th>
							</tr>
						</thead>
						<tbody>
        			<tr>
                <td rowspan="2">매출액<br>(단위: 원)</td>
                <td>조회기간</td>
                <td><fmt:formatNumber value="${sales[0][0]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][1]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][2]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][3]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][4]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][5]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][6]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][7]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][8]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][9]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][10]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[0][11]}" type="number" pattern="#,###" /></td>
            	</tr>
            	<tr>
                <td>비교기간</td>
                <td><fmt:formatNumber value="${sales[1][0]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][1]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][2]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][3]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][4]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][5]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][6]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][7]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][8]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][9]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][10]}" type="number" pattern="#,###" /></td>
                <td><fmt:formatNumber value="${sales[1][11]}" type="number" pattern="#,###" /></td>
            	</tr>
							<tr>
								<td rowspan="2">매익률<br>(단위: %)
								</td>
								<td>조회기간</td>
								<td>${profitRates[0][0]}</td>
								<td>${profitRates[0][1]}</td>
								<td>${profitRates[0][2]}</td>
								<td>${profitRates[0][3]}</td>
								<td>${profitRates[0][4]}</td>
								<td>${profitRates[0][5]}</td>
								<td>${profitRates[0][6]}</td>
								<td>${profitRates[0][7]}</td>
								<td>${profitRates[0][8]}</td>
								<td>${profitRates[0][9]}</td>
								<td>${profitRates[0][10]}</td>
								<td>${profitRates[0][11]}</td>
							</tr>
							<tr>
								<td>비교기간</td>
								<td>${profitRates[1][0]}</td>
								<td>${profitRates[1][1]}</td>
								<td>${profitRates[1][2]}</td>
								<td>${profitRates[1][3]}</td>
								<td>${profitRates[1][4]}</td>
								<td>${profitRates[1][5]}</td>
								<td>${profitRates[1][6]}</td>
								<td>${profitRates[1][7]}</td>
								<td>${profitRates[1][8]}</td>
								<td>${profitRates[1][9]}</td>
								<td>${profitRates[1][10]}</td>
								<td>${profitRates[1][11]}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>





	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>








