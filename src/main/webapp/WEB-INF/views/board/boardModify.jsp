<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 네이버 스마트에디터  -->
<script type="text/javascript"
	src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	<div class="body-body">
		<div class="text-box">
			<div class="text-box1">
				<div>	
					<div style="font-size: 18px;">
						<b>글 수정</b>
					</div>

					<form id="modifyform" action="${ contextPath }/board/update.do" method="post" enctype="multipart/form-data">
						  	<input type="hidden" name="boardNo" value="${ b.boardNo }">

							<!-- 게시판 유형 선택 (동적으로 데이터 사용) -->
					<!-- 게시판 유형 선택 -->

<select class="datatable-selector" id="boardTypeNo" name="boardTypeNo"
    style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px; height: 38px; width: 218px; margin-top: 30px;">
    <option value="" disabled style="display: none;">게시판을 선택해주세요</option>
    <c:forEach var="boardName" items="${boardTypeList}">
        <option value="${boardName.boardTypeNo}" ${boardName.boardtName == b.boardTypeNo ? 'selected' : ''}>
            ${boardName.boardtName}
        </option>
    </c:forEach>
</select>

<!-- 부서명 선택 (초기 상태에서 비활성화) -->
<select class="datatable-selector" id="boardDept" name="boardDept"
    style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px; height: 38px; width: 217px; margin-top: 30px;" disabled>
    <option value=""  selected >구분을 선택해주세요</option>
    <c:forEach var="dept" items="${deptList}">
        <option value="${dept.deptName}" ${dept.deptName == b.boardDept ? 'selected' : ''}>
            ${dept.deptName}

        </option>
    </c:forEach>
</select>

<script>
    // 첫 번째 드롭다운의 값이 변경될 때
    document.getElementById('boardTypeNo').addEventListener('change', function() {
        var boardDept = document.getElementById('boardDept');
        var importantSection = document.getElementById('important-section');
        
        // 게시판 유형이 '공지사항'일 때, 두 번째 드롭다운을 활성화하고 중요공지 체크박스 보여주기
        if (this.value === '1001') {
            boardDept.disabled = false;  // boardDept 활성화
            importantSection.style.display = 'block';  // 중요공지 체크박스 보이기
        } else {
            boardDept.disabled = true;  // boardDept 비활성화
            importantSection.style.display = 'none';  // 중요공지 체크박스 숨기기
        }
    });

    // 페이지 로드 시, 첫 번째 드롭다운 값이 이미 '공지사항'이면 두 번째 드롭다운 활성화 및 중요공지 체크박스 보이기
 window.onload = function() {
    var boardTypeNo = document.getElementById('boardTypeNo').value;
    var boardDept = document.getElementById('boardDept');
    var importantSection = document.getElementById('important-section');
    
    // 페이지 로드시에는 boardDept를 무조건 활성화
    boardDept.disabled = false;  // boardDept 활성화
    importantSection.style.display = 'block';  // 중요공지 체크박스 보이기

    // 이미 선택된 부서명 값이 있다면 해당 값을 선택 상태로 설정
    var selectedDept = "${b.boardDept}";
    if (selectedDept) {
        var deptOptions = boardDept.options;
        for (var i = 0; i < deptOptions.length; i++) {
            if (deptOptions[i].value === selectedDept) {
                deptOptions[i].selected = true;  // 부서명 선택
                break;
            }
        }
    }

    // 첫 번째 드롭다운 값에 따라 boardDept를 비활성화/활성화
    if (boardTypeNo === '1001') {
        boardDept.disabled = false;  // boardDept 활성화
        importantSection.style.display = 'block';  // 중요공지 체크박스 보이기
    } else {
        boardDept.disabled = true;  // boardDept 비활성화
        importantSection.style.display = 'none';  // 중요공지 체크박스 숨기기
    }
};

</script>


						<!-- 중요공지 체크박스를 위한 숨겨진 input 필드 -->
						<input type="hidden" id="importantCheckValue" name="boardCheck" value="N" />

						<div class="input-bar"
							style="display: flex; align-items: center; margin-right: 10px; margin-top: 20px;">
							<input type="text" class="input-bar1" placeholder="제목을 입력하세요"
								style="height: 38px; padding: 5px; width: 444px;" id="boardTitle" name="boardTitle"  value="${ b.boardTitle }"/>
						</div>

						<div class="d-flex"
							style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
							<div>
								<input type="file" class="form-control-file border" id="upfile"
									name="uploadFiles" multiple style="width: 444px;">
									
								<c:forEach var="at" items="${ b.boardList }">
							    <div>
							        <!-- 파일이 존재하는 경우에만 <a>와 <span>을 출력 -->
							        <c:if test="${not empty at.filePath and not empty at.fileSystemName}">
							            <a href="${contextPath}${at.filePath}/${at.fileSystemName}" download="${at.originalName}">
							                ${at.originalName}
							            </a>
							            <span class="origin_attach_del" data-fileno="${at.boardFileNo}">x</span>
							        </c:if>
							    </div>
							</c:forEach>

							</div>
							
						<!-- 중요공지 체크박스와 라벨 (기본적으로 숨김) -->

							<div class="btn-box-hover"
										style="display: flex; align-items: center; justify-content: center; gap: 10px;">
												<div id="important-section" style="display: none; margin-top: 10px; text-align: center;">
							    <label for="boardCheck" style="font-size: 14px;">중요공지</label>
							     <input type="checkbox" id="boardCheck" name="boardCheck"
					            style="width: 20px; height: 20px; margin-right: 20px;"
					            <c:if test="${b.boardCheck == 'N,on'}">checked</c:if>
					        />
							</div>
								<button type="submit" class="btn3-hover"
									style="height: 40px; padding: 5px 15px;">글 수정</button>
							</div>
						</div>


<div id="smarteditor" style="margin-top: 30px;">
    <textarea name="boardContent" id="boardContent" rows="20" cols="10"
        style="margin-top: 30px; width: 100%; height: 420px;">
        <c:out value="${fn:replace(b.boardContent, '<[^>]*>', '')}" />
    </textarea>
</div>

					</form>

				</div>
			</div>
		</div>
	</div>

<script>
$(document).ready(function () {
    let oEditors = [];

    // 스마트 에디터 초기화 함수
    function smartEditor() {
        // 기존에 존재하는 에디터 객체가 있다면 초기화 해제
        if (oEditors.length > 0) {
            oEditors[0].destroy();  // 기존 에디터 객체 파괴
            oEditors = [];  // oEditors 배열 비움
        }

        // 스마트 에디터 초기화
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "boardContent",  // 에디터가 렌더링될 ID
            sSkinURI: "/mystore/smarteditor/SmartEditor2Skin.html",
            htParams: {
                bUseVerticalResizer: false,
            	bUseModeChanger: true, // 모드 변경기능
	            fOnBeforeUnload: function() {
	                return null;  // 페이지 이탈 시 경고창을 띄우지 않음
	            }
            },
            fCreator: "createSEditor2",
            fOnAppLoad: function () {
             
                // oEditors가 제대로 로드되었는지 확인하고 초기화된 후 setEditorContent() 호출
                if (oEditors.length > 0 && oEditors[0]) {
                    setEditorContent();  // 에디터가 초기화된 후 본문 내용 설정
                } else {
                    console.error("스마트 에디터가 초기화되지 않았습니다.");
                }
            }
        });
    }

    // 에디터 본문 내용을 설정하는 함수
    function setEditorContent() {
        var boardContent = "${b.boardContent}";  // 서버에서 가져온 내용

        // oEditors가 제대로 로드되었는지 확인하고 setIR 호출
        if (oEditors.length > 0 && oEditors[0]) {

            // 스마트 에디터의 본문 내용 설정
            oEditors[0].setIR(boardContent); // 에디터에 본문 내용 설정
        } else {
            console.error("스마트 에디터가 초기화되지 않았습니다.");
        }
    }

    // 스마트 에디터 초기화 호출
    smartEditor();

    // 폼 제출 시 스마트 에디터의 내용을 textarea에 반영
    $('#modifyform').submit(function (event) {
        // 스마트 에디터에서 본문 내용을 가져오기
        var boardContent = oEditors[0].getIR(); // 스마트에디터의 내용 가져오기
        $('#boardContent').val(boardContent); // textarea에 내용 설정

        // 필수 입력 값 검증
        var boardTypeNo = $('#boardTypeNo').val();
        var boardDept = $('#boardDept').val();
        var boardTitle = $('#boardTitle').val();

        if (!boardTypeNo) {
            alert("게시판을 선택해주세요.");
            return false; // 폼 제출 방지
        }

        if (!boardDept) {
            alert("부서를 선택해주세요.");
            return false; // 폼 제출 방지
        }

        if (!boardTitle) {
            alert("제목을 입력해주세요.");
            return false; // 폼 제출 방지
        }

        if (!boardContent || !boardContent.trim()) {
            alert("본문 내용을 입력해주세요.");
            return false; // 폼 제출 방지
        }

        return true; // 모든 검증 통과 시 폼 제출
    });

    // .origin_attach_del 요소에 클릭 이벤트
    $(".origin_attach_del").on("click", function () {
        let hiddenEl = "<input type='hidden' name='delFileNo' value='" + $(this).data("fileno") + "'>";
        $("#modifyform").append(hiddenEl);
        $(this).parent().remove();
    });

    $(".origin_attach_del").on("mouseenter", function () {
        $(this).css("cursor", "pointer");
    });

    $(".origin_attach_del").on("mouseleave", function () {
        $(this).css("cursor", "default");
    });
});
</script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
