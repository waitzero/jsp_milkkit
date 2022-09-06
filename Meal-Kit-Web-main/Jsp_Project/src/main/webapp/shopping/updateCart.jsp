<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "cart.CartPro" %>

<%@ include file="../common/color.jsp"%> 

<%
 String cart_id = request.getParameter("cart_id");
 String buy_count = request.getParameter("buy_count");
 String kit_kind = request.getParameter("kit_kind");
 
 if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain.jsp");        
 }else{
	CartPro bookProcess = CartPro.getInstance();
    bookProcess.updateCount(Integer.parseInt(cart_id), Byte.parseByte(buy_count));
    response.sendRedirect("cartList.jsp?kit_kind=" + kit_kind);
 }
%> 