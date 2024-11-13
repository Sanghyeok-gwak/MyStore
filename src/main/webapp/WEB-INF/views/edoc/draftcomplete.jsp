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
/**/
/* body에들어가는 양식입니다. 원페이지 이신분들은 이거 사용하신됩니다. */
.text-box {
	border-radius: 20px;
	height: 100%;
	width: 100%;
	background-color: white;
	padding: 30px;
}

.ffont1 {
	font-size: 25px;
	line-height: 30px;
	font-weight: 400;
}

.ffont2 {
	font-size: 22px;
	line-height: 30px;
	font-weight: 400;
}

.ffont3 {
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
}
/* 영역 나누려고 한거라 이건 참고안하셔도됩니다. */
.text-box1 {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

/* 일반 버튼 색상 알잘딱갈센으로 골라서 사용하시면됩니다 (*이것또한 넓이높이만 수정해서 사용하세요) */
.btn-box button {
	margin-right: 10px;
	border-radius: 5px;
	width: 120px;
	height: 30px;
	border: 0px;
}

.btn1 {
	background-color: rgb(248, 103, 103);
	color: white;
}

.btn2 {
	background-color: rgb(179, 179, 179);
	color: white;
}

.btn3 {
	background-color: rgb(72, 72, 234);
	color: white;
}
/* 버튼 호버 스타일*/
.btn-box-hover button {
	margin-right: 10px;
	border-radius: 5px;
	width: 100px;
	height: 30px;
	border: 0px;
	transition-property: background-color;
	transition-duration: 0.5s;
}

.btn1-hover {
	background-color: rgb(248, 103, 103);
	color: white;
}

.btn2-hover {
	background-color: rgb(179, 179, 179);
	color: white;
}

.btn3-hover {
	background-color: rgb(72, 72, 234);
	color: white;
}

.btn1-hover:hover {
	background-color: rgb(196, 55, 55);
	color: white;
}

.btn2-hover:hover {
	background-color: rgb(116, 116, 116);
	color: white;
}

.btn3-hover:hover {
	background-color: rgb(23, 23, 128);
	color: white;
}

/* 넓이 높이만 수정해서 사용하세요 인풋 스타일*/
input {
	border: 1px solid gray;
	border-radius: 2px;
	height: 40px;
	width: 100%;
	border-radius: 5px;
	font-size: 18px;
	box-sizing: border-box;
}

/* topdiv 스타일 start */
#topdiv {
	display: flex;
}

#topdiv>#menu_name {
	font-size: 25px;
	line-height: 30px;
	font-weight: 400;
}

#lang {
	margin-left: 60px;
	width: 300px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	border-radius: 5px;
}

#modal_appr {
	margin-left: 20px;
	width: 150px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	background-color: rgb(179, 179, 179);
	color: white;
	border: 0px;
	border-radius: 5px;
	transition-property: background-color;
	transition-duration: 0.5s;
}

#modal_appr:hover {
	background-color: rgb(116, 116, 116);
	color: white;
}
/* topdiv 스타일 end */

/* middiv 스타일 start */
#middiv {
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	display: flex;
}

#writer {
	background-color: #99A1EF;
	color: white;
	height: 40px;
	width: 140px;
	text-align: center;
	border-radius: 5px;
}

#writer_content {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	height: 40px;
	width: 200px;
	text-align: center;
	border-radius: 5px;
}
#aprr1 {
	background-color: #99A1EF;
	color: white;
	height: 120px;
	width: 60px;
	text-align: center;
	border-radius: 5px;
}

#aprr1_content {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	height: 20px;
	width: 120px;
	text-align: center;
	border-radius: 5px;
}

#aprr1_content2  {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	height: 80px;
	width: 120px;
	text-align: center;
	border-radius: 5px;
}

.container {
	display: flex;
	gap: 30px; /* 요소 간 간격 */
	justify-content: flex-end;
	align-items: flex-end
}

.spacer {
	margin-left: auto; /* 왼쪽 여백을 최대화하여 오른쪽으로 밀기 */
}
/* middiv 스타일 end */

/* middiv2 스타일 start */
#middiv2 {
	display: flex;
}

#form_title {
	background-color: #99A1EF;
	color: white;
	height: 40px;
	width: 140px;
	border-radius: 5px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	display: flex;
	justify-content: center;
	align-items: center;
}

#inputf {
	display: flex;
}
/* middiv2 스타일 end */

/* filedownload 스타일 start */
#filedownload {
	display: flex;
}

#file {
	background-color: #99A1EF;
	color: white;
	height: 40px;
	width: 113.75px;
	border-radius: 5px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	display: flex;
	justify-content: center;
	align-items: center;
}

#download {
	font-size: 18px;
	margin-left: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	line-height: 30px;
	font-weight: 400;
}
/* filedownload 스타일 end */

/* enddiv 스타일 start */
#enddiv {
	display: flex;
	justify-content: end;
}
/* enddiv 스타일 end */
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	<div class="body-body">
	<!-- 여기 채워서 작업하시면 됩니다 .-->
		<div class="text-box">
			<form action="">
				<div id="topdiv">
					<span class="ffont1" style="width:20%; font-weight: bold;">기안 완료 문서</span>
					<div id="lang" style="width:60%;">양식유형</div>
					<div id="enddiv" style="width:20%;">
						<div class="btn-box-hover">
							<button class="btn3-hover" style="width: 120px; font-size: 18px;">뒤로가기</button>
						</div>
					</div>
				</div>
				<hr>
				<div id="middiv">
				<style>
					.middiv-box,.middiv-box-left,.middiv-box-right{
						display:flex;
					}
					.middiv-box{
						margin-top:20px;
						margin-bottom:20px;
						justify-content: space-between;
						width:100%;
					}
					.middiv-box-right-writer-left table{
						height:100%;
					}
					.middiv-box-right-writer-right table{
						height:100%;
					}
					.middiv-box-right-writer-left{
						margin-right:15px;
					}
					.middiv-box-right-writer-right{
						margin-left:15px;
					}
					#writer_content{
						border: 1px solid lightgray;
					}
				</style>
					<div class="middiv-box">
						<div class="middiv-box-left">
							<div class="middiv-box-left-writer-left">
								<div id="writer" style="margin-bottom:10px;">기안자</div>
								<div id="writer" style="margin-bottom:10px;">부서</div>
								<div id="writer" style="margin-bottom:10px;">기안일</div>
							</div>
							<div class="middiv-box-left-writer-right">
								<div id="writer_content" style="margin-bottom:10px;">기안자이름</div>
								<div id="writer_content" style="margin-bottom:10px;">부서명</div>
								<div id="writer_content" style="margin-bottom:10px;">YYYY-MM-DD</div>
							</div>
						</div>
						<div class="middiv-box-right">
							<div class="middiv-box-right-writer-left">
								<table>
										<tr>
											<td id="aprr1" rowspan="5"><div style="width:100%; height:100%;align-items: center; justify-content: center; display: flex;">1차</div></td>
											<td id="aprr1_content"><div style="width:100%; height:100%;align-items: center; justify-content: center; display: flex; border:1px solid lightgray;">직급</div></td>
										</tr>
										<tr>
											<td id="aprr1_content2" rowspan="3"><div style="width:100%; height:100%;align-items: center; justify-content: center; display: flex; border:1px solid lightgray;">결재자</div></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td id="aprr1_content"><div style="width:100%; height:100%;align-items: center; justify-content: center; display: flex; border:1px solid lightgray;">부서명</div></td>
										</tr>
									</table>
							</div>
							<div class="middiv-box-right-writer-right">
								<table>
									<tr>
										<td id="aprr1" rowspan="5"><div style="width:100%; height:100%;align-items: center; justify-content: center; display: flex; ">2차</div></td>
										<td id="aprr1_content"><div style="width:100%; height:100%;align-items: center; justify-content: center; display: flex; border:1px solid lightgray;" >직급</div></td>
									</tr>
									<tr>
										<td id="aprr1_content2" rowspan="3"><div style="width:100%; height:100%;align-items: center; justify-content: center; display: flex; border:1px solid lightgray;">결재자</div></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td id="aprr1_content"><div style="width:100%; height:100%; border:1px solid lightgray;">부서명</div></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<hr>
			</form>
			<!-- 중간2 start -->
			<div id="middiv2">
				<div id="form_title">제목</div>

				<div class="input-bar" style="width: 100%; padding-left: 10px;">
					<input type="text" class="input-bar1" readonly>
				</div>
			</div>
			<!-- 중간2 end -->

			<!-- smarteditor start-->
			<div id="smarteditor" style="margin-top: 10px;">
				<textarea name="editorTxt" id="editorTxt0" rows="15"
					style="width: 100%"></textarea>
			</div>
			<!-- smarteditor end-->

			<!-- 파일다운로드 start-->
			<div id="filedownload">
				<div id="file">첨부파일</div>
				<div id="download">
					<c:forEach var="at" items="${ b.attachList }">
						<a href="${ contextPath }${ at.filePath }/${ at.filesystemName }"
							download="${ at.originalName }">${ at.originalName }</a>
						<br>
					</c:forEach>
				</div>
			</div>
			<!--파일다운로드 end-->

			<!-- 끝 start-->
		
			<!-- 끝 end-->
		</div>      
	</div>

	<script>
		let oEditors = [];

		smartEditor = function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "editorTxt0", //textarea에 부여한 아이디와 동일해야한다.
				sSkinURI : "/smarteditor/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수정
				htParams : {
					// 툴바 사용여부 (true: 사용, false: 미사용)
					bUseToolbar : false,
					// 입력창 크키 조절바 사용여부 (true: 사용, false: 미사용)
					bUseVerticalResizer : false,
					// 모드 탭(Editor | HTML | TEXT) 사용여부 (true: 사용, false: 미사용)
					bUseModeChanger : false
				},
				fCreator : "createSEditor2",
				fOnAppLoad : function() {
					// 에디터 로드가 완료된 후 readonly 모드로 설정
					oEditors.getById["editorTxt0"].exec("DISABLE_WYSIWYG", []); // 에디터 비활성화 (만약 에디터쪽에 양식서가 보여져야하는데 안보여지거나 보여줘도 스크롤바를 못내릴시 삭제예정)
				}
			})
		}

		$(document)
				.ready(
						function() {
							//스마트에디터 적용
							smartEditor();
							//값 불러오기
							function preview() {
								// 에디터의 내용을 textarea에 적용
								oEditors.getById["editorTxt0"].exec(
										"UPDATE_CONTENTS_FIELD", []);
								// textarea 값 불러오기 
								var content = document
										.getElementById("editorTxt0").value;
								alert(content);
								return;
							}

						})
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>