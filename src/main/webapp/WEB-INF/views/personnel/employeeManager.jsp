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
.icon > button{
        border: none;
        background: none;
        outline: none;
    }
    .search_box{
        display: flex;
        width: 250px;
        border: 1px solid rgb(112, 112, 112);
        border-radius: 3px;
        align-items: center;
    }
    .input_b{
        border-style: none;
        outline: none;
        box-shadow: none;
        width: 100%;
        margin-left: 3%;
    }
    .icon{
      margin-right: 10px;
    }
    .enroll{
      border:none; 
      background-color:  white; color: black;
    }
    
    

  </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      
      <div class="text-box">             
        <span class="ffont1" style="font-weight: bold;">사원관리</span>

      <div class="card-body">

        <div class="btn-box-hover" style="display: flex; justify-content: flex-end;">
            <button class="btn3-hover" style="height: 40px;">+ 사원등록 </button> 
        </div>

        <br>

        <div style="display: flex; justify-content: flex-end; ">

            <!-- 드롭다운 버튼 -->
            <select class="datatable-selector" name="per-page" style="margin-right: 5px;">
              <option value="">이름</option>
              <option value="">사번</option>
            </select>
              
            <!-- width값은 페이지에 맞게 조절해주세요 -->
            <div class="search_box" style="width:300px;">
              <input class="input_b" type="text" placeholder="검색">
            <div class="icon">
              <button><i class="bi bi-search"></i></button>
            </div>
        
            </div>

        </div>


        <br>

        <!-- Table with hoverable rows -->
        <table class="table table-hover" style="text-align: center;">
            <thead>
                <tr>
                    <th scope="col">이름</th>
                    <th scope="col">사번</th>
                    <th scope="col">부서</th>
                    <th scope="col">직위/직급</th>
                    <th scope="col">입사일자</th>
                    <th scope="col">이메일</th>
                    <th scope="col">휴대폰</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">천예찬</th>
                    <td>10001</td>
                    <td>개발팀</td>
                    <td>노예</td>
                    <td>2021-06-01</td>
                    <td>chunLOL@gmail.com</td>
                    <td>010-1111-2222</td>
                </tr>
                <tr>
                    <th scope="row">고정호</th>
                    <td>10002</td>
                    <td>마케팅팀</td>
                    <td>노비</td>
                    <td>2020-04-15</td>
                    <td>fixho@gmail.com</td>
                    <td>010-3333-4444</td>
                </tr>
                <tr>
                    <th scope="row">박철수</th>
                    <td>10003</td>
                    <td>영업팀</td>
                    <td>과장</td>
                    <td>2018-09-12</td>
                    <td>chulsoo.park@example.com</td>
                    <td>010-5555-6666</td>
                </tr>
                <tr>
                    <th scope="row">정다희</th>
                    <td>10004</td>
                    <td>디자인팀</td>
                    <td>팀장</td>
                    <td>2017-03-20</td>
                    <td>dahee.jung@example.com</td>
                    <td>010-7777-8888</td>
                </tr>
                <tr>
                    <th scope="row">최영호</th>
                    <td>10005</td>
                    <td>기획팀</td>
                    <td>부장</td>
                    <td>2015-11-05</td>
                    <td>youngho.choi@example.com</td>
                    <td>010-9999-1010</td>
                </tr>
                <tr>
                    <th scope="row">김영희</th>
                    <td>10006</td>
                    <td>홍보팀</td>
                    <td>사원</td>
                    <td>2023-02-08</td>
                    <td>younghee.kim@example.com</td>
                    <td>010-1112-1314</td>
                </tr>
                <tr>
                    <th scope="row">이강수</th>
                    <td>10007</td>
                    <td>재무팀</td>
                    <td>대리</td>
                    <td>2019-07-24</td>
                    <td>kangsoo.lee@example.com</td>
                    <td>010-1516-1718</td>
                </tr>
                <tr>
                    <th scope="row">박하늘</th>
                    <td>10008</td>
                    <td>연구개발팀</td>
                    <td>차장</td>
                    <td>2016-01-13</td>
                    <td>haneul.park@example.com</td>
                    <td>010-1920-2122</td>
                </tr>
                <tr>
                    <th scope="row">오은별</th>
                    <td>10009</td>
                    <td>품질관리팀</td>
                    <td>과장</td>
                    <td>2013-05-18</td>
                    <td>eunbyul.oh@example.com</td>
                    <td>010-2324-2526</td>
                </tr>
                <tr>
                    <th scope="row">장민수</th>
                    <td>10010</td>
                    <td>고객지원팀</td>
                    <td>대리</td>
                    <td>2022-10-30</td>
                    <td>minsoo.jang@example.com</td>
                    <td>010-2728-2930</td>
                </tr>
            </tbody>
        </table>

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