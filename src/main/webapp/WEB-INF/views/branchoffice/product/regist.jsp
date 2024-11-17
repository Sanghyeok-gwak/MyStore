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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
    
	            	

      <div class="product-add-top">
        <div class="product-img-box">
          <div class="img-box" style="width:100%; height:100%;">
            <img id="imageUrlInput" src="https://i.ibb.co/25hzpPd/Component-5.png" style="width: 100%; height: 100%;">
          </div>
        </div>
        <div class="input-box-top">
        <form action="${ contextPath }/branchoffice/insert.po" method="post">
	        <div class="btn-add" style="display:flex;  margin-bottom:50px; justify-content: space-between;">
	          <button type="button" onclick="history.back();" class="btn4">이전으로</button>
	          <button type="submit" class="btn4">등록하기</button>
	        </div>
	        <div class="input-box-top-box2">
            <div class="input-box-top-box2-text">
              <span class="ffont3">상품코드</span>
            </div>
            <div class="input-box-top-box2-input">
              <input type="text" name="productNo" placeholder="상품코드는 자동생성됩니다." disabled="disabled">
            </div>
          </div>
	        <div class="input-box-top-box2">
            <div class="input-box-top-box2-text">
              <span class="ffont3">이미지</span>
            </div>
            <div class="input-box-top-box2-input" style="display:flex;">
              <input type="text" name="productImg" id="imageChUrlInput" >
              <button class="btn4" type="button" onclick="fnChangeImg()">적용하기</button>
            </div>
          </div>
          <script>
          	function fnChangeImg(){
          		const changeImgUrl = document.getElementById('imageChUrlInput').value;
          		
          		document.getElementById('imageUrlInput').src=changeImgUrl;
          		console.log(document.getElementById('imageUrlInput').value);
          	}
          
          </script>
          <div class="input-box-top-box1">
            <div class="input-box-top-box1-text">
              <span class="ffont3">분류</span>
            </div>
            <div class="input-box-top-box1-input">
					    <div class="division-box" style="display:flex; width: 100%;">
					        <input type="text"  id="productDivisionInput" readonly >
					        <input type="hidden" id="divisionCode" name="productDivision" >
					        <select id="productDivisionSelect" style="width:100px;">
				            <c:forEach var="coc" items="${cC }">
			                <option data-test="${coc.commonCode }" >
			                    ${coc.commonName}
				              </option>
				            </c:forEach>
					        </select>
					    </div>
						</div>                                                                                              
						
						<script>
						   
					    document.getElementById("productDivisionSelect").addEventListener("change", function() {
					        const selectedValue = this.value;
					        const selectedOption = this.options[this.selectedIndex]; 
					        const dataTestValue = selectedOption.getAttribute("data-test").substring(4);
					        console.log(dataTestValue);
					        document.getElementById("productDivisionInput").value = selectedValue;
					        document.getElementById("divisionCode").value = dataTestValue;
					    });
						</script>

	          </div>
	          
	          <div class="input-box-top-box3">
	            <div class="input-box-top-box3-text">
	              <span class="ffont3">상품명</span>
	            </div>
	            <div class="input-box-top-box3-input">
	              <input type="text" name="productName" >
	            </div>
	          </div>
	          <div class="input-box-top-box4">
						    <div class="input-box-top-box4-text">
						        <span class="ffont3">원가</span>
						    </div>
						    <div class="input-box-top-box4-input">
						        <input type="text" name="cost" id="cost">
						    </div>
						</div>

						<div class="input-box-top-box5">
						    <div class="input-box-top-box5-text">
						        <span class="ffont3">매가</span>
						    </div>
						    <div class="input-box-top-box5-input">
						        <input type="text" name="sailPrice" id="sailPrice" >
						    </div>
						</div>

						<div class="input-box-top-box5">
						    <div class="input-box-top-box5-text">
						        <span class="ffont3">매익률</span>
						    </div>
						    <div class="input-box-top-box5-input">
						        <input type="text" name="profitMargin" id="profitMargin" >
						    </div>
						</div>

						<script>
						 
						    function calculateProfitMargin() {
						        var cost = parseFloat(document.getElementById("cost").value);
						        var sailPrice = parseFloat(document.getElementById("sailPrice").value);
						        
						      
						        if (!isNaN(cost) && !isNaN(sailPrice) && cost > 0) {
						            var profitMargin = ((sailPrice - cost) / cost) * 100; 
						            document.getElementById("profitMargin").value = profitMargin.toFixed(2) + "%"; 
						        } else {
						            document.getElementById("profitMargin").value = ''; 
						        }
						    }
						    
						
						    
						    document.getElementById("cost").addEventListener("input", calculateProfitMargin);
						    document.getElementById("sailPrice").addEventListener("input", calculateProfitMargin);
						</script>
	          <div class="input-box-top-box6">
	            <div class="input-box-top-box6-text">
	              <span class="ffont3">유효기간</span>
	            </div>
	            <div class="input-box-top-box6-input">
	              <input type="text" name="expirationPeriod" placeholder="99-99-99">
	            </div>
	          </div>
	          <div class="input-box-top-box7">
	            <div class="input-box-top-box7-text">
	              <span class="ffont3">발주요일</span>
	            </div>
	            <div class="input-box-top-box7-input">
	              <input type="text" name="deliveryDate" placeholder="요일을 입력하세요." >
	            </div>
	          </div>
	          <div class="input-box-top-box8">
	            <div class="input-box-top-box8-text">
	              <span class="ffont3">사용유무</span>
	            </div>
	            <div class="input-box-top-box8-input">
	                <label>
	                  <input type="radio" name="useYn"  value="Y">사용
	                </label>
	                <label>
	                  <input type="radio" name="useYn" value="N">숨김
	                </label>
	            </div>
	          </div>
          </form>
        </div>
      </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>