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
        height: 60%;
        margin-bottom: 10px;
      }
      .ordering-bottom{
        margin-top: 10px;
        height: 40%;
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
      	text-align:center;
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
            <div class="table-box">
              <table>
                <thead>
                  <tr>
                    <th>분류</th>
                    <th>상품명</th>
                    <th>할인행사</th>
                    <th>원가</th>
                    <th>매가</th>
                    <th>매익율</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="p" items="${pro}">
	                  <tr class="product-row"
                        data-productimg="${p.productImg}"
                        data-productno="${p.productNo}"
                        data-productname="${p.productName}"
                        data-cost="${p.cost}"
                        data-sailprice="${p.sailPrice}"
                        data-expiration="${p.expirationPeriod}"
                        data-delivery="${p.deliveryDate}">
	                    <td>${p.productDivision }</td>
			                <td>${p.productName }</td>
			                <td>${p.event == null ? '행사없음' : p.event}</td>
	                    <td>${p.cost }</td>
	                    <td>${p.sailPrice }</td>
	                    <td>${p.profitMargin }</td>
	                    <td>${p.useYn == 'Y' ? '발주가능' : '발주불가능'}</td>
	                  </tr>
	                </c:forEach>  
                </tbody>
              </table>
            </div>
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
                .ordering-detail {
								    display: flex;
								}
								.ordering-detail-img {
								    width: 20%;
								}
								div#order-details {
								    width: 80%;
								}
								div#order-details {
								    display: flex;
								    justify-content: center;
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>