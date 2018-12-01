<%@ page contentType="text/html; charset=euc-kr" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 

    

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	

	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
    
	<script type="text/javascript">

function fncGetList(currentPage) {
/* 	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();	 */
	$("#currentPage").val(currentPage)
	$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
}
		
	$(function(){
		
		//getPurchase Event
		$("td:nth-child(1)").bind("click", function(){
			var tranNo = $(this).data("param");
			alert(tranNo);
			self.location = "/purchase/getPurchase?tranNo="+tranNo
		});
		
		//getUserId Event
		$("td:nth-child(2)").bind("click", function(){
			var userId = $(this).data("userId");
			self.location = "/user/getUser?userId="+userId
		});
		
		//���ǵ���  Event
		$(".ct_list_pop td:nth-child(11)").bind("click", function(){
			var tranNo = $(this).data("param2");
			self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3"
		});
		
	
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
			
		$(".ct_list_pop:nth-child(2n+5)" ).css("background-color" , "whitesmoke");
		
		
	});	
		
		
</script>

</head>


<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
 
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>�����̷���ȸ</h3>
	    </div>
	    
		<div class="row">
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>	   
	    </div>
	    
     <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">������</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��۵�������</th>
          </tr>
        </thead>	    
        
	   <tbody>     
       
       	<c:set var="i" value="0"/>
 		<c:forEach var="purchase" items="${list}">
 		<c:set var="i" value="${ i+1 }" />
		<c:set var="trimTranCode" value="${fn:trim(purchase.tranCode)}"/> 
	     	<tr>
			  <td align="center" data-param="${purchase.tranNo}">${ i }</td>
			  <td align="left" data-userId="${purchase.buyer.userId}">${purchase.buyer.userId}</td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">   
	    		<c:if test="${trimTranCode=='1'}">
					���� ���ſϷ� �����Դϴ�.
				</c:if>
				<c:if test="${trimTranCode=='2'}">
					���� ������Դϴ�.  			
				</c:if>
				<c:if test="${trimTranCode=='3'}">
					���� ��ۿϷ��ϴ�.
				</c:if>
			  <td align="left">    
				<c:if test="${trimTranCode=='2'}">
				<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a>	
					���ǵ���
				</c:if>
	
	
	    </c:forEach>
	 </tbody>
      
   </table>
	 
 </div>	 	 
		
     <jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html> 	
	
