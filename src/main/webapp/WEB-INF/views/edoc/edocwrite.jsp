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
	justify-content: space-between;
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

.containe11 {
	display: flex;
	gap: 30px; /* 요소 간 간격 */
	justify-content: flex-end;
	align-items: flex-end;
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

@media ( min-width : 1400px) {
	.container, .container-lg, .container-md, .container-sm, .container-xl,
		.container-xxl {
		max-width: 100%;
	}
	#aprr1_content {
		background-color: #ffffff;
		color: rgb(0, 0, 0);
		height: 20px;
		width: 150px;
		text-align: center;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		border-left: 1px solid lightgray;
		border-right: 1px solid lightgray;
		border-radius: 5px;
		border-right: 1px solid lightgray;
	}
	#aprr1_content2 {
		background-color: #ffffff;
		color: rgb(0, 0, 0);
		height: 80px;
		width: 150px;
		border-left: 1px solid lightgray;
		border-right: 1px solid lightgray;
		text-align: center;
		border-radius: 5px;
		border-right: 1px solid lightgray;
	}
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

}

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />

	<div class="body-body">
		<div class="text-box">
			<form action="${contextPath}/edoc/edocinsert.do" method="post" name="editorForm" enctype="multipart/form-data">
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
					
			    <!-- 기안자 이름: 로그인된 사용자의 이름 -->
			    <input type="hidden" name="draftName" id="draftName" value="${loginUser.empNo}">
			    <!-- 결재선 순서 정보: 결재자의 순서, 이름, 직급, 부서를 JSON 형식으로 저장 -->
			    <input type="hidden" name="approvalOrder" id="approvalOrder">
    

					<div id="enddiv" style="width: 50%;">
						<div class="btn-box-hover">
							<button type="submit"  id="submitBtn" class="btn3-hover"
								style="width: 120px; font-size: 18px;" onclick="submitForm()" >기안하기</button>
						</div>
						<div class="btn-box-hover">
							<button class="btn1-hover"
								style="width: 120px; margin-left: 20px; font-size: 18px;"
								onclick="history.go(-1);">뒤로가기</button>
						</div>
					</div>
				</div>

				<hr>

				<!-- 중간1 start-->
				<div id="middiv">

					<table>
						<tr>
							<td id="writer">부서</td>
							<td id="writer_content">${loginUser.deptCode}</td>
						</tr>
						<tr>
							<td id="writer">기안자</td>
							<td id="writer_content">${loginUser.empName}</td>
						</tr>
						<tr>
							<td id="writer">기안일</td>
							<td id="writer_content">${ currentDate }</td>
						</tr>
					</table>

					<div class="containe11">
						<!-- 1차 and 2차 Approval Tables here -->
					</div>

				</div>
				<!-- 중간1 end-->


				<hr>


				<!-- 제목 -->
				<div id="middiv2" style="width: 100%;">
					<div id="form_title">제목</div>
					<div class="input-bar" style="width: 100%;">
						<input type="text" id="title" name="title" class="input-bar1">
					</div>
				</div>

				<!-- 스마트에디터 -->
				<div id="smarteditor">
					<textarea name="editorTxt" id="editorTxt0" rows="13"
						style="width: 100%;"></textarea>
				</div>

				<!-- 파일업로드 -->
				<div id="middiv3">
					<input type="file" id="fileupload" name="uploadFiles"  class="file" multiple><br>
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
				elPlaceHolder : "editorTxt0", // 스마트에디터를 띄울 textarea의 id
				sSkinURI : "${contextPath}/smarteditor/SmartEditor2Skin.html", // 스마트에디터 skin 경로
				htParams : {
					bUseVerticalResizer : false, // 입력창 크기 조절바 사용여부
				},
				fCreator : "createSEditor2"
			});
		}

		// 양식 선택 시 자동으로 스마트에디터에 반영
		function loadSampleFormat() {
			var sampleNo = $('#lang').val();
			if (sampleNo) {
				$.ajax({
					url : '${contextPath}/edoc/getSampleFormat',
					data : {
						sampleNo : sampleNo
					},
					method : 'GET',
					success : function(response) {
						console.log("응답 데이터:", response);

						// 스마트에디터 내용 업데이트
						if (oEditors.length > 0 && oEditors[0]) {
							oEditors[0].exec("SET_CONTENTS", [ "" ]); // 기존 내용 비우기
							oEditors[0].exec("PASTE_HTML", [ response ]); // 새로운 내용 삽입
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

		// 폼 제출
		function submitForm() {
			// 스마트에디터 내용 가져오기
			if (oEditors.length > 0 && oEditors[0]) {
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []); // 스마트에디터 내용 업데이트
			}

			// 결재자 이름 수집
			var selectedNodes = $('#approvalTree').jstree('get_selected', true);
			if (selectedNodes.length === 0) {
				return;
			}

			// 결재자 정보 수집 (결재선 순서 포함)
		
			var approvalOrder = [];

			selectedNodes.slice(0, 2).reverse().forEach(function(node, index) { 
				approvalOrder.push( 
						(index + 1) + "-" + node.data.name + "-" + node.data.rank + "-" + node.data.dept + "-" + node.data.no 
						); 
				});

			// 숨겨진 필드에 데이터 설정
			$('#draftName').val('${loginUser.empNo}'); // 기안자 이름
			$('#approvalOrder').val(approvalOrder.join(';')); // 각 결재자 정보를 세미콜론으로 구분된 문자열로 저장

			// 제목 입력 확인
			if ($('#title').val().trim() === "") {
				return;
			}

			// 폼 제출
			document.forms["editorForm"].submit();
		}
	</script>

	<script>
	$(document).ready(function() {
	    var maxSelected = 2; // 최대 선택 가능한 결재자 수

	    // Ajax로 서버에서 직원 데이터 가져오기
	    $.ajax({
	        url: '${contextPath}/edoc/approvalTree',
	        method: 'GET',
	        dataType: 'json',
	        success: function(employees) {
	            // 직급 순으로 정렬
	            employees.sort(function(a, b) {
	                return a.CREATER - b.CREATER;
	            });

	            var treeData = employees.map(function(emp) {
	                return {
	                    "id": emp.empNo,
	                    "parent": emp.deptCode,
	                    "text": emp.empName + (emp.empRank ? " (" + emp.empRank + ")" : ""),
	                    "data": {
	                        "rank": emp.empRank,
	                        "name": emp.empName,
	                        "dept": emp.deptName,
	                        "no": emp.empNo
	                    },
	                    "icon": emp.empGender
	                };
	            });

	            $('#approvalTree').jstree({
	                'core': {
	                    'data': treeData,
	                    'check_callback': true // 노드 조작 허용
	                },
	                'plugins': ['checkbox'],
	                'checkbox': {
	                    'three_state': false,  // 부모가 선택되더라도 자식만 선택되도록
	                    'cascade': 'down'      // 부모를 선택할 때 자식만 선택
	                }
	            })
	            .on('select_node.jstree', function(e, data) {
	                // 부모 노드인지 확인
	                if (data.node.children.length > 0) {
	                    // 부모 노드일 경우 선택을 취소하고 하위 노드를 열기
	                    data.instance.deselect_node(data.node);
	                    data.instance.open_node(data.node);
	                }
	            })
	            .on('loaded.jstree', function() {
	                // 특정 레벨의 노드에서 체크박스를 제거
	                removeCheckboxesAtLevels([1, 2, 3]);

	                // 노드가 열렸을 때 체크박스를 제거
	                $('#approvalTree').on('open_node.jstree', function(e, data) {
	                    removeCheckboxesAtLevels([1, 2, 3]);
	                });
	            })
	            .on('changed.jstree', function(e, data) {
	                // 선택 가능한 최대 수를 초과할 경우 경고 및 선택 취소
	                if (data.selected.length > maxSelected) {
	                    alert("최대 " + maxSelected + "명까지만 선택할 수 있습니다.");
	                    var lastSelectedNodeId = data.selected[data.selected.length - 1];
	                    data.instance.deselect_node(lastSelectedNodeId);
	                    return false;
	                }

	                // 선택된 결재자를 표시 영역에 업데이트
	                $('#selectedList').empty();

	                var selectedApprovers = data.selected.map(function(nodeId) {
	                    return data.instance.get_node(nodeId);
	                }).reverse(); // 순서를 역으로 변경

	                selectedApprovers.slice(0, 2).forEach(function(node, index) {
	                    var approverNo = (index + 1) + '차';
	                    var listItem = '<li class="list-group-item">' + node.text + '</li>';

	                    // 첫 번째 결재자는 1차 결재자라는 표시를 추가
	                    if (index === 0) {
	                        listItem = '<li class="list-group-item list-group-item-primary">1차 결재자: ' + node.text + '</li>';
	                    }

	                    $('#selectedList').append(listItem);
	                });
	            });
	        },
	        error: function() {
	            alert("직원 데이터를 가져오는 데 실패했습니다.");
	        }
	    });

	    // 모달 완료 버튼 클릭 시
	    $('#basicModal .btn-primary').on('click', function() {
	        var selectedNodes = $('#approvalTree').jstree('get_selected', true);
	        if (selectedNodes.length === 0) {
	            alert("결재자를 선택하세요.");
	            return;
	        }

	        var tableContent = '';

	        // 선택된 결재자들을 반대로 정렬하여 가장 먼저 선택된 사람이 1차 결재자가 되도록 처리
	        selectedNodes.slice(0, 2).reverse().forEach(function(node, index) {
	            var approverNo = (index + 1) + '차';

	            tableContent += '<table>' +
	                            '<tr>' +
	                            '<td id="aprr1" rowspan="5">' + approverNo + '</td>' +
	                            '<td id="aprr1_content">' + node.data.rank + '</td>' +
	                            '</tr>' +
	                            '<tr>' +
	                            '<td id="aprr1_content2" rowspan="3">' + node.data.name + '</td>' +
	                            '</tr>' +
	                            '<tr>' +
	                            '<td></td>' +
	                            '</tr>' +
	                            '<tr>' +
	                            '<td></td>' +
	                            '</tr>' +    
	                            '<tr>' +
	                            '<td id="aprr1_content">' + node.data.dept + '</td>' +
	                            '</tr>' +
	                            '</table>';
	        });

	        $('.containe11').html(tableContent);
	        $('#basicModal').modal('hide');
	    });

	    function removeCheckboxesAtLevels(levels) {
	        levels.forEach(function(level) {
	            $('#approvalTree').find("[aria-level='" + level + "']").each(function() {
	                $(this).find('.jstree-checkbox').remove();
	            });
	        });
	    }
	});

	</script>
		
	<script>
	$(document).ready(function() {
	    // 결재양식, 결재선, 제목 입력 상태를 확인하는 함수
	    function checkFormValidity() {
	        var isFormValid = ($('#lang').val() !== "") && ($('#approvalTree').jstree('get_selected').length > 0) && ($('#title').val().trim() !== "");
	        $('#submitBtn').prop('disabled', !isFormValid); // 유효하지 않으면 비활성화
	    }

	    // 결재양식 선택 시
	    $('#lang').on('change', function() {
	        checkFormValidity();
	    });

	    // 결재선 선택 시
	    $('#approvalTree').on('changed.jstree', function() {
	        checkFormValidity();
	    });
	    
	    // 제목 입력 시
	    $('#title').on('input', function() {
	        checkFormValidity();
	    });

	    // 처음 페이지 로드 시 상태 확인
	    checkFormValidity();
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
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script src="${ contextPath }/resources/js/fileValidate.js"></script>

</body>
</html>




<!-- 
원리 설명

loaded.jstree 이벤트:
loaded.jstree 이벤트는 트리가 처음으로 완전히 로드될 때 발생합니다. 
이 이벤트를 이용해 트리가 처음 로드될 때 특정 레벨의 노드에서 체크박스를 제거합니다.

open_node.jstree 이벤트:
open_node.jstree 이벤트는 노드가 열릴 때마다 발생합니다. 
사용자가 트리의 노드를 열 때마다 해당 노드와 그 하위 노드들에 대해 다시 체크박스를 제거합니다.

removeCheckboxesAtLevels 함수:
이 함수는 인자로 받은 레벨(들)에 대해 트리 내 해당 레벨의 모든 노드를 찾아내고, 각 노드의 체크박스를 제거합니다. 
이를 위해 jQuery의 find 메서드를 사용하여 aria-level 속성이 일치하는 노드를 선택하고, 
find('.jstree-checkbox').remove()를 통해 체크박스를 제거합니다.



작동 과정

트리가 처음 로드될 때 loaded.jstree 이벤트가 발생합니다. 
이 때 removeCheckboxesAtLevels([1, 2, 3]) 함수가 호출되어 aria-level이 1, 2, 3인 모든 노드의 체크박스를 제거합니다.

사용자가 트리의 노드를 열 때마다 open_node.jstree 이벤트가 발생합니다. 
이 때도 removeCheckboxesAtLevels([1, 2, 3]) 함수가 호출되어 다시 한 번 aria-level이 1, 2, 3인 모든 노드의 체크박스를 제거합니다.

이 두 가지 이벤트를 통해 초기 로드 시와 노드 열림 시마다 체크박스가 제거되어 원하는 대로 특정 레벨의 노드에서는 체크박스가 나타나지 않게 됩니다.
 -->















