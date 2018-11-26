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
	//Form 유효성 검증
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
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(brandId==null || brandId.length<1){
		alert("브랜드는 반드시 선택해주셔야합니다.");
		return;
	}

	if(count==null || count.length<1){
		alert("재고수량을 입력해주세요.");
		return;
	}
	
	
}


	$(function(){
		
		//등록 event
		$("button:contains('등록')").bind('click', function(){
			$("form").attr("method","POST").attr("action", "/product/addProduct").submit();
		});		
		
		//취소 event
		$("a:contains('취소')").bind('click', function(){
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
	       <h3 class=" text-info">상품등록</h3>
	    </div>

		<form class="form-horizontal" action="fileupload" method="post" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="brandId" class="col-sm-offset-1 col-sm-3 control-label">브랜드</label>
		    <div class="col-sm-4">
				<select name="brandId" id="brand" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">
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
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">제품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName">
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">재고</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="count" name="count">
		    </div>
		  </div>	
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      	<input type="text" class="form-control" readonly="readonly" id="manuDate" name="manuDate"/>
		      </div>	
		  </div>

		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" name="originalFileName"/>    
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