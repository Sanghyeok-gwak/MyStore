<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>  
</div>
</div>

  <script>
    function toggleSubmenu(element) {
      const submenus = document.querySelectorAll(".submenu");
  
      // 모든 서브메뉴를 닫음
      submenus.forEach((submenu) => {
        if (submenu !== element.nextElementSibling) {
          submenu.style.maxHeight = "0";
        }
      });
  
      // 클릭한 서브메뉴의 상태 토글
      const submenu = element.nextElementSibling;
      if (submenu.style.maxHeight === "0px" || submenu.style.maxHeight === "") {
        submenu.style.maxHeight = submenu.scrollHeight + "px";
      } else {
        submenu.style.maxHeight = "0";
      }
    }
  </script>
  
  <script>
    // JSP에서 contextPath를 JavaScript 변수로 전달
    const contextPath1 = "${pageContext.request.contextPath}";
	</script>
  
  <script>
    	//에이작스로 system.systemBoardsList.do 요청
    	
    	window.onload = sideBoardList();
    	
    	function sideBoardList(){
    		$.ajax({
    	        url: '${contextPath}/system/sideBoardsList.do',
    	        type: 'get',
    	        success: function(resData) {
    	            
    	            let value = '';
    	            
    	            resData.forEach(board => {
    	            	if (board.boardtUse === "N") { 
    	                    value += '<a href="' + contextPath1 + '/board/list.do?boardTypeNo=' + board.boardTypeNo + '">' 
    	                           + board.boardtName + '</a>';
    	                }
    	            });

    	            $('#boardMenus').html(value);
    	            
    	        },
    	        error: function() {
    	            console.log('side 게시판 리스트 대한 ajax 통신 실패');
    	        }
    	    });
      	}
    </script>
  <!-- Vendor JS Files -->
  <script src="${ contextPath }/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${ contextPath }/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${ contextPath }/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${ contextPath }/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${ contextPath }/assets/vendor/quill/quill.js"></script>
  <script src="${ contextPath }/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${ contextPath }/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${ contextPath }/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${ contextPath }/assets/js/main.js"></script>