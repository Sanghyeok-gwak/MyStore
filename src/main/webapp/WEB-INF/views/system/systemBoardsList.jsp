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
	                  <button id="target_btn" disabled class="btn2-hover" type="submit" onclick="$('#frm').attr('action', '${contextPath}/system/boardsDelete.do').submit();" >
	                    <b style="font-weight: 900">-</b> 삭제
	                  </button>
                	
                  <form action="${contextPath}/system/boardsAdd.do">
	                  <button class="btn2-hover" id="btn_add" type="submit" >
	                    <b style="font-weight: 900">+</b> 추가
	                  </button>
                  </form>
                </div>
              </div>
              
			       <script>
								function checkSelection() {
								    if ($('input[type="checkbox"]:checked').length == 0) {
								        alert("삭제할 항목을 선택하세요.");
								        return false;
								    }
								    return true;
								}
						</script>
              <!-- 
              	삭제 클릭시 실행되는 function
              		오른쪽의 form 요소 선택한후 
              		해당 form 의 action 속성값을 삭제용 url로 변경후
              		해당 form.submit();
               -->
      
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
               						 data-officeUse="${bt.getOfficeUse()}"
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
            <form id="frm" action="${ contextPath }/system/boardUpdate.do" method="post">
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
		                      <th scope="row">감추기 설정</th>
		                      <td style="display: flex">
		                        메뉴감추기
		                        <div class="form-check" style="margin: 0 0 0 10px">
		                          <input class="form-check-input" type="checkbox" name="boardtUse" id="gridCheck1" />
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
                const target = document.getElementById('target_btn');
                
                menuItems.forEach(item => {
                  item.addEventListener('click', function () {
                    document.querySelectorAll('.left_body_listItem.active').forEach(activeItem => activeItem.classList.remove('active'));
            
                    this.classList.add('active');
                    
                    //선택시 삭제버튼 활성화
                    target.disabled = false;
            
                    //오른쪽 요소에 데이터 넣기
                    const boardTypeNo = this.getAttribute('data-boardTypeNo');
                    const boardTypeName = this.getAttribute('data-boardtName');
                    const boardtType = this.getAttribute('data-boardtType');
                    const boardtRead = this.getAttribute('data-boardtRead');
                    const boardtWrite = this.getAttribute('data-boardtWrite');
                    const boardtContent = this.getAttribute('data-boardtContent');
                    const boardtUse = this.getAttribute('data-boardtUse');
                    const officeUse = this.getAttribute('data-officeUse');
                    const deptCode = this.getAttribute('data-deptCode');
                    
                    //게시판 번호
										input_No.value = boardTypeNo;
                    
										//input_No2.value = boardTypeNo;
										//console.log(boardTypeNo);
                    
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
                    
                    
										
										//감추기 설정
										const selectElementHide = document.getElementById('gridCheck1');
										selectElementHide.checked = boardtUse == 'Y';
										
										
										
                  });
                });
              });
			</script>
	</div><!-- body-body End -->


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>