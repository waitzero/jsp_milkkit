<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "cart.*" %>

<%@ include file="../common/color.jsp"%> 

<%
 String cart_id = request.getParameter("cart_id");
 String buy_count = request.getParameter("buy_count");
 String kit_kind = request.getParameter("kit_kind");
 

 if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain.jsp");        
 }else{
%>
<html>
<head>
<title>Meal-Kit Shopping Mall</title>
<link href="../common/style.css" rel="stylesheet" type="text/css">
</head>
<body">
<form method="POST" name="updateForm"  action="updateCart.jsp" > 
	 변경할 수량 : 
	 <input type="text" name="buy_count" size="5" value="<%=buy_count%>">
     <input type="hidden" name="cart_id" value="<%=cart_id%>">
     <input type="hidden" name="kit_kind" value="<%=kit_kind%>">
	 <input type="submit" value="변경" >  
</form>
</body>
</html>
<%}%>