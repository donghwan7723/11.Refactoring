<%@ page contentType="text/html; charset=euc-kr" %>





<!DOCTYPE html>

<html lang="ko">


<head>

	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>

   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    


<script type="text/javascript">


	$(function(){
		
		//구매 event 
		$(".btn:contains('구매')").bind("click",function(){
			$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
		});
	
		//취소 event
		$(".btn:contains('취소')").bind("click",function(){
			history.go(-1);
		});
		
		//배송희망일자 event
	    $('.input-group.date').datepicker({

	         calendarWeeks: false,
	         todayHighlight: true,
	         autoclose: true,
	         format: "yyyy/mm/dd",
	         language: "kr"

	      });
			
	});


		</script>
	</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<br/><br/><br/><br/>
	
	<div class="container">

		<div class="page-header">
	       <h3 class=" text-info">구매정보</h3>
	    </div>
	    
	    <form class="form-horizontal">
	  
		<input type="hidden" name="prodNo" value="${product.prodNo}"/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>브랜드</strong></div>
			<div class="col-xs-8 col-md-4">${product.brandIden.brandName}</div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>부품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.partsIden.partName}</div>
		</div>		
		
		<hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
		    <div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
		    <div class="col-sm-4">
				<select name="paymentOption" id="paymentOption" class="form-control" >
					<option value="1" selected >현금구매</option>
					<option value="2">신용구매</option>
				</select>
			</div>
	    </div>	
		  			
		<hr/>
		
		<div class="row">
		    <div class="col-xs-4 col-md-2"><strong>구매자 이름</strong></div>		
		 	<div class="col-sm-4">
		       <input type="text" class="form-control" name="receiverName" value="${user.userName}">
		    </div>
		</div> 
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>구매자 연락처</strong></div>		
		 	<div class="col-sm-4">
		      <input type="text" class="form-control" name="receiverPhone" value="${user.phone}">
		    </div>
		</div>
		
		<hr/>
		  
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>구매자 주소</strong></div>	
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="divyAddr" value="${user.addr}"> 
		    </div>
		</div>
		
		<hr/>		  
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>	
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="divyRequest">
		    </div>
		</div>
		  
		<hr/>

	    <div class="row">
		    <div class="col-xs-4 col-md-2"><strong>배송희망일자</strong></div>
		    <div class="col-sm-4">
		      <div class="input-group date">
           			 <input type="text" name="divyDate" class="form-control"><span class="input-group-addon" >
           			 <i class="glyphicon glyphicon-calendar"></i></span>
           	  </div>
		    </div>	
		</div>
		   
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">구매</button>
	  			<button type="button" class="btn btn-primary">취소</button>
	  		</div>
		</div>   

	  </form>
	</div>
  </body>
</html>