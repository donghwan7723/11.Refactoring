<%@ page contentType="text/html; charset=euc-kr" %>

<%--   
<%@ page import = "com.model2.mvc.service.domain.*" %>
<% Purchase purchase = (Purchase)request.getAttribute("purchasevo"); %>
<% System.out.println("������ʹ� addPurchaseView.jsp ������"); %>
	 													--%>
<html>
<head>
<title>Insert title here</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">


</script>

</head>

<body>


������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��۹�ȣ</td>
		<td>${purchase.tranNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>

		<td>${purchase.paymentOption=='1' ? '���ݱ���' : '�ſ뱸��'}</td>
		<td></td>
		
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.divyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.divyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.divyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>