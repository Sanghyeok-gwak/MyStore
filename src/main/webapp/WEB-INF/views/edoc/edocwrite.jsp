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
<script type="text/javascript" src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- jQuery 라이브러리 (한 번만 포함) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Font Awesome 아이콘 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- jsTree 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />


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
	<!-- 여기 채워서 작업하시면 됩니다 .-->
		<div class="text-box">
			<form action="">
				<div id="topdiv">
					<div class="bbox-box" style="width:50%;">
						<span class="ffont1" style="font-weight: bold;">전자문서 작성하기</span> 
						<select name="languages" id="lang">
							<option value="select">결제양식 선택</option>
							<option value="vac">휴가</option>
							<option value="dept">부서</option>
							<option value="java">일반</option>
						</select>
						<button type="button" id="modal_appr" data-bs-toggle="modal"
							data-bs-target="#basicModal">결제선 선택</button>

					</div>		
					<div id="enddiv" style="width:50%;">
						<div class="btn-box-hover">
							<button class="btn3-hover" style="width: 120px; font-size: 18px;">기안하기</button>
						</div>
						<div class="btn-box-hover">
							<button class="btn1-hover"
								style="width: 120px; margin-left: 20px; font-size: 18px;">뒤로가기</button>
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
			<div id="smarteditor">
				<textarea name="editorTxt" id="editorTxt0" rows="13"
					style="width: 100%;"></textarea>
			</div>
			<!-- smarteditor end-->

			<!-- 파일업로드 start-->
					<div id="middiv3">
						<input type="file" id="fileupload" name="uploadFile" multiple>
						<br>
					</div>
			<!--파일업로드 end-->
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
				sSkinURI : "${contextPath}/smarteditor/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수정
				htParams : {
					// 입력창 크키 조절바 사용여부 (true: 사용, false: 미사용)
					bUseVerticalResizer : false,
				},
				fCreator : "createSEditor2"
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

	<script>
		$(function() {
			// jsTree 초기화
			$("#approvalTree").jstree({
				core : {
					data : [ {
						"id" : "1",
						"parent" : "#",
						"text" : "본부",
						"state" : {
							"disabled" : true
						},
						"icon" : "fa fa-building"
					}, {
						"id" : "2",
						"parent" : "1",
						"text" : "부서 A",
						"state" : {
							"disabled" : true
						},
						"icon" : "fa fa-briefcase"
					}, {
						"id" : "3",
						"parent" : "1",
						"text" : "부서 B",
						"state" : {
							"disabled" : true
						},
						"icon" : "fa fa-briefcase"
					}, {
						"id" : "4",
						"parent" : "2",
						"text" : "결재자 1",
						"icon" : "fa fa-user"
					}, {
						"id" : "5",
						"parent" : "2",
						"text" : "결재자 2",
						"icon" : "fa fa-user"
					}, {
						"id" : "6",
						"parent" : "2",
						"text" : "결재자 3",
						"icon" : "fa fa-user"
					}, {
						"id" : "7",
						"parent" : "3",
						"text" : "결재자 4",
						"icon" : "fa fa-user"
					}, {
						"id" : "8",
						"parent" : "3",
						"text" : "결재자 5",
						"icon" : "fa fa-user"
					}, {
						"id" : "9",
						"parent" : "3",
						"text" : "결재자 6",
						"icon" : "fa fa-user"
					} ]
				},
				"plugins" : [ "checkbox", "contextmenu", "dnd" ],
				"checkbox" : {
					"three_state" : false, // 부모/자식 자동 체크 해제
					"keep_selected_style" : false, // 선택된 노드의 스타일을 기본값으로 유지

				}
			});

			$('#approvalTree').on(
					"changed.jstree",
					function(e, data) {
						let selectedNodes = data.selected;
						let $selectedList = $('#selectedList');

						// 선택된 결재자 목록 초기화
						$selectedList.empty();

						// 선택된 결재자가 두 명을 초과하는 경우 알림 및 추가 선택 해제
						if (selectedNodes.length > 2) {
							alert("결재자는 두명이 최대입니다");
							$('#approvalTree').jstree("deselect_node",
									data.node.id); // 마지막 선택된 노드를 해제
							return; // 추가 처리를 중지
						}

						// 선택된 결재자를 표시 영역에 추가
						selectedNodes.forEach(function(nodeId) {
							let node = $('#approvalTree').jstree(true)
									.get_node(nodeId);
							if (node) {
								// 결재자의 부모 노드(부서) 가져오기
								let parentNode = $('#approvalTree')
										.jstree(true).get_node(node.parent);
								let approverInfo = node.text;

								// 부서 정보가 있는 경우 부서명도 함께 표시
								if (parentNode && parentNode.text) {
									approverInfo += " (" + parentNode.text
											+ ")";
								}

								$selectedList
										.append('<li class="list-group-item">'
												+ approverInfo + '</li>');
							}
						});

						console.log("선택된 결재선:", selectedNodes);
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