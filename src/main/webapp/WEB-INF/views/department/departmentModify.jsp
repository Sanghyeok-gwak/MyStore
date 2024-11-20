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
.left {
	display: flex;
	justify-content: flex-end;
}

/* 넓이 높이만 수정해서 사용하세요 인풋 스타일*/
input {
	border: 1px solid gray;
	border-radius: 2px;
	height: 35px;
	width: 480px;
}

.icon>button {
	border: none;
	background: none;
	outline: none;
}

.search_box {
	display: flex;
	width: 250px;
	border: 1px solid rgb(112, 112, 112);
	border-radius: 3px;
	align-items: center;
}

.input_b {
	border-style: none;
	outline: none;
	box-shadow: none;
	margin-left: 10px;
	margin-right: 10px;
}

.icon {
	margin-right: 10px;
}

/* jstree contextmenu에 대한 기본 스타일 추가 */
.jstree-contextmenu {
	position: absolute;
	z-index: 1000;
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<body>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	<div class="body-body">
		<!-- 여기 채워서 작업하시면 됩니다 .-->
		<div class="text-box">
			<div style="font-size: 18px;">
				<b>부서원 관리</b>
			</div>

			<div
				style="display: flex; justify-content: space-between; margin-top: 20px;">
				<div style="display: flex; flex-direction: column; height: 100%;">

					<div style="width: 430px; height: 400px; border: #868686 solid;">
						<!-- 왼쪽 영역 내용 -->
						<div class="d-flex"
							style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
							<div>
								<b>조직도</b>
							</div>
							<div class="btn-box-hover">
								<button id="editNodeBtn" class="btn2-hover" style="width: 50px;">수정</button>
								<button id="submitNodeBtn" class="btn3-hover"
									style="width: 50px;">등록</button>
							</div>

						</div>
						<div id="jstree"></div>

					</div>


					<!-- 아래쪽 영역 (오른쪽 영역) -->
					<div
						style="width: 100%; height: 240px; border: #868686 solid; margin-top: 10px;">
						<div
							style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
							<b>구성원</b>
						</div>
						<div style="height: calc(100% - 60px); overflow-y: auto;">
							<table class="table table-hover"
								style="margin-top: 0px; width: 100%; text-align: center; vertical-align: middle;">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">이름</th>
										<th scope="col">사번</th>
										<th scope="col">직책</th>
										<th scope="col">부서</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" name="checkbox" value="1"
											style="width: 15px; height: 15px;"></td>
										<td>강개똥</td>
										<td>A12345</td>
										<td>사원</td>
										<td>총무본부</td>
									</tr>
									<tr>
										<td><input type="checkbox" name="checkbox" value="2"
											style="width: 15px; height: 15px;"></td>
										<td>김철수</td>
										<td>A67890</td>
										<td>대리</td>
										<td>총무본부</td>
									</tr>
									<tr>
										<td><input type="checkbox" name="checkbox" value="3"
											style="width: 15px; height: 15px;"></td>
										<td>이영희</td>
										<td>A11223</td>
										<td>과장</td>
										<td>인사팀</td>
									</tr>
									<tr>
										<td><input type="checkbox" name="checkbox" value="3"
											style="width: 15px; height: 15px;"></td>
										<td>이영희</td>
										<td>A11223</td>
										<td>과장</td>
										<td>인사팀</td>
									</tr>
									<tr>
										<td><input type="checkbox" name="checkbox" value="3"
											style="width: 15px; height: 15px;"></td>
										<td>이영희</td>
										<td>A11223</td>
										<td>과장</td>
										<td>인사팀</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="btn-box-hover"
					style="display: flex; justify-content: center; align-items: center; margin-left: 10px;">
					<div
						style="display: flex; flex-direction: column; align-items: center;">
						<button class="btn3-hover" style="width: 120px; height: 120px;">
							<span style="font-size: 50px">←</span><br>부서이동
						</button>
						<button class="btn3-hover"
							style="width: 120px; height: 120px; color: #000000; margin-top: 80px;">
							<span style="font-size: 50px">→</span><br>부서이동
						</button>
					</div>
				</div>


				<div style="width: 60%; height: 650px; border: #868686 solid;">
					<!-- 오른쪽 영역 내용 -->
					<div>
						<div class="input-bar"
							style="width: 100%; display: flex; justify-content: flex-end; align-items: center; margin-top: 10px;">
							<div>
								<div class="search_box"
									style="margin-top: 10px; width: 300px; margin-right: 10px;">
									<input id="empNameInput" class="input_b" type="text"
										name="empName" placeholder="사원명 검색">
									<div class="icon">
										<button id="searchBtn">
											<i class="bi bi-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>




						<!-- 동적으로 데이터를 채울 테이블 -->
						<div style="height: 500px; overflow-y: auto; margin-top: 30px;">
							<table id="MemberList"
								class="table table-striped table-bordered table-sm table-hover">
								<thead>
									<tr>
										<th>선택</th>
										<th>사원명</th>
										<th>사원번호</th>
										<th>부서명</th>
										<th>상위 부서</th>
										<th>부서 이름</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dept" items="${searchResult}">
										<tr>
											<td><input type="checkbox" name="checkbox"
												value="${dept.empNo}" style="width: 15px; height: 15px;"></td>
											<td>${dept.empName}</td>
											<td>${dept.empNo}</td>
											<td>${dept.nm}</td>
											<td>${dept.deptUpStair}</td>
											<td>${dept.deptName}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery와 jsTree, Bootstrap JS -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

		<!-- AJAX로 데이터 검색 및 테이블에 반영 -->
		<script>
		$(document).ready(function() {
		    // Enter 키를 눌렀을 때 검색 실행
		    $("#empNameInput").keypress(function(event) {
		        if (event.which == 13) {  // 엔터 키의 코드값 13
		            event.preventDefault();  // 기본 엔터 키 동작을 막고
		            searchEmployees();  // 검색 실행
		        }
		    });

		    // 검색 버튼 클릭 시 검색 실행
		    $("#searchBtn").click(function() {
		        searchEmployees();  // 검색 실행
		    });

		    // 검색 실행 함수
		    function searchEmployees() {
		        var empName = $("#empNameInput").val();  // 입력된 사원명

		        // AJAX 요청 보내기
		        $.ajax({
		            url: "/mystore/department/departmentModify/data",  // URL을 '/mystore/department/departmentModify'로 수정
		            type: "GET",  // GET 방식으로 요청
		            data: { empName: empName },  // empName 파라미터 전달
		            success: function(response) {
		                // 서버에서 받은 데이터가 객체 형태인지 확인
		                if (Array.isArray(response)) {
		                    var tbody = $("#MemberList tbody");

		                    // 검색된 결과가 없으면 경고 메시지를 출력하고, 기존 데이터를 그대로 유지
		                    if (response.length === 0) {
		                        alert("검색된 결과가 없습니다.");
		                        // 기존 데이터는 그대로 두기 위해 테이블을 비우지 않음
		                    } else {
		                        tbody.empty();  // 기존 데이터를 비웁니다.

		                        // 서버에서 받은 데이터(response)로 테이블 행 생성
		                        response.forEach(function(dept) {
		                            var tr = $("<tr>");
		                            tr.append("<td><input type='checkbox' name='checkbox' value='" + dept.empNo + "' style='width: 15px; height: 15px;'></td>");
		                            tr.append("<td>" + dept.empName + "</td>");
		                            tr.append("<td>" + dept.empNo + "</td>");
		                            tr.append("<td>" + dept.deptName + "</td>");
		                            tr.append("<td>" + dept.deptUpStair + "</td>");
		                            tr.append("<td>" + dept.deptName + "</td>");
		                            tbody.append(tr);  // 테이블 본문에 행 추가
		                        });
		                    }
		                } else {
		                    // 서버에서 받은 데이터가 예상과 다를 때 처리
		                    alert("서버에서 반환된 데이터가 올바르지 않습니다.");
		                }
		            },
		            error: function(xhr, status, error) {
		                alert("검색 중 오류가 발생했습니다.");
		                console.error(xhr.responseText);  // 에러 메시지 확인
		            }
		        });
		    }
		});










$(function() {
    // 수정 모드 활성화 상태 변수
    var editMode = false;
    // 수정된 데이터를 저장할 변수
    var previousData = [];

    // 수정 버튼 클릭 시 상태 토글
    $("#editNodeBtn").click(function() {
        editMode = !editMode; // 클릭 시 수정모드 활성화 / 비활성화

        if (editMode) {
            // 수정 모드 활성화: contextmenu 플러그인 활성화
            $("#jstree").jstree("enable_plugin", "contextmenu");
            alert("수정 모드 활성화");
        } else {
            // 수정 모드 비활성화: contextmenu 플러그인 비활성화
            $("#jstree").jstree("disable_plugin", "contextmenu");
            alert("수정 모드 비활성화");

            // 수정되지 않았다면 이전 상태로 되돌리기
            if (previousData.length > 0) {
                // 트리 상태를 previousData로 복원
                $('#jstree').jstree(true).settings.core.data = previousData;
                $('#jstree').jstree(true).refresh();
            }
        }
    });

    // 등록 버튼 클릭 시
   $("#submitNodeBtn").click(function() {
    if (editMode) {
        // 수정된 데이터를 서버로 전송하는 부분
        alert("수정된 내용을 저장합니다.");
        
        // 수정된 트리 데이터를 가져옴
        var modifiedData = $('#jstree').jstree(true).get_json('#', { 'flat': true });
        
        // 서버에 데이터를 전송하는 AJAX 요청
        $.ajax({
            url: contextPath + "/saveTreeData", // 데이터를 저장할 서버 URL
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(modifiedData), // 트리 데이터를 JSON 형식으로 변환하여 전송
            success: function(response) {
                if (response.status === 'success') {
                    alert("수정 완료!");
                } else {
                    alert("수정 중 오류가 발생했습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("서버 통신 중 오류가 발생했습니다.");
            }
        });

        // 수정된 데이터를 이전 상태로 저장
        previousData = modifiedData;

        // 트리 수정 불가능하게 처리
        $('#jstree').jstree(true).settings.core.data = previousData;
        $('#jstree').jstree(true).refresh();

        // 수정 모드 비활성화
        editMode = false;
        $("#jstree").jstree("disable_plugin", "contextmenu");
    } else {
        alert("수정 모드가 아닙니다.");
    }
});


    // jsTree 초기화
    $("#jstree").jstree({
        core: {
            data: [
                {
                    "id": "1",
                    "parent": "#",
                    "text": "본부",
                    "state": {
                        "disabled": true
                    },
                    "icon": "fa fa-building"
                },
                {
                    "id": "2",
                    "parent": "1",
                    "text": "부서 A",
                    "icon": "fa fa-briefcase"
                },
                {
                    "id": "3",
                    "parent": "1",
                    "text": "부서 B",
                    "icon": "fa fa-briefcase"
                },
                {
                    "id": "4",
                    "parent": "2",
                    "text": "결재자 1",
                    "icon": "fa fa-user"
                },
                {
                    "id": "5",
                    "parent": "2",
                    "text": "결재자 2",
                    "icon": "fa fa-user"
                },
                {
                    "id": "6",
                    "parent": "2",
                    "text": "결재자 3",
                    "icon": "fa fa-user"
                },
                {
                    "id": "7",
                    "parent": "3",
                    "text": "결재자 4",
                    "icon": "fa fa-user"
                },
                {
                    "id": "8",
                    "parent": "3",
                    "text": "결재자 5",
                    "icon": "fa fa-user"
                },
                {
                    "id": "9",
                    "parent": "3",
                    "text": "결재자 6",
                    "icon": "fa fa-user"
                }
            ],
            check_callback: true
        },
        plugins: ["types", "contextmenu", "dnd"], // contextmenu 플러그인 추가
        'types': {
            '#': { // ROOT
                "max_depth": 3 // 하위 depth 제한
            }
        },
        contextmenu: {
            items: function($node) {
                var tree = $('#jstree').jstree(true);
                var nodeId = $node.id; // 클릭된 노드의 id 가져오기

                // 기본 메뉴 항목
                var menuItems = {};

                // 수정 모드인 경우에만 contextmenu 활성화
                if (!editMode) {
                    return {}; // 수정 모드가 아닌 경우 메뉴 항목을 반환하지 않음
                }

                // 최상위 노드일 경우 "부서추가" 메뉴 추가
                if ($node.parent === "#") { // 최상위 노드일 때
                    menuItems["create"] = {
                        "label": "부서추가",
                        "action": function() {
                            // 새 부서(노드)를 최상위 노드에 추가하는 로직
                            var newNode = {
                                "text": "새 부서",
                                "icon": "fa fa-briefcase",
                                "parent": $node.id // 클릭된 노드 아래에 추가
                            };
                            tree.create_node($node, newNode, "last", function(newNode) {
                                // 새로 생성된 노드가 추가된 후 처리할 사항을 여기에 추가
                                tree.edit(newNode); // 자동으로 이름 편집 상태로 전환
                            });
                        }
                    };
                }

                if ($node.parent === "1") { // 최상위에서 바로 아래 노드일 때
                    // 이름 변경 메뉴
                    menuItems["rename"] = {
                        "label": "이름 변경",
                        "action": function() {
                            tree.edit($node);
                        }
                    };

                    // 삭제 메뉴
                    menuItems["remove"] = {
                        "label": "삭제",
                        "action": function() {
                            if (confirm("정말로 삭제하시겠습니까?")) {
                                tree.delete_node($node);
                            }
                        }
                    };
                }

                return menuItems; // 여기서 메뉴 항목을 반환해야 합니다.
            }
        }
    });
});
</script>


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>