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
     display: flex;
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
     height: 89%;
     width: 100%;
     overflow-y: auto;
   }

   .left_body_listItem {
     display: flex;
   font-size: 20px;
   color: gray;
   font-weight: 400;
   height: 34px;
   cursor: pointer;
   }
   .left_body_listItem > .icon {
     margin: 0 0 0 20px;
   }
   .left_body_listItem:hover {
     background-color: #ababab;
     color: rgb(255, 255, 255);
   }
   .left_body_listItem.active {
  background-color: rgb(249, 249, 194);
  color: black;
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
     margin-left: 30%;
   }
   .disablebackdrop{
   	top: 70px;
   }
   input {
   	padding-left: 10px;
   }
	.test{
		width: 60px;
	}
	#btn_add{
		width:60px;
	}
	#btn_remove{
		width:60px;
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
                	<form action="${contextPath}/system/boardsDelete.do" method="get">
	                  <input type="hidden" id="input_No2" name="boardNo" />
	                  <button class="btn2-hover" id="btn_remove" type="submit" >
	                    <b style="font-weight: 900">-</b> 삭제
	                  </button>
                	</form>
                	
                  <form action="${contextPath}/system/boardsAdd.do">
	                  <button class="btn2-hover" id="btn_add" type="submit" >
	                    <b style="font-weight: 900">+</b> 추가
	                  </button>
                  </form>
                </div>
              </div>
      
              <div class="left_body_list">
                <!-- 메뉴 리스트 -->
               	<c:choose>
               		<c:when test="${ empty list }">
		                  <span>조회된 게시판 유형이 없습니다.</span>
               		</c:when>
               				
               		<c:otherwise>
               			<c:forEach var="bt" items="${ list }">
               				<div class="left_body_listItem" 
               						 data-boardTypeNo="${bt.getBoardTypeNo()}"
               						 data-boardtName="${bt.getBoardtName()}"
               						 data-boardtType="${bt.getBoardtType()}"
               						 data-boardtRead="${bt.getBoardtRead()}"
               						 data-boardtWrite="${bt.getBoardtWrite()}"
               						 data-boardtContent="${bt.getBoardtContent()}"
               						 data-boardtUse="${bt.getBoardtUse()}"
               						 data-deptCode="${bt.getDeptCode()}"
               						 >
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
            <form action="${ contextPath }/system/boardUpdate.do" method="post">
            		<input type="hidden" id="input_No" name="boardTypeNo" />
		            <div class="right_main">
		              <div style="margin-left: 57px; border: 1px solid rgb(201, 201, 201); width: 100%;">
		                <!-- 메뉴 세부 설정 테이블 -->
		                <table class="table">
		                  <tbody>
		                    <tr>
		                      <th scope="row">제목</th>
		                      <td>
		                        <div class="input-bar">
		                          <input type="text" class="input-bar1" id="input_name" name="boardtName" maxlength="19"/>
		                        </div>
		                      </td>
		                    </tr>
		                    <tr>
		                      <th scope="row">게시판 유형</th>
		                      <td style="display: flex;">
		                        <div>
		                          <select class="form-select" id="boardTypeSelect" name="boardtType" aria-label="Default select example">
		                            <option value="N">공지</option>
		                            <option value="G">자유</option>
		                            <option value="S">익명</option>
		                          </select>
		                        </div>
		                      </td>
		                    </tr>
		                    <tr>
		                      <th scope="row">권한 설정</th>
		                      <td>
		                        <div style="display: flex">
		                          <div style="margin: 0 50px 0 0">쓰기</div>
		                          <div>
		                            <select class="form-select" id="SelectLv" name="boardtContent" aria-label="Default select example">
		                              <option value="5">Lv 5</option>
		                              <option value="4">Lv 4</option>
		                              <option value="3">Lv 3</option>
		                              <option value="2">Lv 2</option>
		                              <option value="1">Lv 1</option>
		                            </select>
		                          </div>
		                        </div>
		                        <div style="display: flex; margin: 5px 0 5px 0">
		                          <div style="margin: 0 20px 0 0">댓글쓰기</div>
		                          <div>
		                            <select class="form-select" id="SelectComment" name="boardtWrite" aria-label="Default select example">
		                              <option value="5">Lv 5</option>
		                              <option value="4">Lv 4</option>
		                              <option value="3">Lv 3</option>
		                              <option value="2">Lv 2</option>
		                              <option value="1">Lv 1</option>
		                            </select>
		                          </div>
		                        </div>
		                        <div style="display: flex">
		                          <div style="margin: 0 50px 0 0">읽기</div>
		                          <div>
		                            <select class="form-select" id="SelectWrite" name="boardtRead" aria-label="Default select example">
		                              <option value="5">Lv 5</option>
		                              <option value="4">Lv 4</option>
		                              <option value="3">Lv 3</option>
		                              <option value="2">Lv 2</option>
		                              <option value="1">Lv 1</option>
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
		                          <input class="form-check-input" type="checkbox" name="boardtUse" id="gridCheck1" />
		                        </div>
		                      </td>
		                    </tr>
		                    <tr>
		                      <th scope="row">지점 여부</th>
		                      <td style="display: flex">
		                        지점
		                        <div class="form-check" style="margin: 0 0 0 10px">
		                          <input class="form-check-input" type="checkbox" name="deptCode" id="gridCheck2" />
		                        </div>
		                      </td>
		                    </tr>
		                  </tbody>
		                </table>
		              </div>
		              <div class="body_bottom_btn">
				            <div class="btn-box-hover">
				              <button type="submit" class="btn3-hover">적용</button>
				              <a href="${ contextPath }/system/systemBoardsList.do"><button type="button" class="btn1-hover">취소</button></a>
				            </div>
			          	</div>
		            </div>
		          </form>
		        </div> <!-- text-box end -->
          </div>
          
			<script>
              document.addEventListener('DOMContentLoaded', () => {
                const menuItems = document.querySelectorAll('.left_body_listItem');
            
                menuItems.forEach(item => {
                  item.addEventListener('click', function () {
                    document.querySelectorAll('.left_body_listItem.active').forEach(activeItem => activeItem.classList.remove('active'));
            
                    this.classList.add('active');
            
                    const boardTypeNo = this.getAttribute('data-boardTypeNo');
                    const boardTypeName = this.getAttribute('data-boardtName');
                    const boardtType = this.getAttribute('data-boardtType');
                    const boardtRead = this.getAttribute('data-boardtRead');
                    const boardtWrite = this.getAttribute('data-boardtWrite');
                    const boardtContent = this.getAttribute('data-boardtContent');
                    const boardtUse = this.getAttribute('data-boardtUse');
                    const deptCode = this.getAttribute('data-deptCode');
                    
                    //게시판 번호
					input_No.value = boardTypeNo;
					input_No2.value = boardTypeNo;
					console.log(boardTypeNo);
                    
                    //제목
                    input_name.value = boardTypeName;
                    
                    //게시판 유형
					const selectElement = document.getElementById('boardTypeSelect');
                    
                    if (boardtType == 'N') {
                        selectElement.value = 'N';
                    } else if (boardtType == 'G') {
                        selectElement.value = 'G';
                    } else if (boardtType == 'S') {
                        selectElement.value = 'S';
                    }
                    
                    //쓰기 권한 설정
                    const selectElementLv = document.getElementById('SelectLv');
                    selectElementLv.value = boardtContent;
                    
                    //댓글 쓰기 설정
					const selectElementComment = document.getElementById('SelectComment');
					selectElementComment.value = boardtWrite;

                    //읽기 쓰기 설정
					const selectElementWrite = document.getElementById('SelectWrite');
					selectElementWrite.value = boardtRead;
					
					//감추기 설정
					const selectElementHide = document.getElementById('gridCheck1');
					selectElementHide.checked = boardtUse == 'N';
					
					//지점 여부 (보류- 사유: 지점 dept_code 전부 다름, 쿼리문 방법 찾은 후 작업)
										
                  });
                });
             		// 삭제 버튼 클릭 시
	                const deleteButton = document.querySelector('#btn_remove');
	                if (deleteButton) {
                  		deleteButton.addEventListener('click', function (event) {
                   		event.preventDefault();  // 기본 제출 동작을 막음

	                    // active 클래스를 가진 메뉴 항목 찾기
	                    const activeItem = document.querySelector('.left_body_listItem.active');
	                    if (activeItem) {
	                      const boardTypeNo = activeItem.getAttribute('data-boardTypeNo');
	                      
	                      // boardTypeNo를 쿼리 파라미터로 URL에 추가하여 삭제 요청을 보냄
	                      const deleteUrl = `${contextPath}/system/boardsDelete.do?${boardTypeNo}`;
	
	                      // 삭제 요청을 위한 폼 제출
	                      window.location.href = deleteUrl;
                    	}
	                  });
	                }
              });
			</script>
	</div><!-- body-body End -->


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>