<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<b>게시글 등록</b>
					</div>

					<form id="insertform" action="insert.do" method="post" enctype="multipart/form-data">
						

							<!-- 게시판 유형 선택 (동적으로 데이터 사용) -->
						<select class="datatable-selector" id="boardTypeNo"
						    name="boardTypeNo"
						    style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px; height: 38px; width: 218px; margin-top: 30px;">
						    <option value="" disabled selected style="display: none;" >게시판을 선택해주세요</option>
						    <c:forEach var="boardName" items="${boardTypeList}" >
						        <option value="${boardName.boardtName}">${b.boardName}</option>
						    </c:forEach>
						</select>
						
						<!-- 부서명 선택 (동적으로 데이터 사용) -->
						<select class="datatable-selector" id="boardDept"
						    name="boardDept"
						    style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px; height: 38px; width: 217px; margin-top: 30px;" disabled>
						    <option value="" disabled selected style="display: none;">구분을 선택해주세요</option>
						    <c:forEach var="dept" items="${deptList}">
						        <option id="deptName"value="${dept.deptName}">${b.deptName}</option>
						    </c:forEach>
						</select>
						

						<script>
							// 첫 번째 드롭다운의 값이 변경될 때
							document.getElementById('boardTypeNo').addEventListener('change', function() {
								var secondSelect = document.getElementById('boardDept');
								var importantSection = document.getElementById('important-section');  // 'important-section'으로 수정
								var importantCheckbox = document.getElementById('boardCheck');
								var importantLabel = document.querySelector('label[for="boardCheck"]');
					
								// 첫 번째 드롭다운에서 값이 선택되면 두 번째 드롭다운을 활성화
								if (this.value) {
									secondSelect.disabled = false; // 두 번째 드롭다운 활성화
								} else {
									secondSelect.disabled = true; // 두 번째 드롭다운 비활성화
								}
					
								// "공지사항" 게시판을 선택하면 중요공지 체크박스와 라벨을 보이게
								if (this.value === "공지사항") { // 공지사항을 선택했을 때
									importantSection.style.display = 'block'; // 중요공지 체크박스와 라벨 보이기
								} else {
									importantSection.style.display = 'none'; // 공지사항이 아닐 경우 숨기기
								}
							});

							// 중요공지 체크박스 상태 변경 시 값 설정
						    document.getElementById('boardCheck').addEventListener('change', function() {
						        // 체크된 상태이면 'Y'로 설정, 체크 해제 상태이면 'N'으로 설정
						        document.getElementById('importantCheckValue').value = this.checked ? 'Y' : 'N';
						    });
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
							</div>
							
						<!-- 중요공지 체크박스와 라벨 (기본적으로 숨김) -->

							<div class="btn-box-hover"
										style="display: flex; align-items: center; justify-content: center; gap: 10px;">
												<div id="important-section" style="display: none; margin-top: 10px; text-align: center;">
							    <label for="boardCheck" style="font-size: 14px;">중요공지</label>
							    <input type="checkbox" id="boardCheck" name="boardCheck" style="width: 20px; height: 20px; margin-right: 20px;">
							</div>
								<button type="submit" class="btn3-hover"
									style="height: 40px; padding: 5px 15px;">글 등록</button>
							</div>
						</div>

						<div id="smarteditor" style="margin-top: 30px;">
							<textarea name="boardContent" id="boardContent" rows="20" cols="10"
								style="margin-top: 30px; width: 100%; height: 420px;" >${ b.boardContent }</textarea>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<script>
		let oEditors = [];
		smartEditor = function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "boardContent", //textarea에 부여한 아이디와 동일해야한다.
				sSkinURI : "${contextPath}/smarteditor/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수정
				htParams : {
					bUseVerticalResizer : false, // 입력창 크기 조절바 사용여부 (true: 사용, false: 미사용)
				},
				fCreator : "createSEditor2"
			});
		}

		// 스마트에디터 내용 반영
		$(document).ready(function() {
		    // 폼 제출 전에 입력값 검증
	        $('#insertform').submit(function(event) {
	            // 폼 필드 값 가져오기
	            var boardTypeNo = $('#boardTypeNo').val();
	            var boardDept = $('#boardDept').val();
	            var boardTitle = $('#boardTitle').val();

	            // 스마트에디터 내용 가져오기
	            var boardContent = oEditors.getById["boardContent"].getIR(); // 스마트에디터의 내용

	            // 본문 내용을 textarea에 반영
	            $('#boardContent').val(boardContent); // textarea에 스마트에디터 내용 설정

	            // 게시판 유형, 부서명, 제목, 본문 내용 체크
	            if (!boardTypeNo) {
	                alert("게시판을 선택해주세요.");
	                return false;  // 폼 제출 방지
	            }

	            if (!boardDept) {
	                alert("부서를 선택해주세요.");
	                return false;  // 폼 제출 방지
	            }

	            if (!boardTitle) {
	                alert("제목을 입력해주세요.");
	                return false;  // 폼 제출 방지
	            }

	            if (!boardContent || !boardContent.trim()) {
	                alert("본문 내용을 입력해주세요.");
	                return false;  // 폼 제출 방지
	            }

	            return true;  // 모든 조건을 만족하면 폼 제출
	        });
		    
		    
		    smartEditor();
		    
		    // 폼 제출 전에 smartEditor 내용이 textarea에 반영되도록 설정
		    $('#insertform').submit(function() {
		        var content = oEditors.getById["boardContent"].getIR(); // 스마트에디터의 내용 가져오기
		        $('#boardContent').val(content); // textarea에 내용 설정
		    });
		});

	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
