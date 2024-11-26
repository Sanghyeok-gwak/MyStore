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
      .note-box{
        display: flex;
        height: 100%;
      }

      .note-side,.note-body{
        border-radius: 20px;
        padding:30px;
        background-color: white;
      }
      .note-side{
        width: 20%;
        height: 100%;
        margin-right: 10px;
	    }
	    .note-body{
	        width: 80%;
	        height: 100%;
	        margin-left: 10px;
	      }
	    .note-side-text{
	        text-align: left;
	    }  
	    hr{
	        margin-top: 10px;
	        margin-bottom: 10px;
	    }
	    .note-side-btn{
	        width: 100%;
	        margin-bottom: 20px;
	    }
	    .note-side-btn button{
	        width: 100%;
	        height: 45px;
	    }
	    .note-side-a-box ul{
	        list-style-type: none;
	    }
	    .note-side-a-box ul>li{
	        border-radius: 5px;
	        width: 100%;
	        height: 50px;
	        padding: 10px;
	        padding-left: 5px;
	        border-bottom: 1px solid lightgray;
	    }
	    .note-side-a-box ul>li a{
	        text-decoration: none;
	        color: black;
	    }
	    .note-side-a-box ul>li:hover{
	        background-color: rgb(219, 219, 219);
	    }
	    .table-box table{
	        width: 100%;
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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
<div class="note-box">
	<div class="note-side">
	  <div class="note-side-text">
	      <span class="ffont1">쪽지함</span>
	  </div>
	  <hr>
	  <div class="note-side-btn">
	      <button class="btn4">쪽지 쓰기</button>
	  </div>
	  <div class="note-side-a-box">
	      <ul style="padding-left:0px!important;">
	          <li>
	              <a href="${contextPath}/note/list.no" style="color: red;">받은쪽지함</a><br>
	          </li>
	          <li>
	              <a href="">보낸쪽지함</a><br>
	          </li>
	          <li>
	              <a href="">임시보관함</a><br>
	          </li>
	          <li>
	              <a href="">휴지통</a><br>
	          </li>
	      </ul>
	  </div>
	</div>
	<div class="note-body">
	  <div>
	      <b style="font-size: 25px; margin-left: 10px;">받은쪽지함</b>
	</div>
	<hr>
	<div class="table-box">
	    <table class="table" style="text-align: center;">
	        <thead>
	            <tr>
		             <th style="width: 50px;"><input type="checkbox" name="" id=""></th>
		             <th style="width: 100px;">분류</th>
		             <th style="width: 300px;">제목</th>
		             <th style="width: 150px;">보낸사람</th>
		             <th style="width: 200px;">일시</th>
		             <th style="width: 50px;"><img src="https://i.ibb.co/G0pSz81/1.png" style="width:20px!important;"></th>
	            </tr>    
	        </thead>
	        <tbody>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            <tr>
                <td><input type="checkBox"></td>
                <td>일반</td>
                <td>테스트 제목 입니다.</td>
                <td>아무개</td>
                <td>2024.11.25 23:21</td>
                <td></td>
	            </tr>
	            
	        </tbody>
	    </table>                
	</div>
	<div class="paging"> 
	  <ul class="pagination d-flex justify-content-center text-dark" style="margin-top: 40px;">
	          <li class="page-item disabled">
	            <a class="page-link" href="">
	              <i class="bi bi-chevron-double-left"></i> <span>이전</span>
	            </a>
	          </li>
	          <li class="page-item active"><a class="page-link" href="">1</a></li>
	          <li class="page-item"><a class="page-link" href="">2</a></li>
	          <li class="page-item"><a class="page-link" href="">3</a></li>
	          <li class="page-item"><a class="page-link" href="">4</a></li>
	          <li class="page-item"><a class="page-link" href="">5</a></li>
	          <li class="page-item">
	            <a class="page-link" href="">
	              <span>다음</span>&nbsp;<i class="bi bi-chevron-double-right"></i>
	            </a>
	          </li>
	        </ul>
	      </div>
	  </div>
	</div>      
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>