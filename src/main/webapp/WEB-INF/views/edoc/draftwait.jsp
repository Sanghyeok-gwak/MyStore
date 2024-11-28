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
/**/
/* body에들어가는 양식입니다. 원페이지 이신분들은 이거 사용하신됩니다. */
.text-box {
	border-radius: 20px;
	height: 100%;
	width: 100%;
	background-color: white;
	padding: 30px;
}

.ffont1 {
	font-size: 25px;
	line-height: 30px;
	font-weight: 400;
}

.ffont2 {
	font-size: 22px;
	line-height: 30px;
	font-weight: 400;
}

.ffont3 {
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
}
/* 영역 나누려고 한거라 이건 참고안하셔도됩니다. */
.text-box1 {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

/* 일반 버튼 색상 알잘딱갈센으로 골라서 사용하시면됩니다 (*이것또한 넓이높이만 수정해서 사용하세요) */
.btn-box button {
	margin-right: 10px;
	border-radius: 5px;
	width: 120px;
	height: 30px;
	border: 0px;
}

.btn1 {
	background-color: rgb(248, 103, 103);
	color: white;
}

.btn2 {
	background-color: rgb(179, 179, 179);
	color: white;
}

.btn3 {
	background-color: rgb(72, 72, 234);
	color: white;
}
/* 버튼 호버 스타일*/
.btn-box-hover button {
	margin-right: 10px;
	border-radius: 5px;
	width: 100px;
	height: 30px;
	border: 0px;
	transition-property: background-color;
	transition-duration: 0.5s;
}

.btn1-hover {
	background-color: rgb(248, 103, 103);
	color: white;
}

.btn2-hover {
	background-color: rgb(179, 179, 179);
	color: white;
}

.btn3-hover {
	background-color: rgb(72, 72, 234);
	color: white;
}

.btn1-hover:hover {
	background-color: rgb(196, 55, 55);
	color: white;
}

.btn2-hover:hover {
	background-color: rgb(116, 116, 116);
	color: white;
}

.btn3-hover:hover {
	background-color: rgb(23, 23, 128);
	color: white;
}

/* 넓이 높이만 수정해서 사용하세요 인풋 스타일*/
input {
	border: 1px solid gray;
	border-radius: 2px;
	height: 40px;
	width: 100%;
	border-radius: 5px;
	font-size: 18px;
	box-sizing: border-box;
}

/* topdiv 스타일 start */
#topdiv {
	display: flex;
	justify-content: space-between;
}

#topdiv>#menu_name {
	font-size: 25px;
	line-height: 30px;
	font-weight: 400;
}

#lang {
	margin-left: 60px;
	width: 300px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	border-radius: 5px;
}

#modal_appr {
	margin-left: 20px;
	width: 150px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	background-color: rgb(179, 179, 179);
	color: white;
	border: 0px;
	border-radius: 5px;
	transition-property: background-color;
	transition-duration: 0.5s;
}

#modal_appr:hover {
	background-color: rgb(116, 116, 116);
	color: white;
}
/* topdiv 스타일 end */

/* middiv 스타일 start */
#middiv {
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	display: flex;
	justify-content: space-between;
}

#writer {
	background-color: #99A1EF;
	color: white;
	height: 40px;
	width: 140px;
	text-align: center;
	border-radius: 5px;
}

#writer_content {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	height: 40px;
	width: 200px;
	text-align: center;
	border-radius: 5px;
}
#aprr1 {
	background-color: #99A1EF;
	color: white;
	height: 120px;
	width: 60px;
	text-align: center;
	border-radius: 5px;
}

#aprr1_content {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	height: 20px;
	width: 120px;
	text-align: center;
	border-radius: 5px;
}

#aprr1_content2 {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	height: 80px;
	width: 120px;
	text-align: center;
	border-radius: 5px;
}

.containe11 {
	display: flex;
	gap: 30px; /* 요소 간 간격 */
	justify-content: flex-end;
	align-items: flex-end;
}

.spacer {
	margin-left: auto; /* 왼쪽 여백을 최대화하여 오른쪽으로 밀기 */
}
/* middiv 스타일 end */

/* middiv2 스타일 start */
#middiv2 {
	display: flex;
}

#form_title {
	background-color: #99A1EF;
	color: white;
	height: 40px;
	width: 140px;
	border-radius: 5px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	display: flex;
	justify-content: center;
	align-items: center;
}

#inputf {
	display: flex;
}
/* middiv2 스타일 end */

/* filedownload 스타일 start */
#filedownload {
	display: flex;
}

#file {
	background-color: #99A1EF;
	color: white;
	height: 40px;
	width: 113.75px;
	border-radius: 5px;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
	display: flex;
	justify-content: center;
	align-items: center;
}

#download {
	font-size: 18px;
	margin-left: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	line-height: 30px;
	font-weight: 400;
}
/* filedownload 스타일 end */

/* enddiv 스타일 start */
#enddiv {
	display: flex;
	justify-content: end;
}
/* enddiv 스타일 end */

.middiv-box,.middiv-box-left,.middiv-box-right{
	display:flex;
}
.middiv-box{
	margin-top:20px;
	margin-bottom:20px;
	justify-content: space-between;
	width:100%;
}
.middiv-box-right-writer-left table{
	height:100%;
}
.middiv-box-right-writer-right table{
	height:100%;
}
.middiv-box-right-writer-left{
	margin-right:15px;
}
.middiv-box-right-writer-right{
	margin-left:15px;
}
#writer_content{
	border: 1px solid lightgray;
}
#aprr1_content {
		background-color: #ffffff;
		color: rgb(0, 0, 0);
		height: 20px;
		width: 150px;
		text-align: center;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		border-left: 1px solid lightgray;
		border-right: 1px solid lightgray;
		border-radius: 5px;
		border-right: 1px solid lightgray;
	}
	#aprr1_content2 {
		background-color: #ffffff;
		color: rgb(0, 0, 0);
		height: 80px;
		width: 150px;
		border-left: 1px solid lightgray;
		border-right: 1px solid lightgray;
		text-align: center;
		border-radius: 5px;
		border-right: 1px solid lightgray;
	}
	
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/side.jsp" />
	
	<div class="body-body">
	<!-- 여기 채워서 작업하시면 됩니다 .-->
		<div class="text-box">
				<div id="topdiv" >
					<span class="ffont1" style="width:20%; font-weight: bold;">기안 대기 문서</span>

					<div id="enddiv">
						<div class="btn-box-hover"> 
							<button class="btn3-hover" style="width: 120px; font-size: 18px;" type="button" 
							onclick="openApprovalModal()">회수하기</button> 
						</div>  
						<div class="btn-box-hover"> 
							<button class="btn2-hover" style="width: 120px; margin-left: 20px; font-size: 18px;" type="button" 
							onclick="goBack()">뒤로가기</button>
						</div>
					</div>
				</div>
				<hr>
				
					<!-- 중간1 start-->
          <div id="middiv"> 

            <table>
              <tr>
                <td id="writer">기안자</td>
                <td id="writer_content">${edoc.empName}</td>
              </tr>
              <tr>
                <td id="writer">부서</td>
                <td id="writer_content">${edoc.deptName}</td>
              </tr>
              <tr>
                <td id="writer">기안일</td>
                <td id="writer_content">${edoc.startDt}</td>
              </tr>
            </table>

            <div class="containe11">
            	<c:forEach var="aprvl" items="${list}">
	              <table>
	                <tr>
	                  <td id="aprr1" rowspan="5">${aprvl.aprvlRank}차</td>
	                  <td id="aprr1_content">${aprvl.nm}</td>
	                </tr>
	                <tr>
										<td id="aprr1_content2" rowspan="3" style="position: relative;">
										    <p style="margin-top: 16px;">${aprvl.empName}</p>
										    <c:choose>
										        <c:when test="${aprvl.aprvlStatus eq 'Y'}">
										            <img src="${contextPath}/resources/images/승인.png"
										                 style="position: absolute; top: -25px; left: 10px; width: 130px;">
										        </c:when>
										        <c:when test="${aprvl.aprvlStatus eq 'R'}">
										            <img src="${contextPath}/resources/images/반려.png"
										                 style="position: absolute; top: -37px; left: 0px; width: 150px;">
										        </c:when>
										    </c:choose>
										</td>
	                </tr>
	                <tr>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td id="aprr1_content">${aprvl.deptName}</td>
	                </tr>
	              </table>
							</c:forEach>
            </div>
  
          </div> 
				
				<hr>
			
			<!-- 중간2 start -->
			<div id="middiv2">
				<div id="form_title">제목</div>

				<div class="input-bar" style="width: 100%;">
					<input type="text" class="input-bar1" value="${edoc.edocTitle}" readonly style="padding: 5px;">
				</div>
			</div>
			<!-- 중간2 end -->

			<!-- smarteditor start-->
			<div id="smarteditor" style="margin-top: 10px;">
				<textarea name="editorTxt" id="editorTxt0" rows="15" style="width: 100%"></textarea>
			</div>
			<!-- smarteditor end-->

			<!-- 파일다운로드 start-->
			<div id="filedownload">
				<div id="file">첨부파일</div>
				<div id="download">
					<c:forEach var="at" items="${ edoc.attachList }">
						<a href="${ contextPath }${ at.filePath }/${ at.attachRenameFileName }"
							download="${ at.attachOriginalName }">${ at.attachOriginalName }</a>
					</c:forEach>
				</div>
			</div>
			<!--파일다운로드 end-->

		</div>      
	</div>

<!-- 결제 모달 -->
<div class="modal-overlay" id="approvalModalOverlay">
    <div class="modal" id="approvalModal">
        <form action="${contextPath}/edoc/draftrcv.do" method="post">
            <span class="ffont1" style="width:20%; font-weight: bold;">기안서를 회수 하시겠습니까?</span>
            <c:forEach var="dto" items="${list}">
					    <input type="hidden" name="aprvlNo" value="${dto.aprvlNo}" />
					    <input type="hidden" name="empNo" value="${dto.empNo}" />
					    <input type="hidden" name="aprvlEdocNo" value="${dto.aprvlEdocNo}" />
					    <input type="hidden" name="aprvlRank" value="${dto.aprvlRank}" />
						</c:forEach>
            <input type="hidden" name="edocNo" value="${edoc.edocNo}">
            <div style="display:flex; justify-content: center; margin-top:30px;">
		          <div class="btn-box-hover"> 
								<button class="btn3-hover" style="width: 120px; font-size: 18px;" type="submit">확인</button> 
							</div> 
							<div class="btn-box-hover"> 
								<button class="btn1-hover" style="width: 120px; margin-left: 20px; font-size: 18px;" type="button"
								onclick="closeApprovalModal()">취소</button> 
							</div> 
        		</div>
        </form>
    </div>
</div>

	<script>
		let oEditors = []; // 스마트에디터 초기화 

		$(document).ready(function() {
			// DOM이 완전히 로드된 후에 스마트 에디터 초기화
			if ($("#editorTxt0").length > 0) {
				smartEditor(); // 스마트 에디터 초기화
			}

		});

		function smartEditor() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors, // 스마트 에디터 인스턴스를 oEditors 배열에 할당
				elPlaceHolder : "editorTxt0", // 스마트에디터를 띄울 textarea의 id
				sSkinURI : "${contextPath}/smarteditor/SmartEditor2Skin.html", // 스마트에디터 skin 경로
				htParams : {
					bUseToolbar : false, // 툴바 사용여부 (true: 사용, false: 미사용)
					bUseVerticalResizer : false,
					// 입력창 크기 조절바 사용여부 (true: 사용, false: 미사용)
					bUseModeChanger : false
					// 모드 탭(Editor | HTML | TEXT) 사용여부 (true: 사용, false: 미사용)
				},
				fCreator : "createSEditor2"
			});
		}

		$(document).ready(
				function() {
					// 서버에서 전달된 edoc.content 값을 스마트에디터에 삽입
					var initialContent = "${edocContent}";

					if (initialContent) {
						// 스마트에디터가 정상적으로 초기화되었을 때
						setTimeout(function() {
							oEditors.getById["editorTxt0"].exec("SET_CONTENTS",
									[ initialContent ]);

							// 읽기 전용 설정
							oEditors.getById["editorTxt0"]
									.exec("DISABLE_WYSIWYG");

						}, 500); // 조금 지연시켜서 스마트에디터가 완전히 로드된 후에 내용 삽입
					}
				});

		function preview() {
			// 에디터의 내용을 textarea에 적용
			if (oEditors.length > 0) {
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []); // 첫 번째 스마트에디터 인스턴스 접근
				// textarea 값 불러오기
				var content = document.getElementById("editorTxt0").value;
				alert(content);
			}
		}
	</script>
	
<script>
    function openApprovalModal() {
        document.getElementById('approvalModalOverlay').style.display = 'block';
        document.getElementById('approvalModal').style.display = 'block';
    }

    function closeApprovalModal() {
        document.getElementById('approvalModalOverlay').style.display = 'none';
        document.getElementById('approvalModal').style.display = 'none';
    }

    function goBack() {
        window.history.back();
    }
</script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

<style>
	/* 모달 기본 스타일 */
       .modal {
           display: none; /* 기본적으로 숨김 */
           position: fixed; /* 화면 고정 */
           z-index: 1000; /* 다른 요소보다 위에 표시 */
           left: 50%;
           top: 50%;
           transform: translate(-50%, -50%);
           width: 500px; /* 원하는 너비 조정 */
           height: 150px;
           background-color: white;
           box-shadow: 0 5px 15px rgba(0,0,0,.5);
           padding: 20px;
           border-radius: 8px;
       }

       /* 모달을 화면 전체에 반투명 배경으로 감싸기 */
       .modal-overlay {
           display: none; /* 기본적으로 숨김 */
           position: fixed;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
           background: rgba(0, 0, 0, 0.5);
           z-index: 999; /* 모달 창보다 낮게 설정 */
       }
       
         .modal-header {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .modal textarea {
            width: 100%;
            height: 100px;
            resize: none; /* 크기 조절 비활성화 */
            margin-bottom: 10px;
            margin-top: 20px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 0.5rem;
        }

        .modal-footer button {
            padding: 0.5rem 1rem;
        }
</style>
</html>