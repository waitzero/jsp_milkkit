<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "cart.*" %>

<%@ include file="../common/color.jsp"%> 

<%
 String list = request.getParameter("list");
 String buyer = (String)session.getAttribute("id");
 String kit_kind = request.getParameter("kit_kind");
   
 if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain.jsp");        
 }else{
	CartPro cart = CartPro.getInstance();
	   
	if(list.equals("all"))
		cart.deleteAll(buyer);
	else
		cart.deleteList(Integer.parseInt(list));
	
	response.sendRedirect("cartList.jsp?kit_kind=" + kit_kind);
 }
%>