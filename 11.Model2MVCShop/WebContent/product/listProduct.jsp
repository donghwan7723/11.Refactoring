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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css"></style>

<style>

   body {
         padding-top : 50px;
        }

	img {width:275px; height: 185px;} 
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
            
            <div class="col-sm-6 col-md-4" width="300px" height="400px">
            
               <div class="thumbnail" height="300px;">
               		
                <img src="../images/uploadFiles/${product.fileName}">
                  	
                     <div class="caption" height="200px;">
                     
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
			  <td align="left">${product.prodName}</td>
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
 		 
<%--  <body bgcolor="#ffffff" text="#000000">


<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<input type="hidden" name="prodNo" value="${param.menu}"/>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

			
				<tr>
				<c:if test="${param.menu=='manage'}">						
					<td width="93%" class="ct_ttl01">��ǰ ����</td>
				</c:if>			
	   			<c:if test="${param.menu=='search'}">		
	   				<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
	   			</c:if>	
	   			</tr>	
			
			</table>
		</td>
		

		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${!empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${!empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${!empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>	
			</select>
			<input type="text" name="searchKeyword" value="${search.searchKeyword}"
							 class="ct_input_g" style="width:200px; height:19px" />
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
				<!--  		<a href="javascript:fncGetList('1');">�˻�</a>    -->
					<span class = "searchfor">�˻�</span>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

	<select name="sortCondition" class="ct_input_g" style="width:80px" onchange="javascript:fncGetList('1');">
		<option value=null>���ݼ� </option>
		<option value="desc" ${!empty search.sortCondition && search.sortCondition=='desc' ? "selected" : "" }>�������ݼ�</option>
		<option value="asc" ${!empty search.sortCondition && search.sortCondition=='asc' ? "selected" : "" }>�������ݼ�</option>	
	</select>   			


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�귣��</td>
		<td class="ct_line02"></td>		
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
	   <c:set var="trimTranCode" value="${fn:trim(product.proTranCode)}"/> 
 	   <c:set var="i" value="${i+1}" /> 
	   <tr class="ct_list_pop">
		<td align="center">${i}</td>
		<td></td>
		<td align="left">
		${product.brandIden.brandName}
		</td>
		<td></td>
		<td align="left" data-param="${product.prodNo}" data-param1="${trimTranCode}">
		<c:if test="${param.menu=='manage'}">
	     <!--  	<a href = "/product/updateProductView?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a>  -->
		${product.prodName}
		</c:if>
		<c:if test="${param.menu=='search'}">
			<c:if test="${!(trimTranCode=='0')}">
			${product.prodName}
			</c:if>
			<c:if test="${trimTranCode=='0'}">
		 <!--	<a href = "/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a>   -->
		    ${product.prodName}
			</c:if>
		</c:if>
		</td>
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left">${product.regDate}</td>
		<td></td>
		<td align="left" data-param2="${product.prodNo}" data-param3="${product.proTranCode}">
 			

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
		 <c:if test="${param.menu=='manage'}">
		
			   <c:if test="${trimTranCode=='0'}">
		  	   		�Ǹ���
		  	   </c:if>
		  	   
		  	   <c:if test="${trimTranCode=='1'}">
		  	<!-- ���ſϷ�<a href ="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a>  -->
		  		���ſϷ� <span id="transfer">����ϱ�</span>
		  	   </c:if>
		  	   
		  	   <c:if test="${trimTranCode=='2'}">
		  	   		�����
		  	   </c:if>
		  	   
		  	   <c:if test="${trimTranCode=='3'}">
		  	   		��ۿϷ�   		
		  	   </c:if>
		 </c:if>
	</c:if>		

		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>

				<jsp:include page="../common/pageNavigator.jsp"/>
   
    	</td>
	</tr>
	
</table> 
<!--  ������ Navigator �� -->

</form>  


</body>
</html>--%>
