<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.model2.mvc.service.domain.*"%> 


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
    
    <link rel="stylesheet" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/javascript/bootstrap-datepicker.kr.js" charset="euc-kr"></script>
    
   
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
	
		body {
            padding-top : 50px;
        }
   
    </style>
    
    <script type="text/javascript">

function fncAddPurchase(){
		
	var receiverName = $("input[name='receiverName']").val();
	var receiverPhone = $("input[name='receiverPhone']").val();
	var divyAddr = $("input[name='divyAddr']").val();


	if(receiverName == null || receiverName.length<1){
		alert("수령인을 입력하세요].");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("연락처를 남겨주세요.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("수령처를 적어주십시오 .");
		return;
	}
		

	
	$("form").attr("method","POST").attr("action", "/purchase/updatePurchase").submit();
	
}

	$(function(){
		
		//수정 event
		$(".btn:contains('수정')").bind("click", function(){
			fncAddPurchase();
		});
		
		//취소 event
		$(".btn:contains('취소')").bind("click", function(){
			history.go(-1);
		});	

		//배송희망일 event
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
		
		<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	    </div>		

	<form class="form-horizontal">
	
	<input type="hidden" name="tranNo" value="${purchase.tranNo}"/>
	
	    <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		      <input type="text" readonly class="form-control" name="buyerId" value="${purchase.buyer.userId}">
		    </div>
	    </div>
		
		<div class="form-group">
			<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
			<div class="col-sm-4">  
		      <select name="paymentOption" class="form-control">
				<option value="1" ${purchase.paymentOption=='1  ' ? 'selected' : ''}>현금구매</option>
				<option value="2" ${purchase.paymentOption=='2  ' ? 'selected' : ''}>신용구매</option>
			  </select>
			</div>
		</div>
		
	    <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="receiverName" value="${purchase.receiverName}">
		    </div>
	    </div>		
		
	    <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
	    </div>

	    <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="divyAddr" value="${purchase.divyAddr}">
		    </div>
	    </div>

	    <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="divyRequest" value="${purchase.divyRequest}">
		    </div>
	    </div>

	    <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
               <div class="col-sm-4"> 
    			<div class="input-group date">
           			 <input type="text" name="divyDate" value="${purchase.divyDate}" class="form-control"><span class="input-group-addon" >
           			 <i class="glyphicon glyphicon-calendar"></i></span>
                </div>	
                </div>		
	    </div>

	

		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">수정</button>
	  			<button type="button" class="btn btn-primary">취소</button>
	  		</div>
		</div>   
	

 	  </form>
	</div>
  </body>
</html>