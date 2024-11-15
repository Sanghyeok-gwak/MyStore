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
								<button class="btn2-hover" style="width: 50px;">수정</button>
								<button class="btn3-hover" style="width: 50px;">등록</button>
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
									<input class="input_b" type="text" placeholder="검색">
									<div class="icon">
										<button>
											<i class="bi bi-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>

						<!-- 테이블을 감싸는 div 추가하여 높이 제한 -->
						<div style="height: 500px; overflow-y: auto; margin-top: 30px;">
							<table  id="MemberList" class="table table-hover"
								style="width: 100%; text-align: center; vertical-align: middle;">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">이름</th>
										<th scope="col">사번</th>
										<th scope="col">직책</th>
										<th scope="col">상위부서</th>
										<th scope="col">하위부서</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${ empty list }">
											<tr>
												<td colspan="6">조회된 사원이 없습니다.</td>

											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="b" items="${ list }">
												<tr>
													<td> <!-- 고유한 id를 부여한 체크박스 -->
            <input type="checkbox" id="checkbox_${b.empNo}" name="checkbox_${b.empNo}" value="${b.empNo}" style="width:15px;"></td>
													<td>${ b.empName }</td>
													<td>${ b.empNo }</td>
													<td>${ b.nm }</td>
													<td>${ b.deptUpStair }</td>
													<td>${ b.deptName }</td>
													
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>



	<script>
	function toggleSubmenu(element) {
	    const submenu = element.nextElementSibling;
	    if (submenu.style.maxHeight === "0px" || submenu.style.maxHeight === "") {
	        submenu.style.maxHeight = submenu.scrollHeight + "px";
	    } else {
	        submenu.style.maxHeight = "0";
	    }
	}

	$(function() {
	    // jsTree 초기화
	    $("#jstree").jstree({
	        core: {
	            data: [{
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
	        plugins: ["types","contextmenu", "dnd"], // contextmenu 플러그인 추가
	        'types': {
	            '#': { // ROOT
	             "max_depth": 3// 하위 depth 제한
	            }
	         
	       },
	        contextmenu: {
	            // 커스텀 메뉴 항목
	            items: function($node) {
	                var tree = $('#jstree').jstree(true);
	                var nodeId = $node.id; // 클릭된 노드의 id 가져오기

	                // 기본 메뉴 항목
	                var menuItems = {};

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
	        },

	      
	    });
	});

	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>