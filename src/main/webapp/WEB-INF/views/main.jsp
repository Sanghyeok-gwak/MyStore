<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	
	<script type="text/javascript" src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

    <!-- <head> 안에 추가 -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- 2.10.0 버전엔 js 파일 일부분이 없어 오류 발생 ! -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	<div class="body-body">
		<!-- 여기 채워서 작업하시면 됩니다 .-->
		<div class="text-box" >
			
			<div  style="display: flex;">
				<div>
					<div style="width: 430px; height: 400px; border: #868686 solid;">
						<div style="background-color: #EBEAEA; height: 60px; font-size: 18px; padding: 15px;">
							<b>조직도</b>
						</div>
						
						<div id="jstree"></div>
					</div>
					<!--  여기까지가 조직도 div -->
					
					
				</div>
					
					<!-- 달력 -->
						<jsp:include page="/WEB-INF/views/calendar/fullCalendar.jsp" />
					<!-- 달력 끝 -->
					
					
			</div>
			
			
			<!--  여기부터 다음api  -->	
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
			
			
			<div style="width: 30%;">
						<form action="${contextPath}/weather/coord" method="get">
						    <input type="hidden" name="lat" value="37.4765509">
						    <input type="hidden" name="lon" value="126.8801713">
						    <div class="btn-box-hover">
						        <button style="overflow-z: auto;"class="btn3-hover" type="submit">날씨 확인</button>
						    </div>
						</form>
						<div>
						    <h1>Weather Data</h1>
						    <p>${weatherData}</p>
						</div>
					</div>
			
	<div >

                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample6_postcode"  placeholder="우편번호"><br>
                <input type="text" id="sample6_address"  placeholder="주소"><br>
                <input type="text" id="sample6_detailAddress"  placeholder="상세주소"><br>
                <input type="text" id="sample6_extraAddress"  placeholder="참고항목">
            
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            
                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수
            
                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }
            
                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document.getElementById("sample6_extraAddress").value = extraAddr;
                            
                            } else {
                                document.getElementById("sample6_extraAddress").value = '';
                            }
            
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample6_detailAddress").focus();
                        }
                    }).open();
                }
            </script>
            


			
		</div>
			
			
			
			<!--  여기까지가 다음 api -->
			
			
			<!--  여기부터 스마트 에디터 -->
			<div id="smarteditor" style="margin-top: 30px;">
				<textarea name="editorTxt" id="editorTxt0" rows="20" cols="10"
					placeholder="내용을 입력해주세요"
					style="margin-top: 30px; width: 20%; height: 100px;"></textarea>
			</div>

			<!-- 여기까지가 스마트에디터 -->
			
			
			<!-- 여기부터 날씨 api -->
			<form action="${ contextPath }/weather/coord?let=37.7749&lon=-122.4194">
				
			</form>
			
			<!-- 여기부터 날씨 api 끝 -->
			
			


		</div>


	</div>
	
		<script>
			function toggleSubmenu(element) {
				const submenu = element.nextElementSibling;
				if (submenu.style.maxHeight === "0px"
						|| submenu.style.maxHeight === "") {
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
		 <script>
    let oEditors = [];
      smartEditor = function() {
          nhn.husky.EZCreator.createInIFrame({
              oAppRef: oEditors,
              elPlaceHolder: "editorTxt0", //textarea에 부여한 아이디와 동일해야한다.
              sSkinURI: "${contextPath}/smarteditor/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수정
              htParams: {
              // 입력창 크키 조절바 사용여부 (true: 사용, false: 미사용)
              bUseVerticalResizer: false,   
              },
              fCreator: "createSEditor2"
          })
      }
  
      $(document).ready(function() {
         //스마트에디터 적용
            smartEditor(); 
                //값 불러오기
            function preview(){
                // 에디터의 내용을 textarea에 적용
                oEditors.getById["editorTxt0"].exec("UPDATE_CONTENTS_FIELD", []);
                  // textarea 값 불러오기 
                var content = document.getElementById("editorTxt0").value;
                alert(content);
                return;
          }
        
      })
  </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>