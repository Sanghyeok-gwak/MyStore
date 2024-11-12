<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      
      <body>
      <div class="text-box">
        <span class="ffont1" style="font-weight: bold;">급여조회</span>

      <div class="title">2024년 11월 지급명세서</div>
      <table>
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
      </table>
      
      <table>
          <tr>
              <th colspan="4">지급 내역</th>
          </tr>
          <tr>
              <th>&nbsp;기본급여&nbsp;</th>
              <th>시간외수당</th>
              <th> &nbsp;&nbsp;상여금&nbsp;&nbsp;</th>
              <th>총지급액&nbsp;&nbsp;</th>
          </tr>
          <tr>
              <td>2,500,000</td>
              <td>0</td>
              <td>0</td>
              <td>2,500,000</td>
          </tr>
      </table>
      
      <table>
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
      </table>
      
      <table>
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

      <div class="btn-box-hover" style="display: flex; margin-left: 777px;">
        <button class="btn3-hover ffont3" style="width: 250px; height: 35px;">출력하기</button> 
        <button class="btn3-hover ffont3" style="width: 250px; height: 35px;">홈으로</button> 
    </div>

  </div>

      
  </body>
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>