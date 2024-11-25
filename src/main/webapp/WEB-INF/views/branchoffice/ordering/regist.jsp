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
      .ordering{
        display: flex;
        flex-direction: column;
        height: 100%;
      }
      .ordering-top{
        height: 70%;
        margin-bottom: 10px;
      }
      .ordering-bottom{
        margin-top: 10px;
        height: 30%;
      }
      .ordering-detail,.order-box{
        width: 100%;
        height: 100%;
        border-radius: 20px;
        background-color: white;
        padding:30px;
      }
      .table-box{
        border-radius: 10px;
        border: 1px solid lightgray;
        height: 100%;
        overflow-y: scroll;
      }
      table {
        width: 100%;
        border-collapse: collapse; 
        border-style: hidden; 
      }
      th, td {
        border: 1px solid lightgray;
        padding: 8px;
        text-align: center;
      }
      thead{
      	text-align: center;
      }
      .ordering-detail-img  {
			    width: 20%;
			}
			div#order-details {
			    width: 80%;
			    justify-content: center;
			}
			.ordering-detail-product-cost ,.ordering-detail-product-sail-price,.ordering-detail-product-expiration,.ordering-detail-product-delivery-date{
			    width: 50%;
			}
			.order-box {
			    display: flex;
			    flex-direction: column;
			}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/side.jsp"/>
<div class="body-body">
      <!-- 여기 채워서 작업하시면 됩니다 .-->
     <div class="ordering">
        <div class="ordering-top">
          <div class="order-box">
            <style>
              .ordering-detail-text{
                width: 40%;
                align-content: end;
              }
              .btn-edit-add-box{
                align-content: end;
                text-align: right;
                width: 100%;
						    display:flex;
						    margin-bottom: 20px;
						    justify-content: space-between;
              }
              .calendar-box{
              	width:50%;
              	display:flex;
              }
              #ordering-form{
              	display:flex;
              	height: 100%;
						    display: flex;
						    flex-direction: column;
              }
            </style>
            
           <form id="ordering-form" action="${contextPath}/ordering/insert.or" method="post">
            <div class="btn-edit-add-box">
            	<div class="calendar-box">
            		<input id="order-date" type="date">
            	</div>
            	<script>
							  // 페이지 로드 시 오늘 날짜를 기본값으로 설정
							  window.onload = function() {
							    var today = new Date().toISOString().split('T')[0];  // 오늘 날짜를 yyyy-mm-dd 형식으로 가져옴
							    document.getElementById("order-date").value = today;
							  };
							</script>
            	<div class="btn4-box">
	              <button type="submit" class="btn4">등록 하기</button>
            	</div>
            </div>
            <div class="table-box">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>분류</th>
                    <th>상품명</th>
                    <th>할인행사</th>
                    <th>발주재고</th>
                    <th>발주 수량</th>
                    <th>발주여부</th>
                  </tr>
                </thead>
	                <tbody>
	                	 <c:forEach var="p" items="${pro}" varStatus="status">
	                    <input type="hidden" name="productList[${status.index}].productNo" value="${p.productNo}">
	                    <input type="hidden" name="productList[${status.index}].productName" value="${p.productName}">
		                  <tr class="product-row" data-productimg="${p.productImg}" data-productno="${p.productNo}" 
		                      data-productname="${p.productName}" data-cost="${p.cost}" data-sailprice="${p.sailPrice}" 
		                      data-expiration="${p.expirationPeriod}" data-delivery="${p.deliveryDate}">
		                    <td>${p.productDivision }</td>
			                	<td>${p.productName }</td>
		                    <td>${p.event == null ? '행사없음' : p.event}</td>
		                    <td>${p.inventory }</td>
		                    <td><input style="padding-left:10px;" type="number" name="productList[${status.index}].inventory" value="0"></td>
		                    <td>${p.useYn == 'Y' ? '발주가능' : '발주불가능'}</td>
		                  </tr>
	                	</c:forEach>
	                </tbody>
              	</table>
            	</div>
          	</form>
          </div>
        </div>
        <style>
          .ordering-detail{
            display: flex;
          }
          .order-detail-image{
            width: 100%;
            height: 100%;
          }
         
        </style>
        <div class="ordering-bottom">
          <div class="ordering-detail">
            <div class="ordering-detail-img">
              <div class="order-detail-image">
                <img id="preview" src="https://i.ibb.co/25hzpPd/Component-5.png" alt="Click to upload" style="width: 100%; height: 100%;" >
              </div>
            </div>
              <style>
                .ordering-detail-product-cost,.ordering-detail-product-sail-price,.ordering-detail-product-expiration,
                .ordering-detail-product-delivery-date,.ordering-detail-product-box2,.ordering-detail-product-box1{
                  display: flex;
                }
                .ordering-detail-text{
                  margin-left:250px;
                  display: flex;
                  flex-direction: column;
                }
                .ordering-detail-product-no,.ordering-detail-product-name,.ordering-detail-product-box1,.ordering-detail-product-box2{
                  margin-bottom: 10px;
                }
                .ordering-detail-product-no,.ordering-detail-product-name,
                .ordering-detail-product-cost-title,.ordering-detail-product-cost-price,
                .ordering-detail-product-sail-price-title,.ordering-detail-product-sail-price-price,
                .ordering-detail-product-expiration-title,.ordering-detail-product-expiration-expiration,
                .ordering-detail-product-delivery-date-title,.ordering-detail-product-delivery-date-date{
                  width: 130px;
                }
              </style>
             <div class="ordering-detail-text" id="order-details">
              <!-- 클릭된 데이터가 여기에 표시됩니다 -->
              <div class="ordering-detail-product-no"><span class="ffont2" id="product-id">-</span></div>
              <div class="ordering-detail-product-name" style="width:100%; margin-bottom:50px;"><span class="ffont1" id="product-name">-</span></div>
              <div class="ordering-detail-product-box1">
                <div class="ordering-detail-product-cost">
                  <div class="ordering-detail-product-cost-title"><span class="ffont2">원가 :&nbsp;</span></div>
                  <div class="ordering-detail-product-cost-price"><span class="ffont2" id="product-cost">-</span></div>
                </div>
                <div class="ordering-detail-product-sail-price">
                  <div class="ordering-detail-product-sail-price-title"><span class="ffont2">매가 :&nbsp;</span></div>
                  <div class="ordering-detail-product-sail-price-price"><span class="ffont2" id="product-price">-</span></div>
                </div>
              </div>
              <div class="ordering-detail-product-box2">
                <div class="ordering-detail-product-expiration">
                  <div class="ordering-detail-product-expiration-title"><span class="ffont2">유효기간 :&nbsp;</span></div>
                  <div class="ordering-detail-product-expiration-expiration"><span class="ffont2" id="product-expiration">-</span></div>
                </div>
                <div class="ordering-detail-product-delivery-date">
                  <div class="ordering-detail-product-delivery-date-title"><span class="ffont2">발주요일 :&nbsp;</span></div>
                  <div class="ordering-detail-product-delivery-date-date"><span class="ffont2" id="product-delivery">-</span></div>
                </div>
              </div>
            </div>
            <script>
				      document.querySelectorAll('.product-row').forEach(function(row) {
				        row.addEventListener('click', function() {
				          const productImg = this.getAttribute('data-productimg');
				          const productNo = this.getAttribute('data-productno');
				          const productName = this.getAttribute('data-productname');
				          const productCost = this.getAttribute('data-cost');
				          const productSailPrice = this.getAttribute('data-sailprice');
				          const productExpiration = this.getAttribute('data-expiration');
				          const productDelivery = this.getAttribute('data-delivery');
				
				          document.getElementById('preview').src = productImg;  
				          document.getElementById('product-id').textContent = productNo;  
				          document.getElementById('product-name').textContent = productName;  
				          document.getElementById('product-cost').textContent = productCost;  
				          document.getElementById('product-price').textContent = productSailPrice; 
				          document.getElementById('product-expiration').textContent = productExpiration;  
				          document.getElementById('product-delivery').textContent = productDelivery;  
				        });
				      });
				    </script>
          </div>
        </div>
     </div> 
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>