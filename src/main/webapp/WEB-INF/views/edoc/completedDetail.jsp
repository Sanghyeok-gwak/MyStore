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
/**/
    /* body에들어가는 양식입니다. 원페이지 이신분들은 이거 사용하신됩니다. */
    .text-box{
      border-radius: 20px;
      height: 100%;
      width: 100%;
      background-color: white;
      padding:30px;
    }
    .ffont1{
      font-size: 25px;
      line-height: 30px;
      font-weight: 400;
    }
    .ffont2{
      font-size: 22px;
      line-height: 30px;
      font-weight: 400;
    }
    .ffont3{
      font-size: 18px;
      line-height: 30px;
      font-weight: 400;
    }
    /* 영역 나누려고 한거라 이건 참고안하셔도됩니다. */
    .text-box1{
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
    }

    /* 일반 버튼 색상 알잘딱갈센으로 골라서 사용하시면됩니다 (*이것또한 넓이높이만 수정해서 사용하세요) */
    .btn-box button{
      margin-right: 10px;
      border-radius: 5px;
      width: 120px;
      height: 30px;
      border: 0px;
    }
    .btn1{
      background-color: rgb(248, 103, 103);
      color: white;
    }
    .btn2{
      background-color: rgb(179, 179, 179);
      color: white;
    }
    .btn3{
      background-color: rgb(72, 72, 234);
      color: white;
    }
    /* 버튼 호버 스타일*/
    .btn-box-hover button{
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
    input{
      border: 1px solid gray;
      border-radius: 2px;
      height: 40px;
      width: 100%;
      border-radius: 5px;
      font-size: 18px;
      box-sizing: border-box;
    }

    /* topdiv 스타일 start */
    #topdiv{
      display: flex;
    }

    #topdiv > #menu_name{
      font-size: 25px;
      line-height: 30px; 
      font-weight: 400;
    }
    #lang{
      margin-left: 60px;
      width: 300px;
      font-size: 18px;
      line-height: 30px; 
      font-weight: 400;
      
      border-radius: 5px;
    }
    #modal_appr{
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
    #middiv{
      font-size: 18px;
      line-height: 30px; 
      font-weight: 400;
      display: flex;
    }
    #writer {
      background-color: #99A1EF;
      color: white;
      height: 40px;
      width: 140px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #writer_content {
      background-color: #ffffff;
      color: rgb(0, 0, 0);
      height: 40px;
      width: 200px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #aprr1{
      background-color: #99A1EF;
      color: white;
      height: 120px;
      width: 60px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #aprr1_content{
      background-color: #ffffff;
      color: rgb(0, 0, 0);
      height: 20px;
      width: 120px;
      text-align: center;
      border-top: 1px solid rgb(92, 91, 91);
      border-bottom: 1px solid rgb(92, 91, 91);
      border-radius: 5px;
    }
    #aprr1_content2{
      background-color: #ffffff;
      color: rgb(0, 0, 0);
      height: 80px;
      width: 120px;
      text-align: center;
      border-radius: 5px;
    }
    .container {
    display: flex;
    gap: 30px; /* 요소 간 간격 */
    justify-content: flex-end;
    align-items: flex-end
    }
    .spacer {
    margin-left: auto; /* 왼쪽 여백을 최대화하여 오른쪽으로 밀기 */
    }
    /* middiv 스타일 end */


    /* middiv2 스타일 start */
    #middiv2{
      display: flex;
    }
    #form_title{
      background-color: #99A1EF;
      color: white;
      height: 40px;
      width: 140px;
      border-radius: 5px;
      font-size: 18px;
      line-height: 30px; 
      font-weight: 400;
      display : flex;
      justify-content : center;
      align-items : center;
    }
    #inputf{
      display: flex;
    }
    /* middiv2 스타일 end */


    /* filedownload 스타일 start */
      #filedownload{
        display: flex;
      }
      #file{
        background-color: #99A1EF;
        color: white;
        height: 40px;
        width: 113.75px;
        border-radius: 5px;
        font-size: 18px;
        line-height: 30px; 
        font-weight: 400;
        display : flex;
        justify-content : center;
        align-items : center;
      }
      #download{
        font-size: 18px; 
        margin-left: 20px;
        display: flex;
        justify-content : center;
        align-items : center;
        line-height: 30px; 
        font-weight: 400;
      }
    /* filedownload 스타일 end */


   /* enddiv 스타일 start */
    #enddiv{
      margin-top: 40px;
      display: flex;
    }
   /* enddiv 스타일 end */
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
<!-- 여기 채워서 작업하시면 됩니다 .-->
<div class="text-box">

          <form action="">

            <!-- 처음 start -->
            <div id="topdiv"> 

              <span class="ffont1" style="font-weight: bold;">결재 완료 문서</span>

              <div id="lang">
                양식유형
              </div>

            </div> 
            <!-- 처음 end -->
            
            <hr>

            <!-- 중간1 start-->
            <div id="middiv"> 

              <table>
                <tr>
                  <td id="writer">기안자</td>
                  <td id="writer_content">기안자이름</td>
                </tr>
                <tr>
                  <td id="writer">부서</td>
                  <td id="writer_content">부서명</td>
                </tr>
                <tr>
                  <td id="writer">기안일</td>
                  <td id="writer_content">YYYY-MM-DD</td>
                </tr>
              </table>

              <div class="container">
                <table>
                  <tr>
                    <td id="aprr1" rowspan="5">1차</td>
                    <td id="aprr1_content">직급</td>
                  </tr>
                  <tr>
                    <td id="aprr1_content2" rowspan="3">결재자</td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td id="aprr1_content">부서명</td>
                  </tr>
                </table>

                <table>
                  <tr>
                    <td id="aprr1" rowspan="5">2차</td>
                    <td id="aprr1_content">직급</td>
                  </tr>
                  <tr>
                    <td id="aprr1_content2" rowspan="3">결재자</td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td id="aprr1_content">부서명</td>
                  </tr>
                </table>
              </div>
    
            </div> 
            <!-- 중간1 end-->
            
            <hr>

            <!-- 중간2 start -->
            <div id="middiv2">  
                <div id="form_title">제목</div>

                <div class="input-bar" style="width: 100%;  padding-left: 10px;">
                  <input type="text" class="input-bar1" readonly>
                </div>
            </div> 
            <!-- 중간2 end -->

            <!-- smarteditor start-->
            <div id="smarteditor" style="margin-top: 10px;">
              <textarea name="editorTxt" id="editorTxt0"
                        rows="15"
                        style="width: 100%"
              ></textarea>
            </div>
            <!-- smarteditor end-->

            <!-- 파일다운로드 start-->
            <div id="filedownload">
              <div id="file">
                첨부파일
              </div>
              <div id="download">
                <c:forEach var="at" items="${ b.attachList }">
                  <a href="${ contextPath }${ at.filePath }/${ at.filesystemName }" download="${ at.originalName }">${ at.originalName }</a> 
                  <br>
                </c:forEach>
              </div>
            </div>
            <!--파일다운로드 end-->

            <!-- 끝 start-->
            <div id="enddiv">
              <div class="btn-box-hover">
                <button class="btn3-hover" style="width: 120px; font-size: 18px;">뒤로가기</button>
              </div>
            </div>
            <!-- 끝 end-->
            
            
          </form>

      </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>