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
        <div class="search-box">
          <style>
            .search-text {
              display: flex;
              justify-content: end;
            }
            .search-text-text {
              width: 100px;
              border: 1px solid lightgray;
              text-align: center;
              border-radius: 5px;
              height: 30px;
              margin-right: 5px;
            }
            .search-text-box {
              position: relative;
              height: 30px;
              width: 300px; 
            }
            .search-text-box input {
              width: 100%;
              border: 1px solid lightgray;
              border-radius: 5px;
              height: 100%;
              padding-right: 30px; 
            }
            .search-text-box button {
              position: absolute;
              right: 5px;
              top: 50%;
              transform: translateY(-50%);
              background-color: white;
              border: none;
              padding: 0;
              cursor: pointer;
            }
            .add-edit-box{
              margin-top: 80px;
              margin-bottom: 20px;
              display: flex;
              justify-content: end;
            }
          </style>
          
         	<div>
						<b style="font-size: 25px; margin-left: 10px;">공지사항</b>
					</div>
					<hr>
          <div class="search-text">
            <div class="search-text-text">
              <span class="ffont3">상품명</span>
            </div>
            <div class="search-text-box">
              <input type="text">
              <button><i class="bi bi-search"></i></button>
            </div>
          </div>
          <div class="add-edit-box">
            <button class="btn4" style="margin-right: 5px;">추가</button>
            <button class="btn4">삭제</button>
          </div>
        </div>
        <div class="table-box">
          <table class="table" style="text-align: center;">
            <thead>
              <tr>
                <th width="100px"></th>
                <th width="100px">번호</th>
                <th width="150px">분류</th>
                <th width="300px">상품명</th>
                <th width="100px">원가</th>
                <th width="100px">매가</th>
                <th width="100px">매익률</th>
                <th width="100px"></th>
              </tr>
            </thead>
            <tbody>
              <!-- case1. 조회된 게시글이 없을 경우 -->
              <!--
                <tr>
                  <td colspan="8" style="text-align: center;">존재하는 상품이 없습니다.</td>
                </tr>
                -->

              <!-- case2. 조회된 게시글이 있을 경우 -->
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>10</td>
                <td>음료</td>
                <td>파워에이드</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>

              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>9</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>8</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>7</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>6</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>4</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>3</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>2</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
              <tr>
                <td><input type="checkbox" name="list-checkBox" id=""></td>
                <td>1</td>
                <td>주류</td>
                <td>참이슬</td>
                <td>2000</td>
                <td>1590</td>
                <td>10%</td>
                <td>
                  <button class="btn4">
                    수정
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
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
          </style>
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