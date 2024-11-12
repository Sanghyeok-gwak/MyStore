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

            <!-- ó�� start -->
            <div id="topdiv"> 

              <span class="ffont1" style="font-weight: bold;">���� ��� ����</span>

              <div id="lang">
                �������
              </div>

            </div> 
            <!-- ó�� end -->
            
            <hr>

            <!-- �߰�1 start-->
            <div id="middiv"> 

              <table>
                <tr>
                  <td id="writer">�����</td>
                  <td id="writer_content">������̸�</td>
                </tr>
                <tr>
                  <td id="writer">�μ�</td>
                  <td id="writer_content">�μ���</td>
                </tr>
                <tr>
                  <td id="writer">�����</td>
                  <td id="writer_content">YYYY-MM-DD</td>
                </tr>
              </table>

              <div class="container">
                <table>
                  <tr>
                    <td id="aprr1" rowspan="5">1��</td>
                    <td id="aprr1_content">����</td>
                  </tr>
                  <tr>
                    <td id="aprr1_content2" rowspan="3">������</td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td id="aprr1_content">�μ���</td>
                  </tr>
                </table>

                <table>
                  <tr>
                    <td id="aprr1" rowspan="5">2��</td>
                    <td id="aprr1_content">����</td>
                  </tr>
                  <tr>
                    <td id="aprr1_content2" rowspan="3">������</td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td id="aprr1_content">�μ���</td>
                  </tr>
                </table>
              </div>
    
            </div> 
            <!-- �߰�1 end-->
            
            <hr>

            <!-- �߰�2 start -->
            <div id="middiv2">  
                <div id="form_title">����</div>

                <div class="input-bar" style="width: 100%;  padding-left: 10px;">
                  <input type="text" class="input-bar1" readonly>
                </div>
            </div> 
            <!-- �߰�2 end -->

            <!-- smarteditor start-->
            <div id="smarteditor" style="margin-top: 10px;">
              <textarea name="editorTxt" id="editorTxt0"
                        rows="15"
                        style="width: 100%"
              ></textarea>
            </div>
            <!-- smarteditor end-->

            <!-- ���ϴٿ�ε� start-->
            <div id="filedownload">
              <div id="file">
                ÷������
              </div>
              <div id="download">
                <c:forEach var="at" items="${ b.attachList }">
                  <a href="${ contextPath }${ at.filePath }/${ at.filesystemName }" download="${ at.originalName }">${ at.originalName }</a> 
                  <br>
                </c:forEach>
              </div>
            </div>
            <!--���ϴٿ�ε� end-->

            <!-- �� start-->
            <div id="enddiv">
              <div class="btn-box-hover">
                <button class="btn3-hover" style="width: 120px; font-size: 18px;">�����ϱ�</button>
              </div>
              <div class="btn-box-hover">
                <button class="btn1-hover" style="width: 120px; margin-left: 20px; font-size: 18px;">�ݷ��ϱ�</button>
              </div>
              <div class="btn-box-hover">
                <button class="btn2-hover" style="width: 120px; margin-left: 20px; font-size: 18px;">�ڷΰ���</button>
              </div>
            </div>
            <!-- �� end-->
            
            
          </form>

      </div>
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>