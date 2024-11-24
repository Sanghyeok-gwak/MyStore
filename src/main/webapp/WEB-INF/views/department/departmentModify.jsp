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

#jstree {
    max-height: 320px;
    overflow-y: auto;
    overflow-x: hidden;
    -webkit-overflow-scrolling: touch; /* 터치스크린에서 스크롤 부드럽게 하기 */
}
#jstree .jstree-children {
    max-height: 320px; /* 높이를 300px로 제한 */
    width: 444px;
    overflow-y: auto;  /* 자식 요소가 높이를 초과할 경우 수직 스크롤 추가 */
    overflow-x: hidden;  /* 하단(수평) 스크롤을 없앰 */
}

</style>

</head>
<body>

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

					<div style="width: 450px; height: 400px; border: #868686 solid;">
    <!-- 왼쪽 영역 내용 -->
    <div class="d-flex" style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
        <div>
            <b>조직도</b>
        </div>
        <div class="btn-box-hover">
            <button id="editNodeBtn" class="btn2-hover" style="width: 50px;">수정</button>
            <button id="submitNodeBtn" class="btn3-hover" style="width: 50px;">등록</button>
        </div>
    <!-- 트리 영역에 스크롤 적용 -->
    </div>
    <div style="height: 336px; overflow-y: auto; box-sizing: border-box; ">
        <div id="jstree"></div>
    </div>
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


				<div style="width: 64%; height: 650px; border: #868686 solid;">
					<!-- 오른쪽 영역 내용 -->
					<div>
						<div class="input-bar"
							style="width: 100%; display: flex; justify-content: flex-end; align-items: center; margin-top: 10px;">
							<div>
								<div class="search_box"
									style="margin-top: 10px; width: 300px; margin-right: 10px;">
									<input id="empNameInput" class="input_b" type="text"
										name="empName" placeholder="사원명 검색 (공백입력시 전체조회)">
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
								class="table table-striped table-bordered table-sm table-hover"
								style="text-align: center; vertical-align: middle;">
								<thead>
									<tr>
										<th></th>
										<th>사원명</th>
										<th>사원번호</th>
										<th>직책</th>
										<th>상위 부서</th>
										<th>부서명</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="counter" value="1" /> <!-- 시작 번호 설정 -->
										
										<c:forEach var="dept" items="${searchResult}">
										    <tr>
										        <td>${counter}</td> <!-- 증가하는 번호 출력 -->
										        <td>${dept.empName}</td>
										        <td>${dept.empNo}</td>
										        <td>${dept.nm}</td>
										        <td>${dept.deptUpStair}</td>
										        <td>${dept.deptName}</td>
										    </tr>
										    <c:set var="counter" value="${counter + 1}" /> <!-- 번호를 1 증가 -->
										</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
            url: "/mystore/department/departmentModify/data",  // URL을 '/mystore/department/departmentModify/data'로 수정
            type: "GET",  // GET 방식으로 요청
            data: { empName: empName },  // empName 파라미터 전달
            success: function(response) {
                var tbody = $("#MemberList tbody");
                if (response.searchResult && response.searchResult.length === 0) {
                    alert("검색된 결과가 없습니다.");
                    // 기존 데이터는 그대로 두기 위해 테이블을 비우지 않음
                } else if (response.searchResult) {
                    tbody.empty(); 
                    // searchResult 데이터가 있으면 테이블에 추가
                    var counter = 1;  // 번호 변수 초기화 (1부터 시작)
                    response.searchResult.forEach(function(dept) {
                        var tr = $("<tr>");
                        
                        // 첫 번째 td 셀에 증가하는 번호 추가
                        tr.append("<td>" + counter + "</td>");  // 번호 출력
                        tr.append("<td>" + dept.empName + "</td>");
                        tr.append("<td>" + dept.empNo + "</td>");
                        tr.append("<td>" + dept.deptName + "</td>");
                        tr.append("<td>" + dept.deptUpStair + "</td>");
                        tr.append("<td>" + dept.deptName + "</td>");
                        
                        // 테이블 본문에 행 추가
                        tbody.append(tr);  

                        counter++;  // 번호 1씩 증가
                    });
                } else {
                    alert("검색된 결과가 없습니다.");
                }

                // 부서 트리 출력 부분 (필요 시 추가)
                if (response.departmentTree) {
                    // 부서 트리 관련 처리가 필요하다면 이곳에 추가
                    // 예: response.departmentTree를 사용하여 부서 트리 UI 업데이트
                    console.log(response.departmentTree);
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
    var editMode = false;

    // 수정 모드 활성화/비활성화
    $("#editNodeBtn").click(function() {
        editMode = !editMode;  // 수정 모드 토글
        if (editMode) {
            alert("수정 모드가 활성화되었습니다.");
        } else {
            alert("수정 모드가 비활성화되었습니다.");
        }

        // 수정 모드에 따라 dnd 플러그인 활성화/비활성화
        $('#jstree').jstree("destroy").empty();  // 기존 트리 초기화
        initializeTree(editMode);  // 수정 모드에 맞게 트리 다시 초기화
    });

    // 트리 데이터를 AJAX로 로드하는 부분
    function loadTreeData() {
        $.ajax({
            url: "/mystore/department/departmentModify/data",  // 트리 데이터를 가져올 URL
            method: 'GET',
            dataType: 'json',
            success: function(response) {
                var departmentTree = response.departmentTree || [];  // departmentTree가 없으면 빈 배열

                // 데이터가 없으면 경고
                if (departmentTree.length === 0) {
                    alert("부서 트리 데이터가 없습니다.");
                    return;
                }

                // 데이터를 jstree 형식에 맞게 변환
                var treeData = departmentTree.map(function(emp) {
                    return {
                        "id": emp.empNo,
                        "parent": emp.deptCode || "#", // 루트는 "#"로 설정
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

                // jstree에 새로운 데이터를 설정
                $('#jstree').jstree(true).settings.core.data = treeData;
                $('#jstree').jstree(true).refresh();  // 트리 새로 고침
            },
            error: function(xhr, status, error) {
                alert("트리 데이터 로딩 중 오류 발생");
                console.error(xhr.responseText);  // 에러 메시지 확인
            }
        });
    }

    // jsTree 초기화 (수정 모드에 따라 dnd 플러그인 활성화/비활성화)
    function initializeTree(isEditMode) {
        $('#jstree').jstree({
            core: {
                data: [],  // 초기 데이터는 빈 배열로 설정, AJAX로 데이터 업데이트 예정
                check_callback: true,  // 트리 내에서 항목을 추가, 삭제 등의 작업을 가능하게 합니다.
                themes: {
                    dots: true,
                    icons: true
                }
            },
            plugins: isEditMode ? ["contextmenu", "dnd"] : ["contextmenu"], // 수정 모드일 경우 dnd 플러그인 활성화
            contextmenu: {
                items: function($node) {
                    var menuItems = {};

                    // 수정 모드 확인
                    if (!editMode) {
                        return {};  // 수정 모드가 아니면 메뉴 항목을 반환하지 않음
                    }

                    // 루트 노드일 경우
                    if ($node.parent === "#") {
                        menuItems["create"] = {
                            "label": "부서추가",
                            "action": function() {
                                var tree = $('#jstree').jstree(true);
                                var newNode = {
                                    "text": "새 부서",
                                    "parent": $node.id
                                };
                                tree.create_node($node, newNode, "last", function(newNode) {
                                    tree.edit(newNode);
                                    // 새 부서 데이터를 설정
                                    newDeptData = {
                                        deptName: newNode.text,
                                        deptUpStair: $node.id
                                    };
                                });
                            }
                        };
                    }

                    // 루트 노드가 아닐 경우
                    if ($node.parent !== "#") {
                        menuItems["rename"] = {
                            "label": "이름 변경",
                            "action": function() {
                                var tree = $('#jstree').jstree(true);
                                tree.edit($node);  // 해당 노드를 수정 가능하도록 편집 모드로 진입
                            }
                        };

                        menuItems["remove"] = {
                            "label": "삭제",
                            "action": function() {
                                var tree = $('#jstree').jstree(true);
                                if (confirm("정말로 삭제하시겠습니까?")) {
                                    tree.delete_node($node);  // 해당 노드를 삭제
                                }
                            }
                        };
                    }

                    return menuItems;  // 메뉴 항목 반환
                }
            },
            dnd: {
                'start': function (event, data) {
                    var node = data.node;
                    // 드래그 시작 시 노드의 깊이를 기록
                    originalDepth = node.parents.length;
                },
                'is_dropable': function(targetNode) {
                    var targetNodeDepth = targetNode.parents.length;

                    // 드래그한 노드의 원래 깊이와 같은 깊이로만 드롭 가능
                    if (targetNodeDepth !== originalDepth) {
                        return false;  // 원래 깊이와 다른 깊이에 드롭할 수 없음
                    }

                    return true;  // 원래 깊이로만 드롭 가능
                }
            }
        });

        // 트리 데이터 로드
        loadTreeData();
    }

    // 초기 트리 데이터 로드 및 트리 초기화
    initializeTree(editMode);

    $("#submitNodeBtn").click(function() {
        const selectedNode = $('#jstree').jstree('get_selected');
        const treeData = $('#jstree').jstree('get_json');  // 트리 구조 데이터 가져오기

        if (selectedNode.length > 0) {
            let nodeId = selectedNode[0];
            let nodeName = $('#jstree').jstree('get_text', nodeId);  // 현재 부서명

            // 트리에서 노드의 원래 부서명 가져오기
            let nodeData = $('#jstree').jstree('get_node', nodeId).data;
            let originalNodeName = nodeData.originalDeptName || nodeName;  // 원래 부서명 가져오기

            console.log("Original Node Name:", originalNodeName);  // 디버그 로그 추가

            let isNewDepartment = false;
            let isNameChanged = false;

            // 새 부서 추가 또는 이름 변경 여부 확인
            if (nodeName === "본사") {
                isNewDepartment = true;
            } else if (nodeName !== originalNodeName) {
                isNameChanged = true;
            }

            // 부서명 수정
            nodeName = "새 부서";  // 사용자가 수정한 부서명

            console.log("Sending Data:", {
                deptName: nodeName,
                originalDeptName: originalNodeName,  // 원래 부서명
                isNewDepartment: isNewDepartment,  // 부서 추가 여부
                isNameChanged: isNameChanged,  // 부서명 변경 여부
                treeData: treeData  // 트리 데이터
            });

            $.ajax({
                url: '/mystore/department/departmentModify/data',  // 요청 URL
                type: 'POST',
                contentType: 'application/json',  // JSON 형식으로 요청
                data: JSON.stringify({
                    deptName: nodeName,
                    originalDeptName: originalNodeName,
                    isNewDepartment: isNewDepartment,
                    isNameChanged: isNameChanged,
                    treeData: treeData  // 이미 객체 형식으로 처리
                }),
                success: function(response) {
                    if (response.success) {
                        alert("부서 수정/추가 완료!");
                        loadTreeData(); // 트리 새로 고침
                    } else {
                        alert("부서 수정/추가 실패: " + (response.message || "알 수 없는 오류"));
                    }
                },
                error: function(xhr, status, error) {
                    alert("서버와의 연결에 문제가 발생했습니다.");
                    console.error(error);  // error 콘솔 출력
                }
            });

        } else {
            alert("수정 또는 추가할 부서를 선택하세요.");
        }
    });




    // 수정 모드 활성화/비활성화 토글 함수 (예시)
    $('#toggleEditMode').on('click', function() {
        editMode = !editMode;  // 수정 모드를 토글
        console.log("수정 모드:", editMode);
    });
});
</script>



		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>