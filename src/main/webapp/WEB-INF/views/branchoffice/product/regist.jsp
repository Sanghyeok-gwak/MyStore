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
            <img id="preview" src="https://i.ibb.co/25hzpPd/Component-5.png" alt="Click to upload" style="width: 100%; height: 100%;">
          </div>
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
        </div>
        <style>
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
        </style>
        <div class="input-box-top">
          <div class="input-box-top-box1">
            <div class="input-box-top-box1-text">
              <span class="ffont3">분류</span>
            </div>
            <div class="input-box-top-box1-input">
              <input type="text">
            </div>
          </div>
          <div class="input-box-top-box2">
            <div class="input-box-top-box2-text">
              <span class="ffont3">상품코드</span>
            </div>
            <div class="input-box-top-box2-input">
              <input type="text">
            </div>
          </div>
          <div class="input-box-top-box3">
            <div class="input-box-top-box3-text">
              <span class="ffont3">상품명</span>
            </div>
            <div class="input-box-top-box3-input">
              <input type="text">
            </div>
          </div>
          <div class="input-box-top-box4">
            <div class="input-box-top-box4-text">
              <span class="ffont3">원가</span>
            </div>
            <div class="input-box-top-box4-input">
              <input type="text">
            </div>
          </div>
          <div class="input-box-top-box5">
            <div class="input-box-top-box5-text">
              <span class="ffont3">매가</span>
            </div>
            <div class="input-box-top-box5-input">
              <input type="text">
            </div>
          </div>
          <div class="input-box-top-box6">
            <div class="input-box-top-box6-text">
              <span class="ffont3">유효기간</span>
            </div>
            <div class="input-box-top-box6-input">
              <input type="text">
            </div>
          </div>
          <div class="input-box-top-box7">
            <div class="input-box-top-box7-text">
              <span class="ffont3">발주요일</span>
            </div>
            <div class="input-box-top-box7-input">
              <input type="text">
            </div>
          </div>
          <div class="input-box-top-box8">
            <div class="input-box-top-box8-text">
              <span class="ffont3">사용유무</span>
            </div>
            <div class="input-box-top-box8-input">
                <label>
                  <input type="radio" name="option" value="Y" checked>사용
                </label>
                <label>
                  <input type="radio" name="option" value="N" >숨김
                </label>
            </div>
          </div>
          <div class="input-box-top-box8">
            <div class="input-box-top-box8-text">
              <span class="ffont3">추천여부</span>
            </div>
            <div class="input-box-top-box8-input">
                <label>
                  <input type="radio" name="option" value="1" checked>별1
                </label>
                <label>
                  <input type="radio" name="option" value="2" >별2
                </label>
                <label>
                  <input type="radio" name="option" value="3" >별3
                </label>
            </div>
            <style>
               .btn4{
                  border-radius: 5px;
                  width: 100px;
                  border: 0px;
                  color: black;
                  background-color: white;
                  border: 1px solid lightgray;
                }
                .btn-add{
                  margin-top: 30px;
                  display: flex;
                  justify-content: end;
                }
            </style>
            
          </div>
          <div class="btn-add">
            <button class="btn4">등록하기</button>
          </div>
        </div>
      </div>  
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>