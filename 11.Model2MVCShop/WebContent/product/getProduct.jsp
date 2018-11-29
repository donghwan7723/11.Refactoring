<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
<script type="text/javascript">

function fncSelect(){

	
			var brandId = $("input:hidden").val();
			var partClass = $("select[name=partClass]").val();
			
			$.ajax(
					{
						url : "/parts/json/getParts/"+brandId+"/"+partClass ,
						method : "GET" ,
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"	
					
						}, //end of header
		
						success : function(data , status){

							var temp = "";
							var display = "";
							
 							if(data.length>0){
							
								$.each(data, function(index){
									temp = "<option value='"+data[index].partName+"'>"+data[index].partName+"</option>";
									display += temp;
								});
								
									$("select[name=partName]").children("option").not("option:nth-child(1)").remove();
									$("select[name=partName]").append(display);
									
							}else if(data.length==0){
							
								var notDisplay = "<option value=''>재고없음 </option>";
									$("select[name=partName]").children("option").not("option:nth-child(1)").remove();
									$("select[name=partName]").append(notDisplay);
							} 
							
					
						}//end of success
					
			});//end of $.ajax

}//end of javaScript

		
function fncGetPirce(){

			var partName = $("select[name=partName]").val();
		
			
			alert(partName);
	

			$.ajax(
					{
						url : "/parts/json/getParts/"+partName ,
						method : "GET" ,
						dataType : "json" ,
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"	
				
						}, //end of header
						success : function(data, status){
							
							var productPrice = ${product.price};
							var partsPrice = data;
							
							var totalAmount = productPrice + partsPrice;

							$(".price").text(totalAmount);
							
						}//end of success
				
					});//end of $.ajax
		
}//end of fncGetPrice 

		
$(function(){	

		
 		if('${user.role}'=='admin'){

			//확인 button
			$("button:contains('확인')").on("click", function(){
				self.location= "/product/listProduct?menu=search"
			});
	
 		}else if('${user.role}'=='user'){
			
			//구매 button
			$("button:contains('구매')").on("click", function(){
				self.location= "/purchase/addPurchase?prod_no=${product.prodNo}"
			}); 
	
			//이전 button
			$("button:contains('이전')").on("click", function(){
				history.go(-1);
		
			});
 		
 		}
 		
 	
 			
 

});//end of jquery 


</script>

</head>



<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상품상제정보</h3>
	    </div>
	    
		<div class="row">
		  <input type="hidden" name="brandId" value="${product.brandIden.brandId}"/>
		</div>	    
	
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>브랜드</strong></div>
		  <div class="col-xs-8 col-md-4">${product.brandIden.brandName}</div>
		</div>	    
	
		<hr/>	
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
		  <div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>	    
	
		<hr/>					

		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
		  <img src="/images/uploadFiles/${product.fileName}" width="360px;"/>
		</div>	    
	
		<hr/>				

		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
 		  <div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>	    
	
		<hr/>				
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
 		  <div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>	    
	
		<hr/>		

		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
 		  <div class="col-xs-8 col-md-4 price">${product.price}</div>
		</div>	    
	
		<hr/>
	
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>부품옵션</strong></div>
 		  <select name="partClass" class="ct_input_g" style="width: 100px; height: 19px" onchange="fncSelect(this)">
				<option value='' selected>부품종류</option>
				<option value="ENGINE" >ENGINE</option>
				<option value="TIRE" >TIRE</option>
				<option value="WHEEL" >WHEEL</option>
		  </select>
					
		  <select name="partName" class="ct_input_g" style="width: 100px; height: 19px" onchange="fncGetPirce(this)">
				<option value="" selected>부품선택</option>
		  </select>					
		</div>	    
	
		<hr/>

		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
 		  <div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>

		<hr/>
		
		<div class="row">
		  <div class="col-xs-4 col-md-2 "><strong>남은수량</strong></div>
 		  <div class="col-xs-8 col-md-4">${product.count}</div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center">
	  		<c:if test="${user.role=='admin'}"> 		
	  			<button type="button" class="btn btn-primary">확인</button>
	  		</c:if>
	  		<c:if test="${user.role=='user'}"> 
	  			<button type="button" class="btn btn-primary">구매</button>
	  			<button type="button" class="btn btn-primary">이전</button>
	  		</c:if>
	  		</div>
		</div>		
	
		<br/>
		
		</div>
		

</body>
</html>