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

<style>
.left {
	display: flex;
	justify-content: flex-end;
}

.dropdown {
	width: 150px;
	height: 35px;
	margin-right: 15px;
	border: 1px solid gray;
}

.card {
	margin-bottom: 30px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
}

.card-body {
	padding: 0 20px 20px 20px;
}

/* 넓이 높이만 수정해서 사용하세요 인풋 스타일*/
input {
	border: 1px solid gray;
	border-radius: 2px;
	height: 35px;
	width: 480px;
}

.icon>button {
	border: none;
	background: none;
	outline: none;
}

.search_box {
	display: flex;
	width: 250px;
	border: 1px solid rgb(112, 112, 112);
	border-radius: 3px;
	align-items: center;
}

.input_b {
	border-style: none;
	outline: none;
	box-shadow: none;
	margin-left: 10px;
	margin-right: 10px;
}

.icon {
	margin-right: 10px;
}

.pagination .page-link {
	color: rgba(109, 105, 108, 1);
	background-color: white;
	border: none;
}

.pagination .page-item.active .page-link {
	border: 1px solid red;
	color: red;
	background-color: white;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
       <div class="text-box">
    
            <div style="margin-top: 15px; font-size:25px;">
              부서 이동 이력
            </div>
        

        <div>
          <table class="table" style="margin-top: 30px;">
            <tbody>
              <!-- 첫 번째 행: 날짜 선택 -->
              <tr>
                <th style="height: 85px; background-color: #EBEAEA; vertical-align: middle;  text-align: center; ">변경일 선택</th>
                <td style="height: 85px; display: flex; justify-content: flex-start; align-items: center; text-align: center;">
                  <input type="date" style="width: 150px; margin-left:15px;"> &nbsp;~ &nbsp;<input type="date" style="width: 150px;">
                </td>                
              </tr>
          
              <!-- 두 번째 행: 검색 조건 -->
              <tr>
                <th style="height: 85px; background-color: #EBEAEA; vertical-align: middle;  text-align: center; ">검색 조건</th>
                <td style="vertical-align: middle;">
                  <div style="display: flex; align-items: center; margin-left:15px;">
                    <select class="dropdown dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <option selected>사원 명</option>
                      <option>사번</option>
                    </select>
                    <div class="search_box" style="width:500px;">
                      <input class="input_b" type="text" placeholder="검색">
                      <div class="icon">
                          <button><i class="bi bi-search"></i></button>
                      </div>
                  </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          
            </div>
          
              <div class="btn-box-hover">
                <div style="display: flex; justify-content: center; width: 100%; margin-top:20px;">
                  <button class="btn3-hover" >검색</button>
                </div>
              </div>
           
              <div>
                <div class="btn-box-hover">
                    <div style="display: flex; justify-content: flex-end; width: 100%; margin-top:20px;">
                      <button class="btn2-hover">다운로드</button>
                    </div>
                  </div>    

              </div>

              <table class="table table-hover" style="margin-top: 30px;">
                <thead>
                  <tr>
                    <th scope="col"></th>
                    <th scope="col">변경코드</th>
                    <th scope="col">변경일자</th>
                    <th scope="col">변경 전 부서</th>
                    <th scope="col">변경 후 부서</th>
                    <th scope="col">사용자 사번</th>
                    <th scope="col">사용자 이름</th>
                    <th scope="col">변경자 사번</th>
                    <th scope="col">변경자 이름</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="padding: 5px 10px; text-align: center;">
                          <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                        </td>
                        <td>123123</td>
                        <td>2024-11-02</td>
                        <td>영업1팀</td>
                        <td>영업3팀</td>
                        <td>A12354</td>
                        <td>김개똥</td>
                        <td>B44852</td>
                        <td>차은우</td>
                      </tr>
                      
                  
                </tbody>
              </table>
           




          </div>
       </div>

     
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
      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>