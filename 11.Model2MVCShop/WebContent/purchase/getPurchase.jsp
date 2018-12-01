<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>



	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
<script type="text/javascript">

	$(function(){
		
		//구매수정 event
		if('${tranCode}'=='2  '){
			alert("상품이 배송중입니다. 수정이 불가합니다.");
	
		}else{
			$(".btn:contains('수정')").bind("click", function(){
				self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
			});
		}
		
		//확인 event
		$(".btn:contains('확인')").bind("click", function(){
			history.go(-1);
		});
	});



</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">구매상세조회</h3>
	    </div>

		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>구매상품</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName}</div>
		</div>	    
	
		<hr/>
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>	    
	
		<hr/>			
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.paymentOption=='1  ' ? '현금구매' : '신용구매'}</div>
		</div>	    
	
		<hr/>	

		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>	    
	
		<hr/>
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>구매자연락처</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>	    
	
		<hr/>
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>	    
	
		<hr/>		

		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>	    
	
		<hr/>		
	
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>배송희망일</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>	    
	
		<hr/>		
	
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>주문일</strong></div>
		  <div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>	    
	
		<hr/>	

		<div class="row">
	  		<div class="col-md-12 text-center">
	  			<button type="button" class="btn btn-primary">수정</button>
	  			<button type="button" class="btn btn-primary">확인</button>
	  		</div>
	  	</div>
	  	
	  	</div>
	  	
</body>
</html>	