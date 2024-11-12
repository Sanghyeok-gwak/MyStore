<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
     <div class="text-box">
        <div style="font-size:18px;">
            <b>부서관리</b>
        </div>

        <div style="display: flex; justify-content: space-between; margin-top: 20px;">
            <div style="width: 35%; height: 650px; border: #868686 solid;">
                <!-- 왼쪽 영역 내용 -->
                <div style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
                    <b>조직도</b>
                </div>
                <div id="jstree"></div>
                 
            </div>
            <div style="width: 60%; height: 650px; border: #868686 solid;">
                <!-- 오른쪽 영역 내용 -->
                <div>
                <table class="table table-hover" style="margin-top: 0px;">
                    <tbody>
                        <tr>
                            <th style="height:100px; width:150px; background-color: #EBEAEA; text-align: center; vertical-align: middle;">부서명</th>
                            <td style="vertical-align: middle;">
                                <div class="input-bar" style="margin-left: 10px;">
                                    <input type="text" class="input-bar1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="height:100px; background-color: #EBEAEA; text-align: center; vertical-align: middle;">부서코드</th>
                            <td style="vertical-align: middle;">
                                <div class="input-bar" style="margin-left: 10px;">
                                    <input type="text" class="input-bar1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="height:100px; background-color: #EBEAEA; text-align: center; vertical-align: middle;">상위부서</th>
                            <td style="vertical-align: middle;">
                                <select class="dropdown dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:500px; margin-left: 10px;">
                                    <option selected>부서명</option>
                                    <option>사번</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th style="height:100px; background-color: #EBEAEA; text-align: center; vertical-align: middle;">정렬순서</th>
                            <td style="vertical-align: middle;">
                                <select class="dropdown dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:500px; margin-left: 10px;">
                                    <option selected>순서</option>
                                    <option>1</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            

            <div class="btn-box-hover" style="margin-top:80px; display: flex; justify-content: center;">
                <button class="btn3-hover" >부서 등록</button>
                <button class="btn2-hover" style="margin-left:30px; margin-right:30px;">수정</button>
                <button class="btn1-hover">삭제</button>
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

    $(function () {
    // jsTree 초기화
    $("#jstree").jstree({
        core: {
            data: [
                { "id": "1", "parent": "#", "text": "본부", "state": { "disabled": true }, "icon": "fa fa-building" },
                { "id": "2", "parent": "1", "text": "부서 A", "state": { "disabled": true }, "icon": "fa fa-briefcase" },
                { "id": "3", "parent": "1", "text": "부서 B", "state": { "disabled": true }, "icon": "fa fa-briefcase" },
                { "id": "4", "parent": "2", "text": "결재자 1", "icon": "fa fa-user" },
                { "id": "5", "parent": "2", "text": "결재자 2", "icon": "fa fa-user" },
                { "id": "6", "parent": "2", "text": "결재자 3", "icon": "fa fa-user" },
                { "id": "7", "parent": "3", "text": "결재자 4", "icon": "fa fa-user" },
                { "id": "8", "parent": "3", "text": "결재자 5", "icon": "fa fa-user" },
                { "id": "9", "parent": "3", "text": "결재자 6", "icon": "fa fa-user" }
            ]
        },
        plugins: ["themes"], // 체크박스 플러그인 제거
    });

    // 1) 부서의 텍스트를 클릭하면 하위 트리가 펼쳐지거나 닫히고 체크박스는 선택되지 않도록 설정
    $('#jstree').on('click.jstree', '.jstree-anchor', function (e) {
        var nodeId = $(this).closest('a').parent().attr('id'); // 클릭된 노드의 ID 가져오기
        var tree = $('#jstree').jstree(true);  // 현재 jsTree 인스턴스 가져오기

        // 텍스트를 클릭하면 노드가 펼쳐지고 닫힘 (체크박스 상태는 변경되지 않음)
        if (!tree.is_open(nodeId)) {
            tree.open_node(nodeId);
        } else {
            tree.close_node(nodeId); // 이미 열려 있으면 닫기
        }
    });
});
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>