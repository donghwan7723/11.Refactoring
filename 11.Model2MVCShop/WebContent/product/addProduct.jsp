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

	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        img { width:500px; }
    </style>
    
  
	<script type="text/javascript">

$(function(){
	$("button:contains('Ȯ��')").on("click", function(){
			self.location = "/product/listProduct?menu=manage"
	});

	$("button:contains('�߰����')").on("click", function(){
			self.location = "../product/addProductView.jsp"
	});

});

</script>


</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
	
   	<br/><br/><br/><br/>
   	
   	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ��ϿϷ�</h3>
	    </div>


		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�귣��</strong></div>
			<div class="col-xs-8 col-md-4">${product.brandIden.brandId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
			
		<hr/>	
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>								
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>		

		<hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���</strong></div>
			<div class="col-xs-8 col-md-4">${product.count}</div>
		</div>		

		<hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<img src="/images/uploadFiles/${product.fileName}" />
			</div>
		</div>

		<hr/>

		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
	  			<button type="button" class="btn btn-primary">�߰����</button>
	  		</div>
		</div>
	</div>
</body>

</html>
