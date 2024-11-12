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
                    <th>발주여부</th>
                    <th>추천구분</th>
                    <th>행사내용</th>
                    <th>발주재고</th>
                    <th>발주 수량</th>
                    <th>발주일</th>
                    <th>최소/최대</th>
                    <th>취급여부</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
                  </tr>
                  <tr>
                    <td>예시 분류</td>
                    <td>예시 상품명</td>
                    <td>발주 가능</td>
                    <td>추천</td>
                    <td>세일 행사</td>
                    <td>100</td>
                    <td><input type="number"></td>
                    <td>2024-11-10</td>
                    <td>10 / 50</td>
                    <td>취급 중</td>
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
              <button class="btn4">임시 저장</button>
              <button class="btn4">등록 하기</button>
            </div>
          </div>
        </div>
     </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>