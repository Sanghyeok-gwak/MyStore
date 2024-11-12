<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
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
</style>

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
            <b>부서원 관리</b>
        </div>

        <div style="display: flex; justify-content: space-between; margin-top: 20px;">
            <div style="display: flex; flex-direction: column; height: 100%;">

              <div style="width: 430px; height: 400px; border: #868686 solid;">
                <!-- 왼쪽 영역 내용 -->
                <div style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
                    <b>조직도</b>
                </div>
                <div id="jstree"></div>
                
            </div>
            
            
                <!-- 아래쪽 영역 (오른쪽 영역) -->
                <div style="width: 100%; height: 240px; border: #868686 solid; margin-top: 10px;">
                  <div style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
                      <b>구성원</b>
                  </div>
                  <div style="height: calc(100% - 60px); overflow-y: auto;">
                      <table class="table table-hover" style="margin-top: 0px; width: 100%;">
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
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="2" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>김철수</td>
                                  <td>A67890</td>
                                  <td>대리</td>
                                  <td>총무본부</td>
                                  <td>회계팀</td>
                              </tr>
                              <tr>
                                  <td >
                                      <input type="checkbox" name="checkbox" value="3" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>이영희</td>
                                  <td>A11223</td>
                                  <td>과장</td>
                                  <td>인사팀</td>
                                  <td>기획팀</td>
                              </tr>
                              <tr>
                                  <td >
                                      <input type="checkbox" name="checkbox" value="3" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>이영희</td>
                                  <td>A11223</td>
                                  <td>과장</td>
                                  <td>인사팀</td>
                                  <td>기획팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="3" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>이영희</td>
                                  <td>A11223</td>
                                  <td>과장</td>
                                  <td>인사팀</td>
                                  <td>기획팀</td>
                              </tr>
                          </tbody>
                      </table>
                    </div>
            </div>
            </div>
            
            <div class="btn-box-hover" style="display: flex; justify-content: center; align-items: center; margin-left:10px;">
                <div style="display: flex; flex-direction: column; align-items: center;">
                    <button class="btn3-hover" style="width:120px; height:120px;"><span style="font-size:50px">←</span><br>부서이동</button>
                    <button class="btn3-hover" style="width:120px; height:120px; color:#000000; margin-top:80px;"> <span style="font-size:50px">→</span><br>부서이동</button>
                </div>
            </div>
            

            <div style="width: 60%; height: 650px; border: #868686 solid;">
              <!-- 오른쪽 영역 내용 -->
              <div>
                  <div class="input-bar" style="width: 100%; display: flex; justify-content: flex-end; align-items: center; margin-top: 10px;">
                      <div>
                          <div class="search_box" style="margin-top:10px; width:300px; margin-right:10px;">
                              <input class="input_b" type="text" placeholder="검색">
                              <div class="icon">
                                  <button><i class="bi bi-search"></i></button>
                              </div>
                          </div>
                      </div>
                  </div>
          
                  <!-- 테이블을 감싸는 div 추가하여 높이 제한 -->
                  <div style="height: 500px; overflow-y: auto; margin-top: 30px;">
                      <table class="table table-hover" style="width: 100%; text-align: center; vertical-align: middle;">
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
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                              <tr>
                                  <td>
                                      <input type="checkbox" name="checkbox" value="1" style="width: 15px; height: 15px;">
                                  </td>
                                  <td>강개똥</td>
                                  <td>A12345</td>
                                  <td>사원</td>
                                  <td>총무본부</td>
                                  <td>재정팀</td>
                              </tr>
                          </tbody>
                      </table>
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

</body>
</html>