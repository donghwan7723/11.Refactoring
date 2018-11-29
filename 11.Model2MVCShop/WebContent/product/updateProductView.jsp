<%@ page contentType="text/html; charset=EUC-KR" %>



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

function fncAddProduct(){
	//Form ��ȿ�� ����
  	var name = $("input[name='prodName']").val();
 	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
/* 	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	} */
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	} 
		
	$("form").attr("method","POST").attr("action", "/product/updateProduct?menu=manage").submit();
	
}

	$(function(){
		
		//���� event
		$(".btn:contains('����')").bind('click', function(){
			fncAddProduct();
		});
		
		//��� event
		$(".btn:contains('���')").bind('click', function(){
			history.go(-1);
		});
		
		//�������� event
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
	       <h3 class=" text-info">��ǰ��������</h3>
	       <h5 class="text-muted">��ǰ ������<strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>		
	
	    <form class="form-horizontal" action="fileupload" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="prodNo" value="${product.prodNo}"/>
	    
		<div class="form-group">
		    <label for="brand" class="col-sm-offset-1 col-sm-3 control-label">�귣��</label>
		    <div class="col-sm-4">  
		      <select name="brandId" class="form-control">
				<option value="RAM" ${product.brandIden.brandName =='���������'? 'selected' : ''}>���������</option>
				<option value="BUG" ${product.brandIden.brandName =='�ΰ�Ƽ'? 'selected' : ''}>�ΰ�Ƽ</option>
				<option value="POR" ${product.brandIden.brandName =='������'? 'selected' : ''}>������</option>
				<option value="AST" ${product.brandIden.brandName =='�ֽ��ϸ�ƾ'? 'selected' : ''}>�ֽ��ϸ�ƾ</option>	
				<option value="JU"  ${product.brandIden.brandName =='��Ծ�'? 'selected' : ''}>��Ծ�</option>	
				<option value="MAR" ${product.brandIden.brandName =='������Ƽ'? 'selected' : ''}>������Ƽ</option>	
				<option value="KIA" ${product.brandIden.brandName =='���'? 'selected' : ''}>���</option>	
				<option value="HYU" ${product.brandIden.brandName =='����'? 'selected' : ''}>����</option>
			</select>
		    </div>
		</div>	
		
	    <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		    </div>
	    </div>

	    <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		    </div>
	    </div>

	    <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}">
		    </div>
	    </div>

	    <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
               <div class="col-sm-4"> 
    			<div class="input-group date">
           			 <input type="text" name="manuDate" value="${product.manuDate}" class="form-control"><span class="input-group-addon" >
           			 <i class="glyphicon glyphicon-calendar"></i></span>
                </div>	
                </div>		
	    </div>
	    
	    <div class="form-group">
		    <label for="count" class="col-sm-offset-1 col-sm-3 control-label">���</label>
		    <div class="col-sm-4">
		      <input type="text"  class="form-control" id="count" name="count" value="${product.count}">
		    </div>
	    </div>
	    
	    <div class="form-group">
		    <label for="originalFileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		<%--       <img src="/images/uploadFiles/${product.fileName}" width="360px;" /> --%>
		      <input type="file" class="form-control" name="originalFileName"  width="360px;"/>  	
		    </div>
	    </div>		    	    
		
		 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">����</button>
			  <button type="button" class="btn btn-default">���</button>
		    </div>
		 </div>


	</form>


</div>
</body>
</html>








<%-- <body bgcolor="#ffffff" text="#000000">

<form name="detailForm">

<input type="hidden" name="prodNo" value="${product.prodNo}"/>

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input 	type="text" name="prodName" value="${product.prodName}" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20" value="vaio vgn FS70B">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�귣�� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select name="brandId" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">
				<option value="RAM" ${product.brandIden.brandName =='���������'? 'selected' : ''}>���������</option>
				<option value="BUG" ${product.brandIden.brandName =='�ΰ�Ƽ'? 'selected' : ''}>�ΰ�Ƽ</option>
				<option value="POR" ${product.brandIden.brandName =='������'? 'selected' : ''}>������</option>
				<option value="AST" ${product.brandIden.brandName =='�ֽ��ϸ�ƾ'? 'selected' : ''}>�ֽ��ϸ�ƾ</option>	
				<option value="JU" ${product.brandIden.brandName =='��Ծ�'? 'selected' : ''}>��Ծ�</option>	
				<option value="MAR" ${product.brandIden.brandName =='������Ƽ'? 'selected' : ''}>������Ƽ</option>	
				<option value="KIA" ${product.brandIden.brandName =='���'? 'selected' : ''}>���</option>	
				<option value="HYU" ${product.brandIden.brandName =='����'? 'selected' : ''}>����</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail" value="${product.prodDetail}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" value="${product.price}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">&nbsp;��
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>	
	<tr>
		<td width="104" class="ct_write">
			�������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="manuDate" value="${product.manuDate}" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
						<img 	src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="count" value="${product.count}"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;EA
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��ǰ�̹���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input	type="text" name="fileName" class="ct_input_g" 
						style="width: 200px; height: 19px" maxLength="13" value="../../images/empty.GIF"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						<!--  <a href="javascript:fncAddProduct();">����</a> -->
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:history.go(-1)">���</a> -->
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html> --%>