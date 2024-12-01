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
 /* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 숨겨짐 */
        position: fixed; /* 화면에 고정 */
        z-index: 1; /* 최상위 */
        left: 0;
        top: 0;
        width: 100%; /* 화면 전체 */
        height: 100%; /* 화면 전체 */
        overflow: auto; /* 스크롤 가능 */
        background-color: rgb(0,0,0); /* 배경은 반투명 검정 */
        background-color: rgba(0,0,0,0.4); /* 배경에 투명도 추가 */
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 500px;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
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
						<div class="d-flex"
							style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
							<b>구성원</b>
							 <div class="btn-box-hover">
							   <button id="MoveDept" class="btn3-hover" style="width: 50px; display: none;">이동</button>
							   </div>
						</div>
						<div style="height: calc(100% - 60px); overflow-y: auto;">
							<table id="TeamList" class="table table-hover"
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
								        <!-- 여기에 AJAX로 받은 데이터가 들어감 -->
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
<div id="moveDeptModal" class="modal" style="display: none;">
    <div class="modal-content" style="height:300px;">
        <span id="closeModal" class="close">&times;</span>
        <h2>부서 이동</h2>

        <form id="moveDeptForm" action="/department/moveDept" method="post">
            <div style="margin-top:20px;">
                <label for="nowDeptName">현재 부서:</label>
                <input type="text" id="nowDeptName" name="nowDept" list="UpdeptNameList" style="width:200px; padding-left:10px; margin-left:78px; background-color: #EBEAEA;" readonly>
            </div>

            <div style="margin-top:20px;">
                <label for="DeptName">이동 시킬 부서:</label>
                <select id="DeptName" name="DeptName" style="width:200px; margin-left:44px; height:35px; padding-left:5px; ">
            <!-- 서버에서 동적으로 데이터가 들어올 예정 -->
        </select>
            </div>
            <div class="btn-box-hover" style="display: flex; justify-content: flex-end;">
                <button class="btn3-hover" type="submit" id="moveDeptBtn" style="margin-top:30px;">이동</button>
            </div>
        </form>
    </div>
</div>

<script>
// 페이지 로드 시 동적으로 부서 데이터를 받아오기 위한 AJAX 요청
$(document).ready(function() {
    // 현재 부서와 상위 부서 데이터를 받아오는 AJAX 요청
    $.ajax({
        url: '${contextPath}/department/getDepartments',  // 서버에서 부서 정보를 가져올 URL
        type: 'GET',
        success: function(response) {
            // 서버로부터 받은 부서 목록을 사용하여 <select>에 추가
            var deptNameSelect = $('#DeptName');

            // "이전 할 부서" 드롭다운에 항목 추가
            deptNameSelect.empty();  // 기존 항목 비우기
            response.deptNames.forEach(function(department) {
                deptNameSelect.append('<option value="' + department.deptName + '">' + department.deptName + '</option>');
            });
        },
        error: function(xhr, status, error) {
            console.error('부서 데이터를 가져오는 데 실패했습니다:', error);
        }
    });
});

$(document).on('change', '.team-checkbox', function() {

	$('#MoveDept').hide();   
	
	// 체크된 체크박스의 부모 tr 요소에서 데이터 추출
    var row = $(this).closest('tr');
    var empName = row.find('td').eq(1).text();  // 이름
    var empNo = row.find('td').eq(2).text();    // 사번
    var deptName = row.find('td').eq(4).text();  // 부서명

    
    var checkedCheckboxes = $('.team-checkbox:checked'); // 선택된 체크박스들

    // 두 개 이상의 체크박스가 선택되면 알림을 띄우고 첫 번째 체크박스를 비활성화
    if (checkedCheckboxes.length > 1) {
        alert("정확한 이동을 위해 한명씩 이동시켜주세요.");
        $('.team-checkbox').prop('checked', false); // 현재 클릭된 체크박스를 해제
        return;
    }

    // "이동" 버튼의 표시/숨기기 처리
    if (checkedCheckboxes.length === 1) {
        $('#MoveDept').show();  // "이동" 버튼 보이기
    } else {
        $('#MoveDept').hide();  // "이동" 버튼 숨기기
    }
    // 해당 데이터를 모달에 전달

    $('#nowDeptName').val(deptName)

    // 부서명과 사원번호는 서버에서 다른 정보를 요구할 수 있으므로 추가적인 로직을 설정할 수 있음
});
    // "이동" 버튼 클릭 시 모달 열기
$(document).ready(function() {
    // "이동" 버튼 클릭 시 모달 열기
    $('#MoveDept').click(function() {
        $('#moveDeptModal').show(); // 모달을 보이게 함
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    $('#closeModal').click(function() {
        $('#moveDeptModal').hide(); // 모달을 숨김
    });

    // 체크박스가 변경되었을 때 선택된 행의 데이터 모달에 전달
    $(document).on('change', '.team-checkbox', function() {
        var row = $(this).closest('tr');  // 체크된 체크박스의 부모 tr 요소
        var empName = row.find('td').eq(1).text();  // 이름
        var empNo = row.find('td').eq(2).text();    // 사번
        var deptName = row.find('td').eq(4).text();  // 부서명

        // 해당 데이터를 모달에 전달
        $('#nowDeptName').val(deptName);
    });

    // "이동" 버튼 클릭 시 서버로 부서 이동 요청 (AJAX)
    $('#moveDeptBtn').click(function(e) {
        e.preventDefault();  // 기본 동작 방지

        // 모달에서 입력된 데이터 가져오기
        var row = $('.team-checkbox:checked').closest('tr');  // 체크된 항목의 row 찾기
        var empNo = row.find('td').eq(2).text();  // 사원번호
        var nowDeptName = $('#nowDeptName').val();
        var upDeptName = $('#UpdeptName').val();
        var deptName = $('#DeptName').val();
        var modifier = row.find('td').eq(1).text();  // 수정자 (이름)

        // 서버로 부서 이동 요청 (AJAX)
        $.ajax({
            url: '${contextPath}/department/moveDept',  // 서버에서 부서 이동 처리 URL (예시)
            type: 'POST',
            data: {
            
                deptName: deptName,
                empNo: empNo,  // 사원번호
                modifier: modifier  // 수정자
            },
            success: function(response) {
                if (response.success) {
                    alert('부서 이동 성공');
                    $('#moveDeptModal').hide();  // 모달 닫기
                    location.reload();  // 페이지 새로고침 (테이블 갱신을 위한 예시)
                } else {
                    alert('부서 이동 실패');
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 오류:", status, error);
                alert('부서 이동 중 오류가 발생했습니다.');
            }
        });
    });
});



    // 모달 닫기 버튼 클릭 시 모달 닫기
    $("#closeModal").click(function() {
        $("#moveDeptModal").hide(); // 모달 숨기기
    });

    // 모달 외부 클릭 시 모달 닫기
    $(window).click(function(event) {
        if ($(event.target).is("#moveDeptModal")) {
            $("#moveDeptModal").hide(); // 모달 숨기기
        }
    });
    
    
</script>


<script>
$('#jstree').on("select_node.jstree", function (e, data) {
    var tree = $('#jstree').jstree(true);

    // AJAX 요청을 통해 서버에서 해당 부서에 대한 정보를 가져오기
    $.ajax({
        url: "${contextPath}/department/departmentModify/search",  // 서버에서 데이터를 가져오는 URL
        type: 'GET',
        data: { deptName: data.node.text }, // 클릭된 노드의 ID를 파라미터로 전달
        success: function(response) {

            var tbody = $('#TeamList tbody');
            tbody.empty();  // 기존 데이터 비우기

            var counter = 1;

            // response.data 배열을 사용하여 테이블에 데이터 채우기
            if (response.data && Array.isArray(response.data)) {
                $.each(response.data, function(index, dept) {
                    var row = '<tr>';

                    // empName이 존재하는 경우에만 <td> 추가
                 row += '<td style="width:30px; text-align:center; vertical-align:middle;"><input type="checkbox" class="team-checkbox" data-index="' + index + '" style="width:17px; height:17px; margin-top:6px;"></td>';
                    row += '<td>' + (dept.empName || '없음') + '</td>';
                    row += '<td>' + (dept.empNo || '없음') + '</td>';
                    row += '<td>' + (dept.nm || '없음') + '</td>';
                    row += '<td>' + (dept.deptName || '없음') + '</td>';

                    row += '</tr>';
                    tbody.append(row);
                   
                });
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 오류:", status, error);
        }
    });
});


</script>
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
            url: "${contextPath}/department/departmentModify/data",  // URL을 '/mystore/department/departmentModify/data'로 수정
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
            url: "${contextPath}/department/departmentModify/data",  // 트리 데이터를 가져올 URL
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
            plugins: ["contextmenu"] , // 수정 모드일 경우 dnd 플러그인 활성화
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
                                         // 서버로 새 부서 데이터 전송
                                         $.ajax({
                                        	    url: "${contextPath}/department/departmentModify/data",  // 부서 추가 처리 URL
                                        	    type: "POST",
                                        	    contentType: "application/json",
                                        	    data: JSON.stringify({
                                        	        deptName: newDeptData.deptName,
                                        	        deptCode: "",  // 신규 부서에는 deptCode 없음
                                        	        treeData: JSON.stringify(newDeptData)  // 부서 추가를 위한 treeData
                                        	    }),
                                        	    success: function(response) {
                                        	        if (response.success) {
                                        	            alert("부서가 성공적으로 추가되었습니다.");
                                        	            loadTreeData();
                                        	        } else {
                                        	            alert("부서 추가 실패: " + response.message);
                                        	        }
                                        	    },
                                        	    error: function(xhr, status, error) {
                                        	        alert("서버와의 연결에 오류가 발생했습니다.");
                                        	        console.error(xhr.responseText);
                                        	    }
                                        	});

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
                                $(".jstree-rename-input").focusout(function() {
                                    var id = $node.id;
                                    var after_name = $(".jstree-rename-input").val();
                                    var updateDeptData = {
                                        deptCode: id,
                                        deptName: after_name,
                                        treeData: JSON.stringify({deptCode: id, deptName: after_name, operation: "update"})  // 부서명 변경을 위한 treeData
                                    };

                                    $.ajax({
                                        url: "${contextPath}/department/departmentModify/update",  // 부서명 변경 처리 URL
                                        type: "POST",
                                        contentType: "application/json",
                                        data: JSON.stringify(updateDeptData),
                                        success: function(response) {
                                            if (response.success) {
                                                alert("부서 이름이 성공적으로 변경되었습니다.");
                                                loadTreeData();  // 트리 데이터를 새로고침하여 변경된 사항 반영
                                            } else {
                                                alert("부서 이름 변경 실패: " + response.message);
                                            }
                                        },
                                        error: function(xhr, status, error) {
                                            alert("서버와의 연결에 오류가 발생했습니다.");
                                            console.error(xhr.responseText);
                                        }
                                    });
                                
									
									
									
									
									
									
									
									
									
									
									
								});
                            }
                        };

                        menuItems["remove"] = {
                        	    "label": "삭제",
                        	    "action": function() {
                        	        var tree = $('#jstree').jstree(true);
                        	        if (confirm("정말로 삭제하시겠습니까?")) {
                        	            // 서버로 삭제 요청
                        	            $.ajax({
                        	                url: "${contextPath}/department/departmentModify/delete",  // 부서 삭제 처리 URL
                        	                type: "POST",
                        	                contentType: "application/json",
                        	                data: JSON.stringify({
                        	                    deptCode: $node.id,  // 삭제할 부서의 ID
                        	                    deptName: $node.text,  // 삭제할 부서의 이름 (추가 정보로 보낼 수 있음)
                        	                    // treeData: JSON.stringify(treeData)  // 트리 구조 데이터를 전달할 경우 사용할 수 있음
                        	                    operation: "delete"
                        	                }),
                        	                success: function(response) {
                        	                    if (response.success) {
                        	                        alert("부서가 성공적으로 삭제되었습니다.");
                        	                        tree.delete_node($node);  // 트리에서 해당 노드를 삭제
                        	                    } else {
                        	                        alert("부서 삭제 실패: " + response.message);
                        	                    }
                        	                },
                        	                error: function(xhr, status, error) {
                        	                    alert("서버와의 연결에 오류가 발생했습니다.");
                        	                    console.error(xhr.responseText);  // 오류 로그 확인
                        	                }
                        	            });
                        	        }
                        	    }
                        	};

                    }

                    return menuItems;  // 메뉴 항목 반환
                }
            }
        });

        // 트리 데이터 로드
        loadTreeData();
    }

    // 초기 트리 데이터 로드 및 트리 초기화
    initializeTree(editMode);

  



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