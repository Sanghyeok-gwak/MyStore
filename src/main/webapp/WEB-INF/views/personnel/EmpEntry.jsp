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
          }
    </style>
       <!-- 다음주소API-->
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
      <div class="product-add-top">
        <br>
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
        </style>
 -->
        <div class="input-box-top">
          <div class="input-box-top-box1">
            <div class="input-box-top-box1-text">
              <span class="ffont3">부서</span>
            </div>
            <div class="input-box-top-box1-input">
              <input type="text">
            </div>
          </div>


          <div class="input-box-top-box2">
            <div class="input-box-top-box2-text">
              <span class="ffont3">성명</span>
            </div>
            <div class="input-box-top-box2-input">
              <input type="text">
            </div>
          </div>


          <div class="input-box-top-box3">
            <div class="input-box-top-box3-text">
              <span class="ffont3">사번(자동생성)</span>
            </div>
            <div class="input-box-top-box3-input">
              <input type="text">
            </div>
          </div>


          <div class="input-box-top-box4">
            <div class="input-box-top-box4-text">
              <span class="ffont3">휴대폰</span>
            </div>
            <div class="input-box-top-box4-input">
              <input type="text">
            </div>
          </div>


          <div class="input-box-top-box5">
            <div class="input-box-top-box5-text">
              <span class="ffont3">이메일</span>
            </div>
            <div class="input-box-top-box5-input">
              <input type="text">
            </div>
          </div>


          <div class="input-box-top-box6">
            <div class="input-box-top-box6-text">
              <span class="ffont3">주민등록번호</span>
            </div>
            <div class="input-box-top-box6-input">
              <input type="text">
            </div>
          </div>


          <div class="input-box-top-box7">
            <div class="input-box-top-box7-text">
              <span class="ffont3">계좌번호</span>
            </div>
            <div class="input-box-top-box7-input">
              <input type="text">
            </div>
          </div>


          <div class="input-box-top-box8">
            <div class="input-box-top-box6-text">
              <span class="ffont3">주소</span>
            </div>

            <div class="">
              <body>

                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-bottom: 3%;"><br>
                <input type="text" id="sample6_postcode" style="margin-bottom: 3%;" placeholder="우편번호">
                <input type="text" id="sample6_address" style="margin-bottom: 3%;" placeholder="주소"><br>
                <input type="text" id="sample6_detailAddress" style="margin-bottom: 3%;" placeholder="상세주소">
                <input type="text" id="sample6_extraAddress" style="margin-bottom: 3%;" placeholder="참고항목" hidden>
            
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            
                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수
            
                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }
            
                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document.getElementById("sample6_extraAddress").value = extraAddr;
                            
                            } else {
                                document.getElementById("sample6_extraAddress").value = '';
                            }
            
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample6_detailAddress").focus();
                        }
                    }).open();
                }
            </script>
            
            </body>
              
            </div>
          </div>

          
          




          <div class="input-box-top-box8">

                <br>

                <div class="btn-box-hover" style="display: flex; justify-content: center;">
                    <button class="btn3-hover ffont3" style="width: 373px; height: 35px;">등록하기</button> 
                    <button class="btn3-hover ffont3" style="width: 373px; height: 35px;">홈으로</button> 
                </div>
                
                
              </div>
              
            </div>
            
            
            
      </div>
      
</div>

 <!-- <script>

    /*주소검색 다음api 스크립트*/
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }



  </script> -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>