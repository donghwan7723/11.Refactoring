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

	$(function(){
		
		$(".ct_btn01:contains('�����')").bind("click", function(){
			self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
		});
		
		$(".ct_btn01:contains('Ȯ��')").bind("click", function(){
			self.location = "/purchase/listPurchase"
		});
	
	});


</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<br/><br/><br/><br/>
		
	<div class="container">
	
	
	<div class="page-header">
	       <h3 class=" text-info">�������������� �Ϸ�Ǿ����ϴ�.</h3>
	    </div>
	    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>			   	

	   	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.paymentOption=='1  ' ? '���ݱ���' : '�ſ뱸��'}</div>
		</div>

	    
	   	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
	    
	   	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>	    

	   	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>	    	    

	   	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>		

	   	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>	

	   	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>	
	
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">�����</button>
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>   	
	


	

	</div>


</body>
</html>