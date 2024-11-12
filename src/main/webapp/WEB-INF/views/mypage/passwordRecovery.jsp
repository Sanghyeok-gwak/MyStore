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
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      <div class="text-box">

        <div class="" style="margin-top: 7%">

          <div class="card-body" style=" display: block; justify-content: center; width: 700px; margin: auto;">

            <h3 class="text-center ffont1">비밀번호 변경</h3>
            <br>
            <p class="text-center ffont3">
              비밀번호는 0~12자리의 대문자, 소문자, 특수문자 중 2종류 이상을 조합하여 사용해야 합니다.
            </p>

            <br>

            <form>

              <div class="form-group mb-4">
                <label for="currentPassword" class="ffont3">현재 비밀번호</label>
                <input name="password" type="password" class="form-control" id="currentPassword" placeholder="현재 비밀번호 입력">
              </div>

              <div class="form-group mb-4">
                <label for="newPassword" class="ffont3">변경할 비밀번호</label>
                <input name="newPassword" type="password" class="form-control" id="newPassword" placeholder="새 비밀번호 입력">
              </div>

              <div class="form-group mb-4">
                <label for="confirmPassword" class="ffont3">변경할 비밀번호 확인</label>
                <input name="confirmPassword" type="password" class="form-control" id="confirmPassword" placeholder="비밀번호 확인 입력">
              </div>

              <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary ffont3 me-3" style="width: 200px;">수정하기</button>
                <button type="button" class="btn btn-secondary ffont3" style="width: 200px;">홈으로</button>
              </div>

            </form>
          </div>
        </div>
      </div>
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>