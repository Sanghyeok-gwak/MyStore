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
            <div class="d-flex" style="display: flex; align-items: center; width: 30%;">
                <div style="width:100%;"><span>${r.empName}</span></div> 
                <c:if test="${loginUser.empNo eq r.empNo}">
                    <!-- 드롭다운 아이콘 클릭 -->
                    <div class="dropdown" style="cursor: pointer;" onclick="toggleDropdown(event)">
                        <div>
                            <i class="bi bi-three-dots"></i>
                        </div>
                        <!-- 드롭다운 메뉴 (기본적으로 숨김) -->
                        <div class="dropdown-menu" style="display: none;">
   												  <span class="dropdown-item-text" onclick="editReply(${r.replyNo}, '${r.replyContent}')">수정</span>
                            <span class="dropdown-item-text" onclick="deleteReply(${r.replyNo})">삭제</span>
                        </div>
                    </div>
                </c:if>
            </div>
    
            <!-- 댓글 텍스트 -->
            <div style="padding-bottom: 5px; margin-top: 5px; width: 30%;">${r.replyContent}</div>
    
            <!-- 댓글 관련 정보 (날짜, 답글쓰기, 하트이모티콘) -->
            <div class="d-flex" style="margin-top: 5px; gap: 3px; width: 20%; color: #afacac;">
                <div>${r.formattedCreateDate}</div>
                
                <!-- 답글이 아닐 경우 답글쓰기 버튼 표시 -->
                <c:if test="${empty r.uprReplyNo}">
                    <div style="margin-left: 20px; margin-top: -1px; cursor: pointer;" onclick="toggleTextarea(${r.replyNo})">답글쓰기</div>
                </c:if>
            </div>
        </div>

        <!-- 답글 입력창 (동적으로 표시됨) -->
    
<form action="${contextPath}/board/addReply.do" method="post" onsubmit="return validateForm1(${r.replyNo})">
    <input type="hidden" name="replyContent" id="hidden_reply_content_${r.replyNo}" value="${r.replyContent}" />
    <input type="hidden" name="refBno" value="${b.boardNo}" />  <!-- 게시글 번호 -->
    <input type="hidden" name="uprReplyNo" value="${r.replyNo}" />  <!-- 댓글 번호 -->
    <input type="hidden" name="empNo" value="${loginUser.empNo}" />  <!-- 작성자 번호 -->

    <div id="replyTextareaContainer${r.replyNo}" class="reply-textarea-container" style="display: none; margin-top: 10px; width: 100%;">
        <textarea 
            class="form-control" 
            id="reply_content_${r.replyNo}" 
            style="width: 90%; height: 100px; resize: none; border: 1px solid #000000"
            oninput="updateHiddenReplyContent(${r.replyNo})"  
        ></textarea>
        <button type="submit" class="btn2-hover" style="width: 8%; height: 40px;">작성하기</button>
    </div>
</form>

<script>
    function validateForm1(replyNo) {
        var replyContent = document.getElementById('reply_content_' + replyNo).value.trim();
        
        if (replyContent === '') {
            alert('내용을 입력해주세요.');
            return false;  // 폼 제출을 방지합니다.
        }
        
        // 폼 제출을 허용합니다.
        return true;
    }
</script>
<script>
    $(document).ready(function() {
        // 좋아요 버튼 클릭 시
        $(".like-btn").click(function() {
            var container = $(this).closest(".like-container");
            var replyNo = container.data("reply-no"); // 댓글 번호
            var empName = container.data("emp-name"); // 사용자 이름
            var isLiked = container.find(".bi-heart-fill").is(":visible"); // 현재 좋아요 상태

            // 서버로 보낼 데이터 (현재 상태에 따라)
            var data = {
                replyNo: replyNo,
                empName: empName,
                goodReply: isLiked ? 'N' : 'Y' // 좋아요 상태 반전
            };

            // AJAX 요청
            $.ajax({
                url: '${contextPath}/board/goodReply.do',  // 서버 URL (컨트롤러 맵핑)
                type: 'POST',                // 요청 방식
                data: data,                  // 전송할 데이터
                success: function(response) {
                    // 좋아요 상태를 반영
                    if (data.goodReply === 'Y') {
                        // 좋아요 성공 시 아이콘 변경
                        container.find(".bi-heart").hide();
                        container.find(".bi-heart-fill").show();
                    } else {
                        // 좋아요 취소 시 아이콘 변경
                        container.find(".bi-heart").show();
                        container.find(".bi-heart-fill").hide();
                    }
                },
                error: function(xhr, status, error) {
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    });
</script>



	<script>
	
	
    function deleteReply(replyNo) {
    	
        var form = document.createElement('form');
        
        
        form.method = 'POST';
        form.action = '${contextPath}/board/replydelete.do'; 

        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'replyNo';
        input.value = replyNo;
        form.appendChild(input);

        document.body.appendChild(form);
        form.submit();
    }
</script>


<script>
    // 댓글 수정 함수
    function editReply(replyNo, replyContent) {
        // 수정할 댓글 번호와 내용에 대한 정보를 받아와서
        // 수정 페이지로 이동하거나, 수정 폼을 동적으로 생성하는 방식으로 처리
        var updatedContent = prompt("댓글을 수정하세요", replyContent);
        
        if (updatedContent !== null && updatedContent !== replyContent) {
            // 수정된 댓글 내용을 포함하여 POST 요청을 보내기 위한 동적 폼 생성
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = '${contextPath}/board/replyUpdate.do'; // 댓글 수정 처리 경로
            
            // 댓글 번호와 수정된 내용을 hidden input으로 추가
            var inputReplyNo = document.createElement('input');
            inputReplyNo.type = 'hidden';
            inputReplyNo.name = 'replyNo';
            inputReplyNo.value = replyNo;
            form.appendChild(inputReplyNo);

            var inputReplyContent = document.createElement('input');
            inputReplyContent.type = 'hidden';
            inputReplyContent.name = 'replyContent';
            inputReplyContent.value = updatedContent;
            form.appendChild(inputReplyContent);

            // 폼을 DOM에 추가하고 전송
            document.body.appendChild(form);
            form.submit();
        }
    }
</script>

	
	

<script>
    // 텍스트 영역에 입력된 값을 숨겨진 input 필드에 동적으로 설정
    function updateHiddenReplyContent(replyNo) {
        // 텍스트 영역에서 값을 가져옴
        var replyContent = document.getElementById("reply_content_" + replyNo).value;

        // 해당하는 hidden input 필드에 값 설정
        document.getElementById("hidden_reply_content_" + replyNo).value = replyContent;
    }
    
    
</script>



       
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

    
    
</script>
		<hr style="opacity:1;">
	
<form action="${contextPath}/board/addReply.do" method="post" onsubmit="return validateForm2()">
    <input type="hidden" name="replyContent" value="${not empty r.replyContent && r.replyContent.startsWith(',') ? r.replyContent.substring(1) : r.replyContent}" />
    <input type="hidden" name="refBno" value="${b.boardNo}" />
    <input type="hidden" name="uprReplyNo" value="${r.uprReplyNo}" />
    <input type="hidden" name="boarNo" value="${r.status}" />
    <input type="hidden" name="empNo" value="${r.empNo}" />
    
    <div style="display: flex; justify-content: space-between; align-items: center;">
        <textarea
            class="form-control" id="reply_content" name="replyContent" style="width: 90%; height: 100px; resize: none; border: 1px solid #000000">${not empty r.replyContent && r.replyContent.startsWith(',') ? r.replyContent.substring(1) : r.replyContent}</textarea>
        <button type="submit" class="btn2-hover" style="width: 8%; height: 40px;">작성하기</button>
    </div>
</form>

<script>
    function validateForm2() {
        var replyContent = document.getElementById('reply_content').value.trim();
        
        if (replyContent === '') {
            alert('내용을 입력해주세요.');
            return false;  // 폼 제출을 방지합니다.
        }
        
        // 폼 제출을 허용합니다.
        return true;
    }
</script>


<script>
// 댓글 내용 체크 함수
function validateReplyForm(formId) {
    // 폼 내의 textarea 요소를 찾음
    var replyTextarea = document.querySelector(`#${formId} textarea`);
    
    // 답글 작성 시 hidden 필드 값도 체크
    var hiddenReplyContent = document.querySelector(`#${formId} input[name="replyContent"]`);

    // 댓글이나 답글 내용이 공백인지 체크
    if (replyTextarea.value.trim() === "" && hiddenReplyContent.value.trim() === "") {
        alert("내용을 입력해주세요.");
        replyTextarea.focus();  // 텍스트 영역에 포커스를 주어 사용자가 다시 입력할 수 있도록 함
        return false;  // 폼 제출을 막음
    }

    return true;  // 내용이 있으면 폼을 제출
}

// 첫 번째 댓글 폼을 제출하기 전에 내용 확인
document.querySelector('#frm1').onsubmit = function(event) {
    if (!validateReplyForm('frm1')) {
        event.preventDefault();  // 폼이 제출되지 않도록 막음
    }
};

// 두 번째 댓글 폼을 제출하기 전에 내용 확인
document.querySelector('#frm2').onsubmit = function(event) {
    if (!validateReplyForm('frm2')) {
        event.preventDefault();  // 폼이 제출되지 않도록 막음
    }
};
</script>


		
	</div>
	
		
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>