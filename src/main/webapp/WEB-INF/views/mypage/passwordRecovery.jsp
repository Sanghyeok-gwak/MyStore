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
	/* 유효성검사 폰트*/
	.smallfont {font-size: 0.9em;}
	.uncheck {display:none} /*유효성검사 전일 경우*/
	.unusable {color: red;} /*사용불가능일 경우*/
	.usable {color: green;} /*사용 가능일 경우*/
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <div class="span-box" style="text-align:center; margin-bottom:20px;">
	            <span class="ffont3" >
	            	비밀번호는 8~15자리의
	            </span>
	            <span class="ffont2" style="color:red;">
	            	영문, 숫자, 특수문자
	            </span>
	            <span class="ffont3"></span>
	            <span class="ffont2" style="color:red;">3종류</span>
	            <span class="ffont3" >를 <br>조합하여 사용해야 합니다.</span>
            </div>

            <br>

              <form  action="${ contextPath }/mypage/passwordRecovery" method="post" id="passwd_form">

              <div class="form-group mb-4">
                <label for="EmpPwd" class="ffont3">현재 비밀번호</label>
                <input name="EmpPwd" type="password" class="form-control" id="currentPassword" placeholder="현재 비밀번호 입력">
                <!-- 유효성검사하는 div 로그인세션이랑 비교해야됨-->
                <div id="currentPwdCheck_result" class ="uncheck smallfont"></div>
              </div>

              <div class="form-group mb-4">
                <label for="newPassword" class="ffont3">변경할 새 비밀번호</label>
                <input name="newPassword" type="password" class="form-control" id="newPassword" placeholder="새 비밀번호 입력">
                 <!-- 유효성검사하는 div 특수문자까지 포함 -->
                <div id="pwdCheck_result" class ="uncheck smallfont"></div>
              </div>

              <div class="form-group mb-4">
                <label for="confirmPassword" class="ffont3">변경할 새 비밀번호 확인</label>
                <input name="confirmPassword" type="password" class="form-control" id="confirmPassword" placeholder="비밀번호 확인 입력">
                 <!-- 유효성검사하는 div -->
                <div id="pwdEqualCheck_result" class ="uncheck smallfont"></div>
              </div>

              <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary ffont3 me-3" style="width: 200px;" disabled>수정하기</button>
                <button type="button" class="btn btn-secondary ffont3" style="width: 200px;">홈으로</button>
              </div>

            </form>
            
            <script>
			  
              // 각 항목의 값들이 유효한값으로 입력되면 true 변경됨
              let currentPwdCheck_result = false;
              let pwdCheck_result = false;
              let pwdEqualCheck_result = false;
              
              // input요소들 유효성검사때마다 수정하기 버튼을 활성화 또는 비활성화 처리해주는 함수
              function validate(){
            	if(currentPwdCheck_result && pwdCheck_result && pwdEqualCheck_result){ // 모든 값들이 다 유효한 값일 경우
            	  $('#passwd_form :submit').removeAttr('disabled'); // 수정하기버튼 활성화
            	}else{
            	  $('#passwd_form :submit').attr('disabled', true); // 수정하기버튼 비활성화
            	}
              }
              
              // input요소에 작성된 값이 없는지 체크해주는 함수 (j쿼리 사용)
              function noValueCheck($input, $result){ // 비교할 input요소객체, 메세지출력되는 div요소객체
            	if($input.val().trim().length == 0){ // 값이 비어있을 경우
            	  $result.removeClass("usable unusable")
            	  		 .addClass("uncheck")
            	  		 .text(""); // uncheck 활성화 (결과 영역 출력 숨기기)
            	  return false; // 유효성 검사를 진행할 필요가 없기 때문에 false 반환
            	}
              	return true;	// 유효성 검사를 진행하도록 true 반환
              }
              
              // input요소에 작성된 값이 정규식(유효한패턴)에 만족하는지 체크해주는 함수
              function regExpCheck($input, $result, regExp, msg1, msg2){
            	if(regExp.test($input.val())){ // 유효한값으로 잘 입력됐을 경우
            	 $result.removeClass("uncheck unusable")
            	 		.addClass("usable")
            	 		.text(msg1);
            	  return true;
            	}else{ // 유효하지 않은 값으로 입력됐을 경우 
				 $result.removeClass("uncheck usable")
				 		.addClass("unusable")
				 		.text(msg2);
            	  return false;
            	}
              }
              
              $(function() {
            	    // 현재비밀번호 유효성 검사
            	    $("#passwd_form #currentPassword").on("keyup", function() {
            	        currentPwdCheck_result = noValueCheck($(this), $("#currentPwdCheck_result"));
            	        
            	        if (currentPwdCheck_result) {
            	            $.ajax({
            	                url: '${contextPath}/mypage/pwdcheck.do',
            	                type: "GET",
            	                data: { checkpwd: $(this).val() }, // 데이터 전송 형식 수정
            	                success: function(resData) {
            	                    if (resData === "YYYYY") {
            	                        $("#currentPwdCheck_result").removeClass("uncheck unusable")
            	                                                     .addClass("usable")
            	                                                     .text("현재 비밀번호와 일치합니다.");
            	                        currentPwdCheck_result = true;
            	                    } else {
            	                        $("#currentPwdCheck_result").removeClass("uncheck usable")
            	                                                     .addClass("unusable")
            	                                                     .text("현재 비밀번호와 다릅니다. 다시 입력해주세요.");
            	                        currentPwdCheck_result = false;
            	                    }
            	                    validate(); // 유효성 검사 호출
            	                }
            	            });
            	        } else {
            	            validate();
            	        }
            	    }); // pwd check end

            	
            	// 비밀번호 유효성검사
            	$("#passwd_form #newPassword").on("keyup", function(){
            		let regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,15}$/;	
            	  
            	  pwdCheck_result = noValueCheck( $(this), $("#pwdCheck_result") )
            	  			  && regExpCheck( $(this), $("#pwdCheck_result")
            	  					  				 , regExp, '사용가능한 비밀번호입니다.'
		            	  					  				 , '영문, 숫자, 특수문자포함 8~15자리로 작성해주세요.' )
		          validate();
            	  
            	}) // pwd check end
            	
            	// 비밀번호확인 유효성검사
            	$("#passwd_form #confirmPassword").on("keyup", function(){
            		
            	  let regExp = new RegExp("^" + $("#passwd_form #newPassword").val() + "$");	
            	  
            		
            	  pwdEqualCheck_result = pwdCheck_result && noValueCheck( $(this), $("#pwdEqualCheck_result") )
            	  								   && regExpCheck( $(this), $("#pwdEqualCheck_result")
            	  					               						  , regExp, '비밀번호가 일치합니다.'
            	  					                		   			  , '비밀번호가 일치하지 않습니다.');
            		validate();
            	})  
            	
            	
              })
              
              
            
            </script>
            
            
          </div>
          
        </div>
        
      </div>
      
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>