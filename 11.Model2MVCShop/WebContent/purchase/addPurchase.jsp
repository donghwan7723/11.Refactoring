<%@ page contentType="text/html; charset=euc-kr" %>

<%--   
<%@ page import = "com.model2.mvc.service.domain.*" %>
<% Purchase purchase = (Purchase)request.getAttribute("purchasevo"); %>
<% System.out.println("������ʹ� addPurchaseView.jsp ������"); %>
	 													--%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        img { width:500px; }
    </style>
    
 </head> 
 
 <body>
 
 	<jsp:include page="/layout/toolbar.jsp" />
	
   	<br/><br/><br/><br/>

  	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">������ ���� ���Ű� �Ǿ����^o^</h3>
	    </div>
	    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>			    
	    
	    <hr/>
	    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.paymentOption=='1' ? '���ݱ���' : '�ſ뱸��'}</div>
		</div>			    
	    
	    <hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>			    
	    
	    <hr/>	    

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>			    
	    
	    <hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>			    
	    
	    <hr/>	

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>			    
	    
	    <hr/>	

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>			    
	    
	    <hr/>	

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>			    
	    
	    <hr/>	

	</div>

</body>
</html>