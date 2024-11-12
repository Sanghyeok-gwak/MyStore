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
      <div class="ordering">
        <div class="ordering-top">
          <div class="order-box">
            <div class="table-box">
              <table>
                <thead>
                  <tr>
                    <th>분류</th>
                    <th>상품명</th>
                    <th>원가</th>
                    <th>매가</th>
                    <th>매익율</th>
                    <th>발주요일</th>
                    <th>유효기간</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>123,123</td>
                    <td>123,123</td>
                    <td>30%</td>
                    <td>예시요일</td>
                    <td>예시기간</td>
                    <td>발주가능</td>
                  </tr>
                  
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
              </style>
            <div class="ordering-detail-text">
              <div class="ordering-detail-product-no">
                <span class="ffont2">123887894</span>
              </div>
              <div class="ordering-detail-product-name">
                <span class="ffont1">참이슬</span>
              </div>
              <div class="ordering-detail-product-box1">
                <div class="ordering-detail-product-cost">
                  <div class="ordering-detail-product-cost-title">
                    <span class="ffont2">원가 :&nbsp;</span>
                  </div>
                  <div class="ordering-detail-product-cost-price">
                    <span class="ffont2">32,333원</span>
                  </div>
                </div>
                <div class="ordering-detail-product-sail-price" style="margin-left: 20px;">
                  <div class="ordering-detail-product-sail-price-title">
                    <span class="ffont2">매가 :&nbsp;</span>
                  </div>
                  <div class="ordering-detail-product-sail-price-price">
                    <span class="ffont2">32,333원</span>
                  </div>
                </div>
              </div>
              <div class="ordering-detail-product-box2">
                <div class="ordering-detail-product-expiration">
                  <div class="ordering-detail-product-expiration-title">
                    <span class="ffont2">유효기간 :&nbsp;</span>
                  </div>
                  <div class="ordering-detail-product-expiration-expiration">
                    <span class="ffont2">99개월</span>
                  </div>
                </div>
                <div class="ordering-detail-product-delivery-date">
                  <div class="ordering-detail-product-delivery-date-title" style="margin-left: 20px;">
                    <span class="ffont2">발주요일 :&nbsp;</span>
                  </div>
                  <div class="ordering-detail-product-delivery-date-date">
                    <span class="ffont2">월,수,금</span>
                  </div>
                </div>  
              </div>
            </div>
            <style>
              .ordering-detail-img{
                width: 30%;
              }
              .ordering-detail-text{
                width: 40%;
                align-content: end;
              }
              .btn-edit-add-box{
                align-content: end;
                text-align: right;
                width: 30%;
              }
            </style>
            <div class="btn-edit-add-box">
              
            </div>
          </div>
        </div>
     </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>