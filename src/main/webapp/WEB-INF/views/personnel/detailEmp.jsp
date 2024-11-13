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
      .product-img-box,.input-box-top,.input-box-body{
        border-radius: 20px;
        background-color: white;
        padding:30px;
      }
      .body-body{
        display: flex;
        flex-direction: column;
      }
      .product-add-top{
        display: flex;
        margin-bottom: 20px;
        height: 100%;
      }
      .product-img-box{
        width: 30%;
        margin-right: 20px;
        height: 400px;
      }
      .input-box-top{
        width: 70%;
        height: 100%;
      }
      .product-add-body,.input-box-body{
        height: 100%;
      }
      .upload-image {
          height: 100%;
          width: 100%;
      }
      .input-box-top{
            display: flex;
            flex-direction: column;
            height: 100%;
          }
          .input-box-top-box1,.input-box-top-box2,.input-box-top-box3,.input-box-top-box4,.input-box-top-box5
          ,.input-box-top-box6,.input-box-top-box7,.input-box-top-box8{
            display: flex;
            margin-bottom: 30px;
          }
          .input-box-top-box1-text,.input-box-top-box2-text,.input-box-top-box3-text,.input-box-top-box4-text,.input-box-top-box5-text
          ,.input-box-top-box6-text,.input-box-top-box7-text,.input-box-top-box8-text{
            width: 30%;
          
          }
          .input-box-top-box1-input,.input-box-top-box2-input,.input-box-top-box3-input,.input-box-top-box4-input,.input-box-top-box5-input
          ,.input-box-top-box6-input,.input-box-top-box7-input,.input-box-top-box8-input{
            width: 70%;
          }
          .input-box-top input{
            height: 30px;
            width: 100%;
            border: 1px solid lightgray;
            padding-left:10px;
          }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      <div class="product-add-top">
        <div class="product-img-box">
          <div class="upload-image" onclick="document.getElementById('fileInput').click()" style="cursor: pointer;">
            <img id="preview" src="/assets/img/sooz2.png" alt="Click to upload" style="width: 100%; height: 100%;">
          </div>
          <!--
          <input type="file" id="fileInput" accept="image/*" style="display: none;" onchange="handleFileUpload(event)">
            <script>
              function handleFileUpload(event) {
                const file = event.target.files[0];
                if (file) {
                  const reader = new FileReader();
                  reader.onload = function(e) {
                    document.getElementById('preview').src = e.target.result;
                  };
                  reader.readAsDataURL(file);
                }
              }
            </script>
            -->
        </div>
        <!-- <style>
          .input-box-top{
            display: flex;
            flex-direction: column;
            height: 100%;
          }
          .input-box-top-box1,.input-box-top-box2,.input-box-top-box3,.input-box-top-box4,.input-box-top-box5
          ,.input-box-top-box6,.input-box-top-box7,.input-box-top-box8{
            display: flex;
            margin-bottom: 30px;
          }
          .input-box-top-box1-text,.input-box-top-box2-text,.input-box-top-box3-text,.input-box-top-box4-text,.input-box-top-box5-text
          ,.input-box-top-box6-text,.input-box-top-box7-text,.input-box-top-box8-text{
            width: 30%;
          
          }
          .input-box-top-box1-input,.input-box-top-box2-input,.input-box-top-box3-input,.input-box-top-box4-input,.input-box-top-box5-input
          ,.input-box-top-box6-input,.input-box-top-box7-input,.input-box-top-box8-input{
            width: 70%;
          }
          .input-box-top input{
            height: 30px;
            width: 100%;
            border: 1px solid lightgray;
          }
        </style> -->
        <div class="input-box-top">
          <div class="input-box-top-box1">
            <div class="input-box-top-box1-text">
              <span class="ffont3">부서</span>
            </div>
            <div class="input-box-top-box1-input">
              <input type="text"  value="인사과">
            </div>
          </div>
          <div class="input-box-top-box2">
            <div class="input-box-top-box2-text">
              <span class="ffont3">성명</span>
            </div>
            <div class="input-box-top-box2-input">
              <input type="text" value="배수지">
            </div>
          </div>
          <div class="input-box-top-box3">
            <div class="input-box-top-box3-text">
              <span class="ffont3">사번</span>
            </div>
            <div class="input-box-top-box3-input">
              <input type="text" value="10001">
            </div>
          </div>
          <div class="input-box-top-box4">
            <div class="input-box-top-box4-text">
              <span class="ffont3">휴대폰</span>
            </div>
            <div class="input-box-top-box4-input">
              <input type="text" value="010-8785-4542">
            </div>
          </div>
          <div class="input-box-top-box5">
            <div class="input-box-top-box5-text">
              <span class="ffont3">이메일</span>
            </div>
            <div class="input-box-top-box5-input">
              <input type="text" value="sooz2@gmail.com">
            </div>
          </div>
          <div class="input-box-top-box6">
            <div class="input-box-top-box6-text">
              <span class="ffont3">주민등록번호</span>
            </div>
            <div class="input-box-top-box6-input">
              <input type="text" value="020303-2********">
            </div>
          </div>
          <div class="input-box-top-box7">
            <div class="input-box-top-box7-text">
              <span class="ffont3">계좌번호</span>
            </div>
            <div class="input-box-top-box7-input">
              <input type="text" value="국민은행 940204-00-015942" >
            </div>
          </div>
          
          <div class="input-box-top-box8">
            <div class="input-box-top-box6-text">
              <span class="ffont3">주소</span>
            </div>
            <div class="input-box-top-box6-input">
              <input type="text" value="서울시 서울구 서울동 ">
            </div>
          </div>
          


          <div class="input-box-top-box8">

                <br>

				<!-- 팀장님 버튼 가져와야됨  -->
                <div class="btn-box-hover" style="display: block; justify-content: center; margin-left: 200px; ">
                    <button class="btn3-hover ffont3" style="width: 300px; height: 35px; ">수정하기</button> 
                    <button class="btn3-hover ffont3" style="width: 300px; height: 35px;">홈으로</button> 
                </div>
                

            </div>
            
        </div>



      </div>
      
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>