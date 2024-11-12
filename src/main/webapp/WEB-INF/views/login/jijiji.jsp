<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <div class="text-box">

          <form action="">

            <!-- 처음 start -->
            <div id="topdiv"> 

              <span class="ffont1" style="font-weight: bold;">결재 대기 문서</span>

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
                <button class="btn3-hover" style="width: 120px; font-size: 18px;">결제하기</button>
              </div>
              <div class="btn-box-hover">
                <button class="btn1-hover" style="width: 120px; margin-left: 20px; font-size: 18px;">반려하기</button>
              </div>
              <div class="btn-box-hover">
                <button class="btn2-hover" style="width: 120px; margin-left: 20px; font-size: 18px;">뒤로가기</button>
              </div>
            </div>
            <!-- 끝 end-->
            
            
          </form>

      </div>
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>