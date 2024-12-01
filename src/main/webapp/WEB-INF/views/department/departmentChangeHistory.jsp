<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 이동 이력</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery 포함 -->
</head>
<body>

<style>
/* 스타일링 코드 (변경 없음) */
.left {
	display: flex;
	justify-content: flex-end;
}


.card {
	margin-bottom: 30px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
}

.card-body {
	padding: 0 20px 20px 20px;
}

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

.pagination .page-link {
	color: rgba(109, 105, 108, 1);
	background-color: white;
	border: none;
}

.pagination .page-item.active .page-link {
	border: 1px solid red;
	color: red;
	background-color: white;
}

.table-container {
	display: none;
	max-height: 400px;
	overflow-y: auto;
}


.download-btn:hover {
	background-color: #0056b3;
}

.table th, .table td {
    text-align: center; /* 수평 중앙 정렬 */
    vertical-align: middle; /* 수직 중앙 정렬 */
    padding: 10px;  /* 셀 내 여백 */
}

</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/side.jsp" />
<div class="body-body">
	<div class="text-box">
		<div style="margin-top: 15px; font-size: 25px;">부서 이동 이력</div>

		<div>
			<!-- 검색 폼 -->
			<form id="searchForm" action="javascript:void(0);" method="get">
				<table class="table" style="margin-top: 30px;">
					<tbody>
						<tr>
							<th
								style="height: 85px; background-color: #EBEAEA; vertical-align: middle; text-align: center;">변경일
								선택</th>
							<td
								style="height: 85px; display: flex; justify-content: flex-start; align-items: center; text-align: center;">
								<input type="date" name="startDate"
								style="width: 150px; margin-left: 15px;"> &nbsp;~ 
								&nbsp;<input type="date" name="endDate" style="width: 150px;">
							</td>
						</tr>
						<tr>
							<th
								style="height: 85px; background-color: #EBEAEA; vertical-align: middle; text-align: center;">검색
								조건</th>
							<td style="vertical-align: middle;">
								<div
									style="display: flex; align-items: center; margin-left: 15px;">
									<select class="dropdown dropdown-toggle dropdown-toggle-split"
										name="searchType" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false" style="	width: 150px;height: 35px; margin-right: 15px; border: 1px solid gray;" >
										<option value="empName">사원 명</option>
										<option value="empNo">사번</option>
									</select>
									<div class="search_box" style="width: 500px;">
										<input class="input_b" type="text" name="searchValue"
											placeholder="검색">
										<div class="icon">
											<button type="submit">
												<i class="bi bi-search"></i>
											</button>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

			<!-- 다운로드 버튼 -->
			<div class="btn-box-hover" style="display: flex; justify-content: flex-end;">
			    <button class="btn3-hover" id="downloadBtn" style="display: none; margin-right: 20px;">다운로드</button>
			</div>

			<div id="resultTableContainer" class="table-container"
				style="display: none;">
				<table class="table table-hover" style="margin-top: 30px;">
					<thead>
						<tr>
							 <th scope="col">
                    <input type="checkbox" id="selectAllCheckbox" style="width: 15px; height: 15px;">
                </th>
							<th scope="col">변경코드</th>
							<th scope="col">변경일자</th>
							<th scope="col">변경 전 부서</th>
							<th scope="col">변경 후 부서</th>
							<th scope="col">사용자 사번</th>
							<th scope="col">사용자 이름</th>
							<th scope="col">변경자 사번</th>
							<th scope="col">변경자 이름</th>
						</tr>
					</thead>
					<tbody id="resultTableBody">
						<!-- 결과가 여기에 동적으로 들어갈 예정 -->
					</tbody>
				</table>
			</div>

		</div>
	</div>

<script>
$(document).ready(function() {
	
	 $('#selectAllCheckbox').change(function() {
	        // 전체 선택 체크박스 상태에 따라 모든 체크박스를 선택하거나 해제
	        var isChecked = $(this).prop('checked');  // 전체 선택 체크박스의 상태
	        $('#resultTableBody input[type="checkbox"]').prop('checked', isChecked);
	    });
	
	
    // 폼 제출 이벤트
    $("#searchForm").submit(function(event) {
        event.preventDefault();  // 폼 제출 방지
        var formData = $(this).serialize();  // 폼 데이터 직렬화

        // 폼 데이터에서 각 필드의 값 가져오기
        var startDate = $("input[name='startDate']").val();
        var endDate = $("input[name='endDate']").val();
        var searchType = $("select[name='searchType']").val();
        var searchValue = $("input[name='searchValue']").val();

        // 모든 검색 조건이 입력되었는지 체크
        if ((startDate && endDate) && (searchType && searchValue)) {
            // 모든 조건이 맞을 때만 AJAX 요청
            $.ajax({
                url: '${contextPath}/department/departmentChangeHistory/data',  // 데이터만 반환하는 URL
                type: 'GET',
                data: formData,  // 폼 데이터 전송
                dataType: 'json',  // 서버 응답을 JSON 형식으로 처리
                success: function(response) {
                    // 데이터가 배열 형식인지 확인
                    if (Array.isArray(response) && response.length > 0) {
                        $('#resultTableContainer').show();  // 테이블 표시
                        $('#resultTableBody').empty();  // 기존 테이블 내용 비우기

                        // 다운로드 버튼 표시
                        $('#downloadBtn').show();

                        // 날짜 필터링
                        $.each(response, function(index, record) {
                            var transferDate = formatDate(record.transferDate);  // 날짜 포맷

                            // 선택한 범위 내 날짜 필터링
                            if (startDate && endDate) {
                                var start = formatDate(startDate);  // 시작일 포맷
                                var end = formatDate(endDate);  // 종료일 포맷

                                // 변경일자가 startDate와 endDate 범위에 포함되거나 동일한 날짜일 경우
                                if (transferDate >= start && transferDate <= end) {
                                    appendRow(record, transferDate);  // 테이블에 행 추가
                                }
                            } else {
                                appendRow(record, transferDate);  // 날짜 범위가 없으면 모두 추가
                            }
                        });
                    } else {
                        $('#resultTableContainer').hide();  // 결과가 없으면 테이블 숨기기
                        alert('검색 결과가 없습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    alert('데이터를 가져오는 데 실패했습니다.');
                }
            });
        } else {
            // 필수 항목이 비어 있으면 경고 메시지
            alert('변경일과 검색조건을 모두 입력해주세요.');
        }
    });

    // 'Enter' 키가 눌릴 때만 폼 제출
    $("#searchForm input").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            $("#searchForm").submit();  // 폼 제출
        }
    });

 // 다운로드 버튼 클릭 이벤트
    $('#downloadBtn').click(function() {
        var csvData = [];
        
        // 테이블 헤더를 먼저 추가
        var headerRow = [];
        $('#resultTableContainer thead th').each(function() {
            var headerText = $(this).text().trim();
            headerRow.push('"' + headerText + '"');
        });
        csvData.push(headerRow.join(','));

        var isChecked = false;  // 체크된 항목 여부
        
        var selectedRows = $('#resultTableBody').find('tr');  // 모든 행

        selectedRows.each(function() {
            var rowData = [];
            var checkbox = $(this).find('input[type="checkbox"]:checked');  // 선택된 체크박스 찾기

            // 체크박스가 선택된 행만 처리
            if (checkbox.length > 0) {
            	 isChecked = true;
                $(this).find('td').each(function(index, td) {
                    var cellText = $(td).text().trim();

                    if (cellText.match(/^\d{4}-\d{2}-\d{2}$/)) {
                        // 날짜 형식 처리
                        cellText = '"' + cellText + '"';
                    }

                    if (index < 9) {  // 9번째 이후의 열은 포함하지 않음
                        rowData.push(cellText);
                    }
                });

                if (rowData.length > 0) {
                    csvData.push(rowData.join(','));
                }
            }
        });

        
        // 체크된 항목이 없으면 경고 메시지
        if (!isChecked) {
            alert('한 개 이상의 이력을 체크해주세요.');
            return;  // 체크된 항목이 없으면 함수 종료
        }

        var csvContent = '\uFEFF' + csvData.join("\n");
        var encodedUri = encodeURI("data:text/csv;charset=utf-8," + csvContent);
        var link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "department_change_history.csv");
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    });


});

// 날짜를 yyyy-mm-dd 형식으로 변환하는 함수
function formatDate(dateString) {
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

// 테이블에 행 추가하는 함수
function appendRow(record, transferDate) {
    var row = '<tr>' +
                  '<td style="padding: 5px 10px; text-align: center;">' +
                      '<input type="checkbox" name="checkbox" value="' + record.transferCode + '" style="width: 15px; height: 15px;">' +
                  '</td>' +
                  '<td>' + record.transferCode + '</td>' +
                  '<td>' + transferDate + '</td>' +
                  '<td>' + record.transferBefore + '</td>' +
                  '<td>' + record.transferAfter + '</td>' +
                  '<td>' + record.empNo + '</td>' +
                  '<td>' + record.empName + '</td>' +
                  '<td>' + record.modifier + '</td>' +
                  '<td>' + record.modifierName + '</td>' +
              '</tr>';
    $('#resultTableBody').append(row);
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
