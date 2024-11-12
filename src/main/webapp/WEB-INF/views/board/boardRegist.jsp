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
<!-- 네이버 스마트에디터  -->
    <script type="text/javascript" src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

    <!-- <head> 안에 추가 -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- 2.10.0 버전엔 js 파일 일부분이 없어 오류 발생 ! -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
        <!-- 여기 채워서 작업하시면 됩니다 .-->
      <div class="text-box">
       
        <div class="text-box1">
          <div>
            <div style="font-size:18px; ">
              <b>수정</b>
            </div>
            
            
            <div class="d-flex" style="display: flex; justify-content: space-between; align-items: center; margin-top: 50px;">
                <div class="input-bar" style="display: flex; align-items: center; margin-right: 10px;">
                    <input type="text" class="input-bar1" placeholder="제목을 입력하세요" style="height: 30px; padding: 5px;"/>
                </div>
                <div  class="btn-box-hover">
                <button class="btn3-hover" style="height: 40px; padding: 5px 15px;">글 등록</button>
            </div>
            </div>
          <form action="insertStudentInfoForm" method="post">
           <div id="smarteditor" style="margin-top:30px;">
            <textarea name="editorTxt" id="editorTxt0" rows="20" cols="10"
                      placeholder="내용을 입력해주세요"
                      style="margin-top:30px; width: 100%; height: 500px; "></textarea>
           </div>

          </form>

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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>