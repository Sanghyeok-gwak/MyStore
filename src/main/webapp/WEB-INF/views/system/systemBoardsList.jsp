<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	.menu_main {
        margin-top: 2%;
        display: flex;
        font-family: "Noto Sans KR", sans-serif;
        height: 80%;
      }
      .left_main {
        border: solid 2px rgba(174, 174, 174, 0.261);
        height: 100%;
        border-radius: 0 5px 5px 0;
        z-index: 1;
      }
      .left_line {
        background-color: #99a1ef;
        width: 436px;
        height: 55px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        display: flex;
        align-items: center;
      }

      .left_title_txt {
        font-size: 22px;
        color: white;
        margin-left: 20px;
        font-weight: 400px;
      }
      #left_head_btn {
        margin-left: 40%;
        font-size: 14px;
      }
      #left_head_btn > button {
        border-style: none;
        width: 61px;
        height: 27px;
        font-weight: 400;
      }

      .left_body_list {
        border: solid 0px red;
        margin-top: 5px;
        height: 93%;
        width: 100%;
        overflow-y: auto;
      }

      .left_body_listItem {
        display: flex;
        font-size: 20px;
        color: gray;
        font-weight: 400;
        height: 34px;
      }
      .left_body_listItem > .icon {
        margin: 0 0 0 20px;
      }
      .left_body_listItem:hover {
        background-color: #dadada;
        color: rgb(255, 255, 255);
      }
      .left_body_noList {
        font-size: 18px;
        margin: 30px;
        text-align: center;
      }

      /* 오른쪽 CSS */
      .table > tbody {
        vertical-align: middle;
      }
      .table {
        margin-bottom: 0;
      }
      .table th {
        background-color: rgb(236, 236, 236);
        font-weight: 400;
        width: 157px;
      }
      .table .form-check-input {
        width: 20px;
        height: 20px;
        border-color: #828282;
      }
      .body_bottom_btn {
        display: flex;
        justify-content: center;
        margin-top: 40px;
      }
      .disablebackdrop{
      	top: 70px;
      }
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/side.jsp"/>

	<div class="body-body">
       <div class="text-box">
          <span class="ffont1" style="font-weight: bold;">세부메뉴관리</span>
      
          <div class="menu_main">
            <!-- 왼쪽 메뉴 영역 -->
            <div class="left_main">
              <div class="left_line">
                <div class="left_title_txt" style="z-index: 3">메뉴 관리</div>
                <div class="btn-box-hover" id="left_head_btn">
                  <button class="btn2-hover">
                    <b style="font-weight: 900">-</b> 삭제
                  </button>
                  <button class="btn2-hover" type="button" data-bs-toggle="modal" data-bs-target="#disablebackdrop">
                    <b style="font-weight: 900">+</b> 추가
                  </button>
                  
	               	<div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
		                <div class="modal-dialog">
		                  <div class="modal-content">
		                    <div class="modal-header">
		                      <h5 class="modal-title">게시판 타입 추가</h5>
		                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                    </div>
		                    <div class="modal-body">
		                    	<span>글자수 최대 20</span><br>
		                      <span>게시판 타입 제목 &nbsp</span><input type="text" class="input-bar1" />
		                    </div>
		                    <div class="modal-footer">
		                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		                      <button type="button" class="btn btn-primary">추가</button>
		                    </div>
		                  </div>
		                </div>
		              </div><!-- End Disabled Backdrop Modal-->
		              
                </div>
              </div>
      
              <div class="left_body_list">
                <!-- 메뉴 리스트 -->
               	<c:choose>
               		<c:when test="${ empty list }">
		                  <spen>조회된 게시판 유형이 없습니다.</spen>
               		</c:when>
               				
               		<c:otherwise>
               			<div class="left_body_listItem">
			                  <div class="icon"><i class="bi bi-file-earmark"></i></div>
			                  추가버튼 한칸 추가, 타이틀 작성? 에이작스?
		                </div>
		                <div class="left_body_listItem">
			                  <div class="icon"><i class="bi bi-file-earmark"></i></div>
			                  클릭 시 호버 남아있는 스크립트 구현
		                </div>
		                <div class="left_body_listItem">
			                  <div class="icon"><i class="bi bi-file-earmark"></i></div>
			                  글자수 20으로 제한 필요
		                </div>
		                <div class="left_body_listItem">
			                  <div class="icon"><i class="bi bi-file-earmark"></i></div>
			                  개같은 모달 스타일 뒤지게 안먹네
		                </div>
               			<c:forEach var="bt" items="${ list }">
               				<div class="left_body_listItem">
			                  <div class="icon"><i class="bi bi-file-earmark"></i></div>
			                  ${ bt.getBoardtName() }
			                </div>
               			</c:forEach>
               		</c:otherwise>
               	</c:choose>
                <!-- 더 많은 메뉴 항목 추가 가능 -->
              </div>
            </div>
      
            <!-- 오른쪽 설정 영역 -->
            <div class="right_main">
              <div style="margin-left: 57px; border: 1px solid rgb(201, 201, 201); width: 100%;">
                <!-- 메뉴 세부 설정 테이블 -->
                <table class="table">
                  <tbody>
                    <tr>
                      <th scope="row">이름</th>
                      <td>
                        <div class="input-bar">
                          <input type="text" class="input-bar1" />
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">권한 설정</th>
                      <td>
                        <div style="display: flex">
                          <div style="margin: 0 50px 0 0">쓰기</div>
                          <div>
                            <select class="form-select" aria-label="Default select example">
                              <option value="1">Lv 5</option>
                              <option value="2">Lv 4</option>
                              <option value="3">Lv 3</option>
                              <option value="2">Lv 2</option>
                              <option value="3">Lv 1</option>
                            </select>
                          </div>
                        </div>
                        <div style="display: flex; margin: 5px 0 5px 0">
                          <div style="margin: 0 20px 0 0">댓글쓰기</div>
                          <div>
                            <select class="form-select" aria-label="Default select example">
                              <option value="1">Lv 5</option>
                              <option value="2">Lv 4</option>
                              <option value="3">Lv 3</option>
                              <option value="2">Lv 2</option>
                              <option value="3">Lv 1</option>
                            </select>
                          </div>
                        </div>
                        <div style="display: flex">
                          <div style="margin: 0 50px 0 0">읽기</div>
                          <div>
                            <select class="form-select" aria-label="Default select example">
                              <option value="1">Lv 5</option>
                              <option value="2">Lv 4</option>
                              <option value="3">Lv 3</option>
                              <option value="2">Lv 2</option>
                              <option value="3">Lv 1</option>
                            </select>
                          </div>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">감추기 설정</th>
                      <td style="display: flex">
                        메뉴감추기
                        <div class="form-check" style="margin: 0 0 0 10px">
                          <input class="form-check-input" type="checkbox" id="gridCheck1" />
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">지점 여부</th>
                      <td style="display: flex">
                        지점
                        <div class="form-check" style="margin: 0 0 0 10px">
                          <input class="form-check-input" type="checkbox" id="gridCheck1" />
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
      
          <!-- 하단 버튼 -->
          <div class="body_bottom_btn">
            <div class="btn-box-hover">
              <button class="btn3-hover">적용</button>
              <button class="btn1-hover">취소</button>
            </div>
          </div>
        </div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>