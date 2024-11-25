<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 네이버 스마트에디터  -->
<script type="text/javascript"
src="${contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
      .note-box{
        display: flex;
        height: 100%;
      }

      .note-side,.note-body{
        border-radius: 20px;
        padding:30px;
        background-color: white;
      }
      .note-side{
        width: 20%;
        height: 100%;
        margin-right: 10px;
	    }
	    .note-body{
	        width: 80%;
	        height: 100%;
	        margin-left: 10px;
	      }
	    .note-side-text{
	        text-align: left;
	    }  
	    hr{
	        margin-top: 10px;
	        margin-bottom: 10px;
	    }
	    .note-side-btn{
	        width: 100%;
	        margin-bottom: 20px;
	    }
	    .note-side-btn button{
	        width: 100%;
	        height: 45px;
	    }
	    .note-side-a-box ul{
	        list-style-type: none;
	    }
	    .note-side-a-box ul>li{
	        border-radius: 5px;
	        width: 100%;
	        height: 50px;
	        padding: 10px;
	        padding-left: 5px;
	        border-bottom: 1px solid lightgray;
	    }
	    .note-side-a-box ul>li a{
	        text-decoration: none;
	        color: black;
	    }
	    .note-side-a-box ul>li:hover{
	        background-color: rgb(219, 219, 219);
	    }
	    .table-box table{
	        width: 100%;
	    }
	    .pagination .page-link {
		   color: rgba(109, 105, 108, 1);
		   background-color: white;
		   border: none;
		 }
		
		 .pagination .page-item.active .page-link {
		   border: 1px solid red;
		   color: red;
		   background-color: white;
		 }
		 .note-box{
        display: flex;
        height: 100%;
      }

      .note-side,.note-body{
        border-radius: 20px;
        padding:30px;
        background-color: white;
      }
      .note-side{
        width: 20%;
        height: 100%;
        margin-right: 10px;
    }
    .note-body{
        width: 80%;
        height: 100%;
        margin-left: 10px;
      }
    .note-side-text{
        text-align: left;
    }  
    hr{
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .note-side-btn{
        width: 100%;
        margin-bottom: 20px;
    }
    .note-side-btn button{
        width: 100%;
        height: 45px;
    }
    .note-side-a-box ul{
        list-style-type: none;
    }
    .note-side-a-box ul>li{
        border-radius: 5px;
        width: 100%;
        height: 50px;
        padding: 10px;
        padding-left: 5px;
        border-bottom: 1px solid lightgray;
    }
    .note-side-a-box ul>li a{
        text-decoration: none;
        color: black;
    }
    .note-side-a-box ul>li:hover{
        background-color: rgb(219, 219, 219);
    }
    .table-box table{
        width: 100%;
    }
    .note-write-box1{
        display: flex;
    }
    .note-write-box2{
        display: flex;
    }

    .note-write-box1,.note-write-box2{
        border-bottom: 1px solid lightgray;
        padding: 20px;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
        <div class="note-box">
          <div class="note-side">
            <div class="note-side-text">
                <span class="ffont1">쪽지함</span>
            </div>
            <hr>
            <div class="note-side-btn">
                <button class="btn4"  style="color: red;">쪽지 쓰기</button>
            </div>
            <div class="note-side-a-box">
                <ul style="padding-left:0px!important;">
                    <li>
                        <a href="">받은쪽지함</a><br>
                    </li>
                    <li>
                        <a href="">보낸쪽지함</a><br>
                    </li>
                    <li>
                        <a href="">임시보관함</a><br>
                    </li>
                    <li>
                        <a href="">휴지통</a><br>
                    </li>
                </ul>
            </div>
          </div>
          <div class="note-body">
            <div>
                <b style="font-size: 25px; margin-left: 10px;">쪽지쓰기</b>
            </div>
            <hr>
            <div class="note-write">
                <div class="note-write-box1">
                    <div class="note-write-box1-text" style="width: 10%; height: 30px;">
                        <label>제목</label>
                    </div>
                    <div class="note-write-box1-input" style="width: 90%; height: 30px;">
                        <input type="text" style="width: 100%; height: 100%; padding-left: 10px;">
                    </div>
                </div>
                <div class="note-write-box2">
                    <div class="note-write-box2-text" style="width: 10%; height: 30px;">
                        <label>수신자</label>
                    </div>
                    <div class="note-write-box2-input" style="width: 90%; height: 30px;">
                        <input type="text" style="width: 100%; height: 100%; padding-left: 10px;">
                    </div>
                </div>
                <div id="smarteditor" style="margin-top: 30px;">
									<textarea name="editorTxt" id="editorTxt0" rows="20" cols="10"
										style="margin-top: 30px; width: 100%; height: 420px;">dd</textarea>
								</div>
								
								<script>
										let oEditors = [];
										smartEditor = function() {
											nhn.husky.EZCreator.createInIFrame({
												oAppRef : oEditors,
												elPlaceHolder : "editorTxt0", //textarea에 부여한 아이디와 동일해야한다.
												sSkinURI : "${contextPath}/smarteditor/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수정
												htParams : {
													bUseVerticalResizer : false, // 입력창 크기 조절바 사용여부 (true: 사용, false: 미사용)
												},
												fCreator : "createSEditor2"
											});
										}
								
										$(document).ready(function() {
											//스마트에디터 적용
											smartEditor();
										});
									</script>
            </div>
            
          </div>
        </div>
      </div> 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>