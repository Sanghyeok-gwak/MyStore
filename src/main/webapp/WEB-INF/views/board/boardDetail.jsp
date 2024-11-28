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
.text-box{
	overflow-y: scroll;
}
.dropdown-menu .dropdown-item-text:hover {
    background-color: #f1f1f1; /* 호버 시 배경 색 변경 */
   
    cursor: pointer; /* 마우스 커서가 손 모양으로 변경 */
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/side.jsp" />
<div class="body-body">
<!-- 여기 채워서 작업하시면 됩니다 .-->
	<div class="text-box">
		<div class="board-detail-box">
			<div class="board-detail-box-text">
				<div class="d-flex" style="flex-direction: column;">
					<span class="ffont1">${ b.boardTitle }</span><br>
					<div class="box-box" style="font-size: 18px;">
						<div class="d-flex justify-content-between" style="display: flex; justify-content: space-between; width: 100%; margin-top:10px;">
							<div >${ b.empName }</div>
							<div style="display: flex; justify-content: space-between; gap: 10px;">
								<div style="margin-right: 50px;">${ b.createDate }</div>
								<div style="margin-right: 50px;">댓글 수 ${ listCount }</div>
								<div>조회 수 ${ b.boardCount }</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div style="margin-top: 20px; border-top: #000000 1px solid; border-bottom: #000000 1px solid;">
			<table>
				<td style="padding-top: 5px; padding-bottom: 5px; padding-left: 0; padding-right: 0;">
		    <div style="display: flex; justify-content: space-between; width: 100%; font-size: 18px;">
		        <div>첨부파일</div>
		        <div style="text-align: right; margin-left: 30px; color: #afacac;">
		            <c:forEach var="at" items="${ b.boardList }">
		                <!-- 첨부파일 목록을 세로로 나열 -->
		                <div style="margin-bottom: 5px;  text-align: left;">
		                    <a href="${contextPath}${at.filePath}/${at.fileSystemName}" download="${ at.originalName }">${ at.originalName }</a>
		                    <span class="origin_attach_del" data-fileno="${ at.boardFileNo }"></span>
		                </div>
		            </c:forEach>
		        </div>
		    </div>
		</td>

			</table>
		</div>
		<div class="board-content" style="height:400px; margin-top: 20px;">
			${ b.boardContent }
		</div>

	 <c:if test="${loginUser.empNo eq b.empNo}">
			<form id="frm" action="" method="post">
		<div class="btn-box-hover">
			<div style="display: flex; justify-content: center; width: 100%;">
			<input  type="hidden" name="no" value="${b.boardNo}">
				<button type="submit" class="btn3-hover" onclick="$('#frm').attr('action','${contextPath}/board/boardModify.do');">글 수정</button>
				<button type="submit" class="btn1-hover" onclick="$('#frm').attr('action','${contextPath}/board/delete.do');">글 삭제</button>
			</div>
		</div>
			</form>
		</c:if>
		
		<div style="margin-top: 25px; border-top: #000000 1px solid; border-bottom: #000000 1px solid;">
			<table>
				<td style="padding-top: 5px; padding-bottom: 5px; padding-left: 0; padding-right: 0;">
					<div style="display: flex; justify-content: space-between; width: 100%; font-size: 18px;">
						<div>댓글 ${ listCount }개</div>
					</div>
				</td>

			</table>

		</div>
		
		
		<style>
			.reply-box{
				margin-left:5px;
				margin-right:150px;
				
			}
			.reply-reply-box{
				margin-left:5px;
				margin-right:150px;
				
			}
		</style>
		
<c:forEach var="r" items="${reply}">
  <c:if test="${not empty r.uprReplyNo}">
            <i class="bi bi-arrow-return-right" style="margin-top:10px;"></i>
        </c:if>
    <div class="reply-box"
         <c:if test="${not empty r.uprReplyNo}"> 
            style="margin-left:50px;"
         </c:if>
         >
        <div class="d-flex" style="flex-direction: column; font-size: 18px; margin-top: 10px;">
            <!-- 작성자 및 댓글 텍스트 부분 -->
            <div class="d-flex" style="display: flex; align-items: center; width: 50%;">
                <div style="width:100%;"><span>${r.empName}</span></div> 
                <c:if test="${loginUser.empNo eq r.empNo}">
                    <!-- 드롭다운 아이콘 클릭 -->
                    <div class="dropdown" style="cursor: pointer;" onclick="toggleDropdown(event)">
                        <div>
                            <i class="bi bi-three-dots"></i>
                        </div>
                        <!-- 드롭다운 메뉴 (기본적으로 숨김) -->
                        <div class="dropdown-menu" style="display: none;">
                            <span class="dropdown-item-text">수정</span>
                            <span class="dropdown-item-text">삭제</span>
                        </div>
                    </div>
                </c:if>
            </div>
    
            <!-- 댓글 텍스트 -->
            <div style="padding-bottom: 5px; margin-top: 5px; width: 50%;">${r.replyContent}</div>
    
            <!-- 댓글 관련 정보 (날짜, 답글쓰기, 하트이모티콘) -->
            <div class="d-flex" style="margin-top: 5px; gap: 3px; width: 29%; color: #afacac;">
                <div>${r.formattedCreateDate}</div>
                
                <!-- 답글이 아닐 경우 답글쓰기 버튼 표시 -->
                <c:if test="${empty r.uprReplyNo}">
                    <div style="margin-left: 20px; margin-top: -1px; cursor: pointer;" onclick="toggleTextarea(${r.replyNo})">답글쓰기</div>
                </c:if>

                <div class="like-container" style="position: relative; cursor: pointer;">
                    <!-- 비어있는 하트 아이콘 (위에 표시될 아이콘) -->
                    <i class="bi bi-heart-fill" style="position: absolute; left: 0; top: 0; color: red; z-index: 0; display: none;" onclick="toggleLike(this)"></i>
                    <i class="bi bi-heart" style="position: absolute; left: 0; top: 0; z-index: 1;" onclick="toggleLike(this)"></i>
                </div>
            </div>
        </div>

        <!-- 답글 입력창 (동적으로 표시됨) -->
     <form action="{contextPath}/board/boardDetail.do?no=${b.boardNo}" method="post">
	    <div id="replyTextareaContainer${r.replyNo}" class="reply-textarea-container" style="display: none; margin-top: 10px; width: 100%;">
	    		<textarea class="form-control" id="reply_content_${r.replyNo}" style="width: 90%; height: 100px; resize: none; border: 1px solid #000000"></textarea>
	    		<button class="btn2-hover" style="width: 8%; height: 40px;" onclick="submitReply(${r.replyNo})">작성하기</button>
			</div>
		</form>
	

       
    </div>
</c:forEach>



		
		
		
		
		
		
			<script>
			
			
			
			
			// 드롭다운 토글 함수
				// 드롭다운 토글 함수
			function toggleDropdown(event) {
			    // 모든 드롭다운 메뉴 찾기
			    const allDropdownMenus = document.querySelectorAll('.dropdown-menu');
			
			    // 현재 클릭된 드롭다운 메뉴
			    const clickedDropdownMenu = event.currentTarget.querySelector('.dropdown-menu');
			
			    // 모든 드롭다운 메뉴를 닫음
			    allDropdownMenus.forEach(menu => {
			        if (menu !== clickedDropdownMenu) {
			            menu.style.display = 'none';  // 다른 드롭다운은 숨기기
			        }
			    });
			
			    // 현재 클릭된 드롭다운 메뉴 열기/닫기
			    if (clickedDropdownMenu.style.display === 'none' || clickedDropdownMenu.style.display === '') {
			        clickedDropdownMenu.style.display = 'block';  // 열기
			    } else {
			        clickedDropdownMenu.style.display = 'none';  // 닫기
			    }
			}
			
			// 문서에서 다른 부분을 클릭하면 드롭다운을 닫는 함수
			function closeDropdowns(event) {
			    const allDropdownMenus = document.querySelectorAll('.dropdown-menu');
			    const clickedDropdown = event.target.closest('.dropdown'); // 클릭된 요소가 드롭다운 내부인지를 확인
			    
			    // 드롭다운 외부를 클릭했다면
			    if (!clickedDropdown) {
			        allDropdownMenus.forEach(menu => {
			            menu.style.display = 'none'; // 모든 드롭다운 메뉴를 닫기
			        });
			    }
			}
			
			// 문서 전체에 클릭 이벤트 추가
			document.addEventListener('click', closeDropdowns);


			
			
    function toggleLike(clickedIcon) {
        // 부모 요소인 like-container 안의 아이콘들을 찾음
        const likeContainer = clickedIcon.closest('.like-container');
        const heartIcon = likeContainer.querySelector('.bi-heart');
        const heartFillIcon = likeContainer.querySelector('.bi-heart-fill');

        // 하트 아이콘과 채워진 하트 아이콘의 상태를 토글
        if (clickedIcon === heartIcon) {
            heartIcon.style.display = 'none';
            heartFillIcon.style.display = 'inline-block';
        } else {
            heartIcon.style.display = 'inline-block';
            heartFillIcon.style.display = 'none';
        }
    }
    
    function toggleTextarea(replyNo) {
        // 모든 답글 텍스트 영역을 찾음
        const allTextareaContainers = document.querySelectorAll('.reply-textarea-container');
        
        // 모든 답글 텍스트 영역을 숨김
        allTextareaContainers.forEach(function(container) {
            // 클릭된 텍스트 영역이 아닌 다른 모든 영역을 숨김
            if (container.id !== 'replyTextareaContainer' + replyNo) {
                container.style.display = 'none';
            }
        });

        // 클릭한 답글 텍스트 영역만 열기
        const textareaContainer = document.getElementById('replyTextareaContainer' + replyNo);
        if (textareaContainer) {
            // 현재 텍스트 영역의 스타일을 확인하여 열려 있는지 확인
            const currentDisplay = window.getComputedStyle(textareaContainer).display;

            // 만약 현재 display가 'none'이라면 열고, 아니면 닫음
            if (currentDisplay === 'none') {
                textareaContainer.style.display = 'block';  // 열기
            } else {
                textareaContainer.style.display = 'none';  // 닫기
            }
        }
    }





    function submitReply() {
        const replyContent = document.getElementById("replyTextarea").value;
        
        // 답글 내용이 있을 경우 처리 (예시로 콘솔에 출력)
        if (replyContent.trim() !== "") {
            console.log("작성된 답글:", replyContent);
            
            // 서버에 답글을 제출하거나 추가적인 동작을 여기에 추가
            
            // 텍스트 영역 숨기기
            document.getElementById("replyTextareaContainer").style.display = "none";
            document.getElementById("replyTextarea").value = ""; // 텍스트 영역 초기화
        } else {
            alert("답글을 입력해주세요.");
        }
    }
 // 답글 텍스트영역 토글
    function toggleTextarea(replyNo) {
        // 해당 댓글의 답글 입력창 토글
        var textareaContainer = document.getElementById('replyTextareaContainer' + replyNo);
        if (textareaContainer) {
            textareaContainer.style.display = (textareaContainer.style.display === 'none' || textareaContainer.style.display === '') ? 'block' : 'none';
        }
    }

    // 댓글 작성 AJAX
    function submitReply(parentReplyNo) {
        var replyContent = document.getElementById('reply_content_' + parentReplyNo).value;

        if (replyContent.trim() === "") {
            alert("답글 내용을 입력해주세요.");
            return;
        }

        $.ajax({
            url: '${contextPath}/board/addReply.do',
            type: 'POST',
            data: {
                boardNo: ${b.boardNo}, 
                replyContent: replyContent,
                parentReplyNo: parentReplyNo
            },
            success: function(response) {
                if (response.success) {
                    alert("답글이 작성되었습니다.");
                    location.reload();  // 답글 작성 후 페이지 새로 고침하여 댓글 리스트 갱신
                } else {
                    alert("답글 작성에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다.");
            }
        });
    }

    
</script>
		<hr style="opacity:1;">
		<div style="margin-top: 10px; color: #afacac; display: flex; align-items: center;">
			<i class="bi bi-lock" style="margin-right: 10px; margin-bottom: 10px;">&nbsp;비밀댓글</i>
			<div class="form-check form-switch" style="margin-left: 10px; margin-bottom: 10px;">
				<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"> 
				<label class="form-check-label" for="flexSwitchCheckDefault"></label>
			</div>
		</div>
		
		<div style="display: flex; justify-content: space-between; align-items: center;">
			<textarea
				class="form-control" id="reply_content" style="width: 90%; height: 100px; resize: none; border: 1px solid #000000"></textarea>

			<button class="btn2-hover" style="width: 8%; height: 40px;" onclick="fn_insertReply();">작성하기</button>
		</div>
		
	</div>
	
		
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>