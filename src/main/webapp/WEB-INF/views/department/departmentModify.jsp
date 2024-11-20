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
                    response.searchResult.forEach(function(dept) {
                        var tr = $("<tr>");
                        tr.append("<td><input type='checkbox' name='checkbox' value='" + dept.empNo + "' style='width: 15px; height: 15px;'></td>");
                        tr.append("<td>" + dept.empName + "</td>");
                        tr.append("<td>" + dept.empNo + "</td>");
                        tr.append("<td>" + dept.deptName + "</td>");
                        tr.append("<td>" + dept.deptUpStair + "</td>");
                        tr.append("<td>" + dept.deptName + "</td>");
                        tbody.append(tr);  // 테이블 본문에 행 추가
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
    $("#jstree").jstree({
        core: {
            data: function(node, cb) {
                console.log("node:", node);  // node 객체 출력

                // 루트 노드일 경우 deptUpStair을 빈 문자열로 설정
                var deptUpStair = (node.id === "#") ? "" : node.id; 
                console.log("deptUpStair:", deptUpStair);  // deptUpStair 값 확인

                // AJAX로 트리 데이터를 서버에서 가져오기
                $.ajax({
                    url: "/mystore/department/departmentModify/data",  // 트리 데이터를 가져올 URL
                    type: "GET",
                    data: {
                        deptUpStair: deptUpStair  // deptUpStair 값을 서버로 전송
                    },
                    success: function(response) {
                        var treeData = [];
                        console.log("응답 데이터:", response);  // 응답 데이터 확인

                        // 응답이 departmentTree 배열이 있을 경우, 그 값을 트리 데이터 형식으로 변환
                        if (response.departmentTree && Array.isArray(response.departmentTree)) {
                            response.departmentTree.forEach(function(dept) {
                                if (dept && dept.deptCode && dept.deptName) {
                                    treeData.push({
                                        "id": dept.deptCode,  // 부서 코드 (deptCode)
                                        "parent": dept.deptUpStair ? dept.deptUpStair : "#",  // 부모 부서가 없으면 루트로 설정
                                        "text": dept.deptName,  // 부서 이름
                                        "icon": "fa fa-briefcase",  // 부서 아이콘
                                        "employees": dept.employees || [],  // 부서 내 직원 정보 (없으면 빈 배열)
                                        "children": dept.children || []  // 자식 부서 (없으면 빈 배열)
                                    });
                                }
                            });
                        }

                        console.log("트리 데이터:", treeData);  // 변환된 트리 데이터 확인
                        cb(treeData);  // 트리 데이터 전달
                    },
                    error: function(xhr, status, error) {
                        console.error("AJAX 요청 오류:", error);
                        alert("부서 데이터를 불러오는 중 오류가 발생했습니다.");
                    }
                });
            }
        },
        check_callback: true,  // 트리 내에서 항목을 추가, 삭제 등의 작업을 가능하게 합니다.
        plugins: ["contextmenu", "dnd"],  // 사용하려는 플러그인
        contextmenu: {
            items: function($node) {
                var menuItems = {};

                if (!editMode) {
                    return {};  // 수정 모드가 아니면 메뉴 항목을 반환하지 않음
                }

                if ($node.parent === "#") {  // 루트 노드일 경우
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
                            });
                        }
                    };
                }

                if ($node.parent !== "#") {  // 루트 노드가 아닐 경우
                    menuItems["rename"] = {
                        "label": "이름 변경",
                        "action": function() {
                            var tree = $('#jstree').jstree(true);
                            tree.edit($node);
                        }
                    };

                    menuItems["remove"] = {
                        "label": "삭제",
                        "action": function() {
                            var tree = $('#jstree').jstree(true);
                            if (confirm("정말로 삭제하시겠습니까?")) {
                                tree.delete_node($node);
                            }
                        }
                    };
                }

                return menuItems;  // 메뉴 항목 반환
            }
        }
    });
});

</script>


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>