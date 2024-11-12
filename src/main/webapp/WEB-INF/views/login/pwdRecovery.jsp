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
      @import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Noto+Sans+KR:wght@100..900&display=swap");

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      .my_body {
        display: flex;
        height: calc(100vh);
      }
      .body_left {
        width: 65%;
        height: 100%;
        background-color: rgba(153, 161, 239, 1);
        display: flex;
        flex-direction: column;
      }
      .body_right {
        flex: 1;
        background-color: rgb(255, 255, 255);
        box-shadow: -20px 0px 8px 20px #ffffff;
        z-index: 1;
        height: 100%;
        width: 100%;
        display: flex;
        align-items: center;
      }
      .body_right1 {
        width: 100%;
        display: flex;
        justify-content: center;
      }
      .body_right_list {
        width: 546px;
        padding-right: 20px;
      }
      .login_logo {
        height: 100%;
        width: 100%;
        display: flex;
        align-items: center;
      }
      .img_controller {
        display: flex;
        justify-content: center;
      }
      .login_logo img {
        width: 45%;
        height: 11%;
      }
      .right_login {
        font-size: 40px;
        margin-bottom: 40px;
      }
      .right_id {
        display: flex;
        border: 1px solid rgb(153, 161, 239, 1);
        border-radius: 3px;
        margin-top: 10px;
        padding: 0px 0px 0px 24px;
        align-items: center;
        color: gray;
      }
      .input-bar1 {
        border: none;
        outline: none;
        box-shadow: none;
        margin-left: 62px;
        height: 40px;
        width: 400px;
      }
      #right_pwd {
        border: none;
        outline: none;
        box-shadow: none;
        margin-left: 30px;
        height: 40px;
      }
      .btn-primary {
        margin-top: 30px;
        height: 50px;
        --bs-btn-color: #fff;
        --bs-btn-bg: rgb(153, 161, 239, 1);
        --bs-btn-border-color: #ffffff;
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: rgb(121, 128, 189);
        --bs-btn-hover-border-color: rgb(121, 128, 189);
        --bs-btn-focus-shadow-rgb: 49, 132, 253;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: rgb(121, 128, 189);
        --bs-btn-active-border-color: rgb(121, 128, 189);
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #0d6efd;
        --bs-btn-disabled-border-color: #0d6efd;
      }
    </style>

</head>
  <body>
    <div class="my_body">
      <!-- 왼쪽 백그라운드 및 로고 -->
      <div class="body_left">
        <div class="login_logo">
          <div class="img_controller">
            <img src="/Group 8819.png" alt="" />
          </div>
        </div>
      </div>

      <div class="body_right">
        <div class="body_right1">
          <div class="body_right_list">
            <div class="right_login">비밀번호 찾기</div>
            <div class="right_id">
              사번
              <div class="input-bar">
                <input
                  type="text"
                  class="input-bar1"
                  placeholder="사번을 입력해주세요"
                />
              </div>
            </div>
            <div class="right_id">
              이메일&nbsp;&nbsp;&nbsp;&nbsp;
              <div class="input-bar">
                <input
                  type="text"
                  class="input-bar1"
                  id="right_pwd"
                  placeholder="abc@admin.com"
                />
              </div>
            </div>

            <div class="login_btn">
              <div class="d-grid gap-2 mt-3">
                <button class="btn btn-primary" type="button">
                  비밀번호 전송
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>