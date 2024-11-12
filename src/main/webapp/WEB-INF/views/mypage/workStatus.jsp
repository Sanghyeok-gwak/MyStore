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
      <div class="text-box">             
      <span class="ffont1" style="font-weight: bold;">근태조회</span>

      <div class="card-body">
        <br>


        <table class="table table-bordered" style="width: 500px; text-align: center;  ">
            <thead>
              <tr>
                <th scope="col">조회일자</th>
                <th scope="col">
                    <input type="date"  style="cursor: pointer; " onclick="">
                </th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <th scope="row">성명</th>
                <th> 배수지</th>
              </tr>
            </tbody>

        </table>

        <br>

        <!-- Table with hoverable rows -->
        <table class="table table-hover" style="text-align: center;" >
          <thead>
            <tr>
              <th scope="co1">일자</th>
              <th scope="col">요일</th>
              <th scope="col">구 분</th>
              <th scope="col">출근시간</th>
              <th scope="col">퇴근시간</th>
              <th scope="col">부여된연차</th>
              <th scope="col">사용가능연차</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">2024-10-01</th>
              <td>화</td>
              <td> - </td>
              <td>08:57</td>
              <td>18:02</td>
              <td>10</td>
              <td>9</td>
            </tr>
            <tr>
                <th scope="row">2024-10-02</th>
                <td>수</td>
                <td> 지각 </td>
                <td>09:10</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-03</th>
                <td>목</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-04</th>
                <td>금</td>
                <td> 결근 </td>
                <td> - </td>
                <td> - </td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-05</th>
                <td>월</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-06</th>
                <td>화</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-07</th>
                <td>수</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>     
              <tr>
                <th scope="row">2024-10-08</th>
                <td>화</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-09</th>
                <td>화</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-10</th>
                <td>화</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              <tr>
                <th scope="row">2024-10-01</th>
                <td>화</td>
                <td> - </td>
                <td>08:57</td>
                <td>18:02</td>
                <td>10</td>
              <td>9</td>
              </tr>
              
              </tbody>
              </table>

              <div class="btn-box-hover" style="display: flex; justify-content: flex-end;">
                <button class="btn3-hover">홈으로</button> 
              </div>


            </div>
            
            
      </div>
      
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>