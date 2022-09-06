<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="customer.CustomerPro"%>

<% request.setCharacterEncoding("utf-8");%>

<%
  	String id = request.getParameter("id");
 
  	CustomerPro customer = CustomerPro.getInstance();
  	customer.deleteUser(id);
  	
  	
  	session.invalidate();
  	response.sendRedirect("../shopMain.jsp");
%>