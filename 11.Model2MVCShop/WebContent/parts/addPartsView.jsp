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
		
		//등록 event
		$(".btn:contains('등록')").bind('click', function(){
			$("form").attr("method","POST").attr("action", "/parts/addParts").submit();
		});		
		
		//취소 event
		$(".btn:contains('취소')").bind('click', function(){
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
	       <h3 class=" text-info">부품등록</h3>
	    </div>

		<form class="form-horizontal" action="fileupload" method="post" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="partClass" class="col-sm-offset-1 col-sm-3 control-label">부품종류</label>
		    <div class="col-sm-4">
				<select name="partClass" id="partClass" class="form-control" >
					<option value="" selected>부품선택</option>
					<option value="ENGINE">ENGINE</option>
					<option value="WHEEL">WHEEL</option>
					<option vlaue="TIRE">TIRE</option>
				</select>
			</div>
		  </div>

		  <div class="form-group">
		    <label for="carBrandId" class="col-sm-offset-1 col-sm-3 control-label">호환 가능 브랜드</label>
		    <div class="col-sm-4">
		   		 <select name="carBrandId" id="carBrandId" class="form-control" >
		    		<option value="" selected>브랜드선택</option>
					<option value="RAM">람보르기니</option>
					<option value="BUG">부가티</option>
					<option value="POR">포르쉐</option>
					<option value="AST">애스턴마틴</option>	
					<option value="JU">재규어</option>	
					<option value="MAR">마세라티</option>	
					<option value="KIA">기아</option>	
					<option value="HYU">현대</option>
				</select>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">부품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="partName" name="partName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price">
		    </div>
		  </div>

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">등록 </button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
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
					<td width="93%" class="ct_ttl01">상품등록</td>
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
			부품종류 <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
				<select name="partClass"  class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">
					<option value="" selected>부품선택</option>
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
			브랜드<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<select name="carBrandId" id="carBrandId" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">
					<option value="" selected>브랜드선택</option>
					<option value="RAM">람보르기니</option>
					<option value="BUG">부가티</option>
					<option value="POR">포르쉐</option>
					<option value="AST">애스턴마틴</option>	
					<option value="JU">재규어</option>	
					<option value="MAR">마세라티</option>	
					<option value="KIA">기아</option>	
					<option value="HYU">현대</option>
				</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>	
	<tr>
		<td width="104" class="ct_write">
			부품명 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
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
			가격 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6"/>&nbsp;원
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
	
				등록
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">

				취소
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