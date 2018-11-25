<%@ page contentType="text/html; charset=euc-kr" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
 <%-- 
<%@ page import="java.util.*"  %>

<%@ page import="com.model2.mvc.service.domain.Purchase" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Purchase> list= (List<Purchase>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%> 
--%>    



    
    
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetList(currentPage) {
/* 	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();	 */
	$("#currentPage").val(currentPage)
	$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
}
		
	$(function(){
		
		//getPurchase Event
		$(".ct_list_pop td:nth-child(1)").bind("click", function(){
			var tranNo = $(this).data("param");
			console.log(tranNo);
			self.location = "/purchase/getPurchase?tranNo="+tranNo
		});
		
		//getUserId Event
		$(".ct_list_pop td:nth-child(3)").bind("click", function(){
			var userId = $(this).data("param1");
			console.log(userId);
			self.location = "/user/getUser?userId="+userId
		});
		
		//���ǵ���  Event
		$(".ct_list_pop td:nth-child(11)").bind("click", function(){
			var tranNo = $(this).data("param2");
			console.log(tranNo);
			self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3"
		});
		
	
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
			
		$(".ct_list_pop:nth-child(2n+5)" ).css("background-color" , "whitesmoke");
		
		
	});	
		
		
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">
		��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	

	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}" />	
		<c:set var="trimTranCode" value="${fn:trim(purchase.tranCode)}"/> 
		
	<tr class="ct_list_pop">
		<td align="center" data-param="${purchase.tranNo}">
			<%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${i}</a> --%>
		${i}	
		</td>
		<td></td>
		<td align="left" id="getUserId" data-param1="${purchase.buyer.userId}">
		<%-- <a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a> --%>
		${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
		<td align="left">
			<c:if test="${trimTranCode=='1'}">
				���� ���ſϷ� �����Դϴ�.
			</c:if>
			<c:if test="${trimTranCode=='2'}">
				���� ������Դϴ�.  			
			</c:if>
			<c:if test="${trimTranCode=='3'}">
				���� ��ۿϷ��ϴ�.
			</c:if>  
		</td>
		<td></td>
		<td align="left" id="productReceive" data-param2="${purchase.tranNo}">	
			<c:if test="${trimTranCode=='2'}">
				<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a>	 --%>
			���ǵ���
			</c:if>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		 
			<jsp:include page="../common/pageNavigator.jsp"/>
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>