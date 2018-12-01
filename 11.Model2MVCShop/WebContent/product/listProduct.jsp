<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html>

<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<style type="text/css"></style>

<style>

   body {
         padding-top : 50px;
        }
        
   .thumbnail
   {
   		height : 400px;
   }


	
</style>



<script type="text/javascript">



<%--	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}--%>
	
	function fncGetList(currentPage){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
		
	}
			
	
	$(function(){
		

		//getProduct event
		$(".btn:contains('��ǰ����')").bind("click", function(){
			var prodNo = $(this).data("param");
			self.location = "/product/getProduct?prodNo="+prodNo+"&menu=search"
		});	
		
		//updateProduct event
		$(".btn:contains('��ǰ����')").bind("click", function(){
			var prodNo = $(this).data("param1");
			self.location= "/product/updateProductView?prodNo="+prodNo+"&menu=manage"
		});
		

		
		if('${param.menu}'=='manage'){  
 
			//����Ʈ ���� ������
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

			//��ǰ�� ���� ������
			$( "td:nth-child(2)" ).css("color" , "red");
		
			
			$("td:nth-child(3)").bind("click", function(){
				var prodNo = $(this).data("param3");			
				alert(prodNo);
				self.location = "/product/updateProductView?prodNo="+prodNo+"&menu=manage"
			
			});
		
		} 
		
			$("button.btn.btn-default").bind("click",function(){
				 fncGetList(1);
			});
		
			//����ϱ� event
			$("#transfer").bind("click", function(){
				var prodNo = $(this).data("param2");
				self.location = "/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=2"
			});
		
		
		
	});
	
		
</script>

</head>

<body>
	

	<jsp:include page="/layout/toolbar.jsp" />



	<div class="container"> 

	<div class="page-header text-info">
	
		<c:if test="${param.menu=='manage'}">						
		<h3>��ǰ����</h3>
		</c:if>			
	   	<c:if test="${param.menu=='search'}">		
	   	<h3>��ǰ �����ȸ</h3>
	   	</c:if>		
	</div>


	<div class="row">
	
	 <div class="col-md-6 text-left">
	 
		  <p class="text-primary">
		    ��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		  </p>
     </div>

 	 <div class="col-md-6 text-right">
 	 
		<form class="form-inline" name="detailForm">
		
		 <div class="form-group">  
			<select class="form-control" name="sortCondition" onchange="javascript:fncGetList('1');">
				<option value=null>���ݼ� </option>
				<option value="desc" ${!empty search.sortCondition && search.sortCondition=='desc' ? "selected" : "" }>�������ݼ�</option>
				<option value="asc" ${!empty search.sortCondition && search.sortCondition=='asc' ? "selected" : "" }>�������ݼ�</option>	
			</select>   			
		 </div>
		
	  	 <div class="form-group">
			<select class="form-control" name="searchCondition" >
				<option value="0" ${!empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${!empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${!empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>	
			</select>
	   	</div>
	   
 	  	<div class="form-group">
	    	  <label class="sr-only" for="searchKeyword">�˻���</label>
		  	  <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				         	value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
	 	</div>	   
	  
	  	<button type="button" class="btn btn-default">�˻�</button>
	  
	  	<input type="hidden" id="currentPage" name="currentPage" value=""/>
	  
	  </form>
    </div> 
  
   </div> 
   
   
<!-- //////////////////////////// listProduct search start //////////////////////////////////// -->
   
   	 <c:if test="${param.menu=='search'}">  

   		<c:set var="i" value="0"/>
 		<c:forEach var="product" items="${list}">
 		
 		<c:set var="i" value="${ i+1 }" />
		<c:set var="trimTranCode" value="${fn:trim(product.proTranCode)}"/> 
            
            
            
            <div class="col-sm-6 col-md-4">
            
               <div class="thumbnail">
               		
                <img src="../images/uploadFiles/${product.fileName}" width="400px;" height="200px;">
                  	
                     <div class="caption">
                     
                     <h4><strong>${product.brandIden.brandName}</strong></h4>
                    
                     <h5>��ǰ�� : ${product.prodName}</h5>
                     
                     <p>���� : ${product.price}�� </p>
                      
                     <p>������� : 
                     
					<c:if test="${user==null && param.menu=='search'}">
							${trimTranCode=='0' ? '�Ǹ���' : '������'}		 
					</c:if>
		 
					<c:if test="${! (user==null)}">
						<c:if test="${param.menu=='search'}">
							<c:if test="${user.role=='admin'}">
								<c:if test="${trimTranCode=='0'}">
									�Ǹ���
								</c:if>
								<c:if test="${trimTranCode=='1'}">
									���ſϷ�
								</c:if>
								<c:if test="${trimTranCode=='2'}">
									�����
								</c:if>
								<c:if test="${trimTranCode=='3'}">
									��ۿϷ�
								</c:if>			
		 	   			  </c:if>
		    		 	  <c:if test="${user.role=='user'}">
		  	 		         ${trimTranCode=='0'? '�Ǹ���' : '������'}
		  			      </c:if>
			 	      </c:if>
				  </c:if>		
		 		  </p>	
		 		  
		 		  <p align="right">
					<c:if test="${trimTranCode=='0'}">
		 			<a href="#" class="btn btn-primary" role="button" data-param="${product.prodNo}">��ǰ����</a>
		 		    </c:if>
		 		    <c:if test="${!(trimTranCode=='0')}">
		 		    <a href="#" class="btn btn-default" role="button" data-param="${product.prodNo}">������</a>
		 		    </c:if>
		  	 	 </p>
                  </div>
               </div>
             </div>  
       </c:forEach>      
	 </c:if>

<!-- //////////////////////////// listProduct search end ////////////////////////////////////// -->

<!-- //////////////////////////// listProduct manage start //////////////////////////////////// -->

    <c:if test="${param.menu=='manage'}">
      
      <table class="table table-hover table-striped" >      
        
        <thead>  
           <tr>
            <th align="center">No</th>
            <th align="left" >�귣��</th>
            <th align="left">��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">�������</th>
            <th align="left">��������</th>
           </tr>  
       </thead>
       
       <tbody>     
       
       	<c:set var="i" value="0"/>
 		<c:forEach var="product" items="${list}">
 		<c:set var="i" value="${ i+1 }" />
		<c:set var="trimTranCode" value="${fn:trim(product.proTranCode)}"/> 
		
	     	<tr>
			  <td align="center">${ i }</td>
			  <td align="left">${product.brandIden.brandName}</td>
			  <td align="left" data-param3="${product.prodNo}">${product.prodName}</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.manuDate}</td>
			  <td align="left">
			  			
			   <c:if test="${trimTranCode=='0'}">
		  	   	�Ǹ���
		  	   </c:if>
		  	   <c:if test="${trimTranCode=='1'}">
		     	<!-- ���ſϷ�<a href ="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a>  -->
		   		���ſϷ� <span id="transfer" data-param2="${product.prodNo}">����ϱ�</span>
		  	   </c:if>
		  	   <c:if test="${trimTranCode=='2'}">
		  	   	�����
		  	   </c:if>
		  	   <c:if test="${trimTranCode=='3'}">
		  	   	��ۿϷ�   		
		  	   </c:if>
			  </td>
			  <td align="left"><a href="#" class="btn btn-default btn-xs" role="button" data-param1="${product.prodNo}">��ǰ����</a></td>
			</tr>
		 </c:forEach>
	  </tbody>
     </table>	
   </c:if> 


<!-- //////////////////////////// listProduct manage end //////////////////////////////////// -->
 		
 		
 	</div>	 	 
		
 	<jsp:include page="../common/pageNavigator_new.jsp"/> 

</body>
</html> 	
 		 