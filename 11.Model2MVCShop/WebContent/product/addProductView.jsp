<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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

	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	</style>


<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;

	
	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	var brandId=$("#brandId").val();
	var count=$("$input[name='count']").val();
	
	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	if(brandId==null || brandId.length<1){
		alert("�귣��� �ݵ�� �������ּž��մϴ�.");
		return;
	}

	if(count==null || count.length<1){
		alert("�������� �Է����ּ���.");
		return;
	}
	
	
}


	$(function(){
		
		//��� event
		$("button:contains('���')").bind('click', function(){
			$("form").attr("method","POST").attr("action", "/product/addProduct").submit();
		});		
		
		//��� event
		$("a:contains('���')").bind('click', function(){
			$("form").attr("method","POST").attr("action", "/product/listProduct").submit();
		});


	}); //Jquery function end
					

	</script>
	
</head>

<body>

	
	<jsp:include page="/layout/toolbar.jsp" />
	
	<br/><br/><br/><br/>
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ���</h3>
	    </div>

		<form class="form-horizontal" action="fileupload" method="post" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="brandId" class="col-sm-offset-1 col-sm-3 control-label">�귣��</label>
		    <div class="col-sm-4">
				<select name="brandId" id="brand" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">
					<option value="" selected>�귣�弱��</option>
					<option value="RAM">���������</option>
					<option value="BUG">�ΰ�Ƽ</option>
					<option value="POR">������</option>
					<option value="AST">�ֽ��ϸ�ƾ</option>	
					<option value="JU">��Ծ�</option>	
					<option value="MAR">������Ƽ</option>	
					<option value="KIA">���</option>	
					<option value="HYU">����</option>
				</select>
			</div>
		  </div>

		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName">
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="count" name="count">
		    </div>
		  </div>	
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      	<input type="text" class="form-control" readonly="readonly" id="manuDate" name="manuDate"/>
		      </div>	
		  </div>

		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" name="originalFileName"/>    
		    </div>
		  </div>			  		 		  	  		  
		  

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">��� </button>
			  <a class="btn btn-primary btn" href="#" role="button">���</a>
		    </div>
		  </div>
	</form>
  </div>


</body>
</html>