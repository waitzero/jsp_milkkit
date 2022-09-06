<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="customer.*" %>

<% request.setCharacterEncoding("utf-8");%>

<%
	String account = request.getParameter("account");
	String bank = request.getParameter("bank");
	String name = request.getParameter("name");
	CustomerPro customerPro = CustomerPro.getInstance();
	customerPro.insertAccount(account, bank, name);
	
	response.sendRedirect("../myPage.jsp");
%>