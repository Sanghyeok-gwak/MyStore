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
		      <button class="btn4" onclick='location.href="${contextPath }/note/write.no"'>쪽지 쓰기</button>
		  </div>
		  <div class="note-side-a-box">
		      <ul style="padding-left:0px!important;">
		          <li>
		              <a href="${contextPath}/note/reception.no" style="color: red;">받은쪽지함</a><br>
		          </li>
		          <li>
		              <a href="${contextPath}/note/send.no">보낸쪽지함</a><br>
		          </li>
		          <li>
		              <a href="${contextPath }/note/temporay.no">임시보관함</a><br>
		          </li>
		          <li>
		              <a href="${contextPath }/note/trashnote.no">휴지통</a><br>
		          </li>
		      </ul>
		  </div>
		</div>
		<div class="note-body">
		  <div>
		      <b style="font-size: 25px; margin-left: 10px;">받은쪽지함</b>
		</div>
		<hr>
      <script>
			  // 'checkAll' 체크박스를 클릭하면 모든 체크박스를 선택하거나 해제
			  function toggleAllCheckboxes(source) {
			    var checkboxes = document.querySelectorAll('.checkItem');
			    checkboxes.forEach(function(checkbox) {
			      checkbox.checked = source.checked;
			    });
			  }
			</script>
			<div class="table-box">
       	<form action="${contextPath }/temporayadd.no" method="get">
			    <table class="table" style="text-align: center;">
			        <thead>
			            <tr>
				             <th style="width: 50px;">
				             	<input type="checkbox" id="checkAll" onclick="toggleAllCheckboxes(this)">
				             </th>
				             <th style="width: 100px;">번호</th>
				             <th style="width: 300px;">제목</th>
				             <th style="width: 150px;">보낸사람</th>
				             <th style="width: 200px;">확인 일시</th>
			            </tr>    
			        </thead>
			        <tbody>
			        	<c:choose>
			        		<c:when test="${empty list }">
			        			<tr>
			                  <td colspan="5" style="text-align: center;">존재하는 쪽지가 없습니다.</td>
			                </tr>
			        		</c:when>
			        		<c:otherwise>
			        			<c:forEach var="r" items="${list }" varStatus="status">
					            <tr>
				                <td><input type="checkBox" name="receptionNo" class="checkItem" value="${r.receptionNo }"></td>
				                <td>${list.size() - status.index}</td>
				                <td>${r.title }</td>
				                <td>${r.recepId }</td>
				                <td>${r.recCheck eq 'Y' ? 'r.recDate' : '' }</td>
					            </tr>
					           </c:forEach> 
			        		</c:otherwise>
			        	</c:choose>	
			        </tbody>
			    </table>                
       	</form>
				<div class="paging"> 
            <ul id="paging_area" class="pagination d-flex justify-content-center">
            
              <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
              	<a class="page-link" href="${contextPath }/note/reception.no?page=${pi.currentPage-1}"><i class="bi bi-chevron-double-left"></i><span>이전</span></a>
              </li>
              
              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              	<li class="page-item ${ pi.currentPage == p ? 'active' : '' }">
              		<a class="page-link" href="${contextPath }/note/reception.no?page=${p}">${ p }</a>
              	</li>
              </c:forEach>
              
              <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
              	<a class="page-link" href="${contextPath }/note/reception.no?page=${pi.currentPage+1}"><span>다음</span>&nbsp;<i
									class="bi bi-chevron-double-right"></i></a>
              </li>
              
            </ul>
         </div>
			</div>
			
		</div>
	</div>      
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>