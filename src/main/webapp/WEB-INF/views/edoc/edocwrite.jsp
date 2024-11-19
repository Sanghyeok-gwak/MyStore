<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 네이버 스마트에디터 -->
<script type="text/javascript"
	src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- jQuery 라이브러리 (한 번만 포함) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Font Awesome 아이콘 라이브러리 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- jsTree 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />


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
	margin-left: 20px;
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

#aprr1_content2 {
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
input[type=file]::file-selector-button {
	background-color: #99A1EF;
	color: white;
	border: none;
	width: 113.5px;
	height: 47.5px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
}
/* middiv2 스타일 end */
#smarteditor {
	margin-top: 10px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />

	<div class="body-body">
		<div class="text-box">
			<form action="${contextPath}/edoc/edocinsert.do" method="post"
				onsubmit="updateEditorContent()">
				<div id="topdiv">
					<div class="bbox-box" style="width: 50%;">
						<span class="ffont1" style="font-weight: bold;">전자문서 작성하기</span> <select
							name="languages" id="lang" onchange="loadSampleFormat()">
							<option value="">결재양식 선택</option>
							<c:forEach var="form" items="${list}">
								<option value="${form.sampleNo}">${form.sampleDotCode}</option>
							</c:forEach>
						</select>

						<button type="button" id="modal_appr" data-bs-toggle="modal"
							data-bs-target="#basicModal">결제선 선택</button>
					</div>

					<div id="enddiv" style="width: 50%;">
						<div class="btn-box-hover">
							<button type="submit" class="btn3-hover"
								style="width: 120px; font-size: 18px;">기안하기</button>
						</div>
						<div class="btn-box-hover">
							<button class="btn1-hover"
								style="width: 120px; margin-left: 20px; font-size: 18px;"
								onclick="history.go(-1);">뒤로가기</button>
						</div>
					</div>
				</div>

				<hr>

				<style>
.middiv-box, .middiv-box-left, .middiv-box-right {
	display: flex;
}

.middiv-box {
	margin-top: 20px;
	margin-bottom: 20px;
	justify-content: space-between;
	width: 100%;
}

.middiv-box-right-writer-left table {
	height: 100%;
}

.middiv-box-right-writer-right table {
	height: 100%;
}

.middiv-box-right-writer-left {
	margin-right: 15px;
}

.middiv-box-right-writer-right {
	margin-left: 15px;
}

#writer_content {
	border: 1px solid lightgray;
}
</style>


				<div id="middiv">
					<div class="middiv-box">

						<div class="middiv-box-left">
							<div class="middiv-box-left-writer-left">
								<div id="writer" style="margin-bottom: 10px;">기안자</div>
								<div id="writer" style="margin-bottom: 10px;">부서</div>
								<div id="writer" style="margin-bottom: 10px;">기안일</div>
							</div>
							<div class="middiv-box-left-writer-right">
								<div id="writer_content" style="margin-bottom: 10px;">${loginUser.empName}</div>
								<div id="writer_content" style="margin-bottom: 10px;">${loginUser.deptCode}</div>
								<div id="writer_content" style="margin-bottom: 10px;">${ currentDate }</div>
							</div>
						</div>

						<div class="middiv-box-right">
							<div class="middiv-box-right-writer-left">
								<table>
									<tr>
										<td id="aprr1" rowspan="5"><div
												style="width: 100%; height: 100%; align-items: center; justify-content: center; display: flex;">1차</div></td>
										<td id="aprr1_content"><div
												style="width: 100%; height: 100%; align-items: center; justify-content: center; display: flex; border: 1px solid lightgray;">직급</div></td>
									</tr>
									<tr>
										<td id="aprr1_content2" rowspan="3"><div
												style="width: 100%; height: 100%; align-items: center; justify-content: center; display: flex; border: 1px solid lightgray;">결재자</div></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td id="aprr1_content"><div
												style="width: 100%; height: 100%; align-items: center; justify-content: center; display: flex; border: 1px solid lightgray;">부서명</div></td>
									</tr>
								</table>
							</div>
							<div class="middiv-box-right-writer-right">
								<table>
									<tr>
										<td id="aprr1" rowspan="5"><div
												style="width: 100%; height: 100%; align-items: center; justify-content: center; display: flex;">2차</div></td>
										<td id="aprr1_content"><div
												style="width: 100%; height: 100%; align-items: center; justify-content: center; display: flex; border: 1px solid lightgray;">직급</div></td>
									</tr>
									<tr>
										<td id="aprr1_content2" rowspan="3"><div
												style="width: 100%; height: 100%; align-items: center; justify-content: center; display: flex; border: 1px solid lightgray;">결재자</div></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td id="aprr1_content"><div
												style="width: 100%; height: 100%; border: 1px solid lightgray;">부서명</div></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<hr>


				<!-- 제목 -->
				<div id="middiv2">
					<div id="form_title">제목</div>
					<div class="input-bar" style="width: 100%; padding-left: 10px;">
						<input type="text" name="title" class="input-bar1">
					</div>
				</div>

				<!-- 스마트에디터 -->
				<div id="smarteditor">
					<textarea name="editorTxt" id="editorTxt0" rows="13"
						style="width: 100%;"></textarea>
				</div>

				<!-- 파일업로드 -->
				<div id="middiv3">
					<input type="file" id="fileupload" name="uploadFile" multiple><br>
				</div>
			</form>
		</div>
	</div>

	<script>
		// 문서가 준비된 후 스마트에디터 초기화 

		$(document).ready(function() {
			smartEditor();
		});

		let oEditors = []; // 스마트에디터 초기화 

		function smartEditor() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "editorTxt0",
				// textarea에 부여한 아이디와 동일해야 한다. 
				sSkinURI : "${contextPath}/smarteditor/SmartEditor2Skin.html",
				// 자신의 프로젝트에 맞게 경로 수정 
				htParams : {
					// 입력창 크기 조절바 사용여부 (true: 사용, false: 미사용) 
					bUseVerticalResizer : false,
				},
				fCreator : "createSEditor2"
			});
		}

		// 양식 선택 시 자동으로 스마트에디터에 반영 
		function loadSampleFormat() {
			var sampleNo = $('#lang').val();
			if (sampleNo) {
				$.ajax({
					url : '${contextPath}/edoc/getSampleFormat', // 해당 URL로 API 요청 
					data : {
						sampleNo : sampleNo
					},
					method : 'GET',
					success : function(response) {
						// 응답이 올바르게 전달되었는지 콘솔에서 확인 
						console.log("응답 데이터:", response);

						// oEditors[0]이 초기화되었을 때만 실행 
						if (oEditors.length > 0 && oEditors[0]) {
							// 스마트에디터 내용을 초기화 
							oEditors[0].exec("SET_CONTENTS", [ "" ]);
							// 응답이 HTML 형식이라면 바로 반영 
							oEditors[0].exec("PASTE_HTML", [ response ]);
						} else {
							console.error("스마트에디터가 초기화되지 않았습니다.");
						}
					},
					error : function() {
						alert("양식 정보를 불러오는 데 실패했습니다.");
					}
				});
			}
		}

		// 폼 제출 시 에디터 내용 업데이트 
		function updateEditorContent() {
			if (oEditors.length > 0 && oEditors[0]) {
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
			}
		}
	</script>

	<script>
	$(document).ready(function() {
	    var maxSelected = 2; // 최대 선택 가능한 결재자 수
	    var selectedCount = 0; // 현재 선택된 결재자 수

	    // Ajax로 서버에서 직원 데이터 가져오기
	    $.ajax({
	        url: '${contextPath}/edoc/approvalTree', // 서버에서 직원 데이터 가져오기
	        method: 'GET',
	        dataType: 'json',
	        success: function(employees) {
	            // jstree에 사용할 트리 데이터 변환
	            var treeData = employees.map(function(emp) {
	                return {
	                    "id": emp.empNo, // 직원 번호
	                    "parent": "#", // 최상위 노드로 설정
	                    "text": emp.empName + " (" + emp.empRank + ")", // 직원 이름과 직급
	                    "icon": emp.empProfile, // 직원 프로필 이미지 URL
	                    "state": {
	                        "checkbox": true // 체크박스를 활성화
	                    }
	                };
	            });

	            // jsTree 초기화
	            $('#approvalTree').jstree({
	                'core': {
	                    'data': treeData
	                },
	                'plugins': ['checkbox'] // 체크박스 플러그인 활성화
	            })
	            .on('changed.jstree', function(e, data) {
	                // 체크된 노드들 가져오기
	                var selectedNodes = data.selected;

	                // 결재자 수가 최대인 경우
	                if (selectedNodes.length > maxSelected) {
	                    alert("최대 " + maxSelected + "명까지만 선택할 수 있습니다.");

	                    // 마지막 선택된 항목 취소
	                    var lastSelectedNodeId = selectedNodes[selectedNodes.length - 1];
	                    data.instance.deselect_node(lastSelectedNodeId); // 마지막 선택 취소

	                    return false; // 더 이상 선택되지 않도록
	                }

	                // 선택된 노드에 해당하는 직원 목록 업데이트
	                $('#selectedList').empty(); // 기존 목록 비우기
	                selectedCount = selectedNodes.length; // 현재 선택된 결재자 수 갱신
	                selectedNodes.forEach(function(nodeId) {
	                    var node = data.instance.get_node(nodeId);
	                    $('#selectedList').append('<li class="list-group-item">' + node.text + '</li>');
	                });
	            });
	        },
	        error: function() {
	            alert("직원 데이터를 가져오는 데 실패했습니다.");
	        }
	    });
	});
	</script>

	<!-- 모달 시작 -->
	<div class="modal fade" id="basicModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 800px; height: 600px;">
				<div class="modal-header">
					<h5 class="modal-title">결재선 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex">
					<!-- 결재선 트리 표시 영역 -->
					<div id="approvalTree"
						style="max-height: 500px; overflow-y: auto; width: 50%;"></div>

					<!-- 선택된 결재자 표시 영역 -->
					<div id="selectedApprovers" style="width: 50%; padding-left: 20px;">
						<h6>선택된 결재자</h6>
						<ul id="selectedList" class="list-group"></ul>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>





















