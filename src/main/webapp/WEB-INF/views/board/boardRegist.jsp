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
<script type="text/javascript" src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

					<div>
						<select class="datatable-selector" id="custom-select" name="condition"
							style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px; height: 38px; width: 218px; margin-top: 30px;">
							<option value="" disabled selected style="display: none;">게시판을 선택해주세요</option>
							<option value="A">공지사항 게시판</option>
							<option value="B">자유 게시판</option>
							<option value="C">익명게시판</option>
						</select> 
						
						<select class="datatable-selector" id="custom-select1" name="condition1"
							style="margin-right: 5px; border: 1px solid rgb(112, 112, 112); border-radius: 3px; height: 38px; width: 217px; margin-top: 30px;" disabled>
							<option value="" disabled selected style="display: none;">구분을 선택해주세요</option>
							<option value="전체">전체</option>
							<option value="인사">인사</option>
							<option value="총무">총무</option>
							<option value="영업">영업</option>
						</select>
					</div>

					<script>
						// 첫 번째 드롭다운의 값이 변경될 때
						document.getElementById('custom-select').addEventListener('change', function() {
							var secondSelect = document.getElementById('custom-select1');
							var importantCheckbox = document.getElementById('important');
							var importantLabel = document.querySelector('label[for="important"]');

							// 첫 번째 드롭다운에서 값이 선택되면 두 번째 드롭다운을 활성화
							if (this.value) {
								secondSelect.disabled = false; // 두 번째 드롭다운 활성화
							} else {
								secondSelect.disabled = true;  // 두 번째 드롭다운 비활성화
							}
							
							// "공지사항 게시판"을 선택하면 중요공지 체크박스와 라벨을 보이게 하고, 그 외에는 숨김
							if (this.value === "A") {
								importantCheckbox.style.display = 'inline'; // 중요공지 체크박스 보이기
								importantLabel.style.display = 'inline'; // 중요공지 라벨 보이기
							} else {
								importantCheckbox.style.display = 'none'; // 중요공지 체크박스 숨기기
								importantLabel.style.display = 'none'; // 중요공지 라벨 숨기기
							}
						});
					</script>

					<div class="input-bar" style="display: flex; align-items: center; margin-right: 10px; margin-top: 20px;">
						<input type="text" class="input-bar1" placeholder="제목을 입력하세요"
							style="height: 38px; padding: 5px; width: 444px;" />
					</div>

					<div class="d-flex" style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
						<div>
							<input type="file" class="form-control-file border" id="upfile"
								name="uploadFiles" multiple style="width: 444px;">
						</div>

						<div class="btn-box-hover" style="display: flex; align-items: center; justify-content: center; gap: 10px;">
							<label for="important" style="margin-right: 5px; font-size: 14px; display: none;">중요공지</label> 
							<input type="checkbox" id="important" name="important" style="width: 20px; height: 20px; margin-right: 20px; display: none;">
							<button class="btn3-hover" style="height: 40px; padding: 5px 15px;">글 등록</button>
						</div>
					</div>

					<form action="insertStudentInfoForm" method="post">
						<div id="smarteditor" style="margin-top: 30px;">
							<textarea name="editorTxt" id="editorTxt0" rows="20" cols="10" style="margin-top: 30px; width: 100%; height: 420px;"></textarea>
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
				oAppRef: oEditors,
				elPlaceHolder: "editorTxt0", //textarea에 부여한 아이디와 동일해야한다.
				sSkinURI: "${contextPath}/smarteditor/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수정
				htParams: {
					bUseVerticalResizer: false,  // 입력창 크기 조절바 사용여부 (true: 사용, false: 미사용)
				},
				fCreator: "createSEditor2"
			});
		}
		
		$(document).ready(function() {
			//스마트에디터 적용
			smartEditor(); 
		});
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
