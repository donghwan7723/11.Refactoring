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
	<script type="text/javascript" src="../javascript/calendar.js"></script>
<script type="text/javascript">


	$(function(){
		
		//��� event
		$(".btn:contains('���')").bind('click', function(){
			$("form").attr("method","POST").attr("action", "/parts/addParts").submit();
		});		
		
		//��� event
		$(".btn:contains('���')").bind('click', function(){
			history.go(-1);
		});

	});





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
		    <label for="partClass" class="col-sm-offset-1 col-sm-3 control-label">��ǰ����</label>
		    <div class="col-sm-4">
				<select name="partClass" id="partClass" class="form-control" >
					<option value="" selected>��ǰ����</option>
					<option value="ENGINE">ENGINE</option>
					<option value="WHEEL">WHEEL</option>
					<option vlaue="TIRE">TIRE</option>
				</select>
			</div>
		  </div>

		  <div class="form-group">
		    <label for="carBrandId" class="col-sm-offset-1 col-sm-3 control-label">ȣȯ ���� �귣��</label>
		    <div class="col-sm-4">
		   		 <select name="carBrandId" id="carBrandId" class="form-control" >
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
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="partName" name="partName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price">
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


</body>




<%-- 
<body bgcolor="#ffffff" text="#000000">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ���</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ���� <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
				<select name="partClass"  class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">
					<option value="" selected>��ǰ����</option>
					<option value="ENGINE">ENGINE</option>
					<option value="WHEEL">WHEEL</option>
					<option vlaue="TIRE">TIRE</option>
				</select>
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
			�귣��<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<select name="carBrandId" id="carBrandId" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">
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
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>	
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="partName" class="ct_input_g" 
				style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
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
			<input type="text" name="price" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6"/>&nbsp;��
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
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
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
	
				���
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">

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