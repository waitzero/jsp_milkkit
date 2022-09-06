<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="manager.KitPro"%>

<% request.setCharacterEncoding("utf-8");%>

<%
  	int kit_id = Integer.parseInt(request.getParameter("kit_id"));
  	String kit_kind = request.getParameter("kit_kind");
 
  	KitPro kit = KitPro.getInstance();
  	kit.deleteKit(kit_id); 

  	response.sendRedirect("kitList.jsp?kit_kind=all");
%>