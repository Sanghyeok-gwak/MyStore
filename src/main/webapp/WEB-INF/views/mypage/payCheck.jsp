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
    /* 테이블 스타일 */
    table th, table td {
        border: 1px solid #000;   /* 경계선 추가 */
        padding: 10px;
        text-align: center;        /* 텍스트 중앙 정렬 */
    }

    /* 테이블 헤더 스타일 */
    table th {
        background-color: #a3b8ff;
    }

    /* 제목 스타일 */
    .title {
        text-align: center;
        font-weight: bold;
        font-size: 1.5em;
        margin: 20px 0;
    }

    /* 급여 내역 테이블 스타일 */
    /*
    .paytable {
        width: 70%;
        margin: 20px auto;
        text-align: center;
    }
    */
</style>
</head>
<body>
<style>
	.payment-list{
	display:flex;
	flex-direction: column;
	padding-left: 100px;
  padding-right: 100px;
	}
	.btn-box-print{
		display:flex;
		margin-bottom:20px;
		justify-content: end;
	}
	.btn-box-home{
		display:flex;
		margin-top:20px;
		justify-content: end;
	}
	.btn-box-print button{
		border:0px;
		background-color:white;
	}
	
	.btn-box-home button{
		width:150px;
		border-radius: 10px;
		border: 0px;
	}
	
	
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
    <div class="text-box">
	        <span class="ffont1" style="font-weight: bold;">급여조회</span>
	        <div class="title">2024년 11월 지급명세서</div>
    	<div class="payment-list">
	        <div class="btn-box-print">
	        	<button><i class="bi bi-printer" style="font-size:25px"></i></button>
	        </div>
	
	        <table class="paytable">
	            <tr>
	                <th>소속</th>
	                <td>인사과</td>
	                <th>성명</th>
	                <td>배수지</td>
	            </tr>
	            <tr>
	                <th>사번</th>
	                <td>0001</td>
	                <th>계좌번호</th>
	                <td>국민은행 09203-92-2920 배수지</td>
	            </tr>
	            <tr>
	                <th>메일주소</th>
	                <td colspan="3">user01@naver.com</td>
	            </tr>
	
	            <tr>
	                <th colspan="4">지급 내역</th>
	            </tr>
	            <tr>
	                <th>기본급여</th>
	                <th>시간외수당</th>
	                <th>상여금</th>
	                <th>총지급액</th>
	            </tr>
	            <tr>
	                <td>2,500,000</td>
	                <td>0</td>
	                <td>0</td>
	                <td>2,500,000</td>
	            </tr>
	
	            <tr>
	                <th colspan="4">공제 내역</th>
	            </tr>
	            <tr>
	                <th>국민연금</th>
	                <th>건강보험</th>
	                <th>고용보험</th>
	                <th>총 공제액</th>
	            </tr>
	            <tr>
	                <td>150,000</td>
	                <td>130,000</td>
	                <td>20,000</td>
	                <td>300,000</td>
	            </tr>
	
	            <tr>
	                <th>총 지급액</th>
	                <td>2,500,000</td>
	                <th>총 공제액</th>
	                <td>300,000</td>
	            </tr>
	            <tr>
	                <th>실수령액</th>
	                <td colspan="3">2,200,000</td>
	            </tr>
	        </table>
	
	        <div class="btn-box-home">
	            <button class="btn3-hover ffont3">홈으로</button>
	        </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>