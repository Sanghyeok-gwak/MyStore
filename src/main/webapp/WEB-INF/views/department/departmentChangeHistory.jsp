<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 이동 이력</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 포함 -->
</head>
<body>

<style>
.left {
    display: flex;
    justify-content: flex-end;
}

.dropdown {
    width: 150px;
    height: 35px;
    margin-right: 15px;
    border: 1px solid gray;
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
    display: none; /* Initially hidden */
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
    <div class="text-box">
        <div style="margin-top: 15px; font-size:25px;">
            부서 이동 이력
        </div>

        <div>
            <!-- 검색 폼 -->
            <form id="searchForm" action="javascript:void(0);" method="get">
    <table class="table" style="margin-top: 30px;">
        <tbody>
            <!-- 날짜 선택 -->
            <tr>
                <th style="height: 85px; background-color: #EBEAEA; vertical-align: middle; text-align: center;">변경일 선택</th>
                <td style="height: 85px; display: flex; justify-content: flex-start; align-items: center; text-align: center;">
                    <input type="date" name="startDate" style="width: 150px; margin-left:15px;"> &nbsp;~ &nbsp;<input type="date" name="endDate" style="width: 150px;">
                </td>
            </tr>

            <!-- 검색 조건 -->
            <tr>
                <th style="height: 85px; background-color: #EBEAEA; vertical-align: middle; text-align: center;">검색 조건</th>
                <td style="vertical-align: middle;">
                    <div style="display: flex; align-items: center; margin-left:15px;">
                        <select class="dropdown dropdown-toggle dropdown-toggle-split" name="searchType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <option value="name">사원 명</option>
                            <option value="empNo">사번</option>
                        </select>
                        <div class="search_box" style="width:500px;">
                            <input class="input_b" type="text" name="searchValue" placeholder="검색">
                            <div class="icon">
                                <button type="submit"><i class="bi bi-search"></i></button>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</form>

        </div>

        <!-- 검색 후 표시할 테이블 및 다운로드 버튼 -->
        <div id="resultTableContainer" class="table-container">
            <div class="btn-box-hover">
                <div style="display: flex; justify-content: flex-end; width: 100%; margin-top:20px;">
                    <button class="btn2-hover">다운로드</button>
                </div>
            </div>

            <table class="table table-hover" style="margin-top: 30px;">
                <thead>
                    <tr>
                        <th scope="col"></th>
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
    // 검색 폼 제출 시 AJAX로 요청
    $("#searchForm").submit(function(event) {
        event.preventDefault();  // 폼 기본 제출 동작 방지
        var formData = $(this).serialize();  // 폼 데이터 직렬화

        $.ajax({
            url: '${contextPath}/department/departmentChangeHistory',
            type: 'GET',
            data: formData,  // searchQuery가 searchValue로 보내지도록
            success: function(response) {
                console.log(response);  // 응답을 확인하기 위한 로그

                // 응답이 배열인지 확인
                if (Array.isArray(response) && response.length > 0) {
                    $('#resultTableContainer').show();  // 테이블 보이기
                    $('#resultTableBody').empty();  // 기존 테이블 내용 삭제

                    // 테이블에 데이터를 동적으로 추가
                    $.each(response, function(index, record) {
                        var row = `<tr>
                            <td style="padding: 5px 10px; text-align: center;">
                                <input type="checkbox" name="checkbox" value="${record.transferCode}" style="width: 15px; height: 15px;">
                            </td>
                            <td>${record.transferCode}</td>
                            <td>${record.transferDate}</td>
                            <td>${record.transferBefore}</td>
                            <td>${record.transferAfter}</td>
                            <td>${record.empNo}</td>
                            <td>${record.empName}</td>
                            <td>${record.modifier}</td>
                            <td>${record.modifierName}</td>
                        </tr>`;
                        $('#resultTableBody').append(row);
                    });
                } else {
                    $('#resultTableContainer').hide();  // 결과가 없으면 테이블 숨기기
                    alert('검색 결과가 없습니다.');
  
                }
            },

            error: function(xhr, status, error) {
                console.log(error);  // 오류 로그 확인
                alert('서버와의 통신에 문제가 발생했습니다.');
            }
        });
    });
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
