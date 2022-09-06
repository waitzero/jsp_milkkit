<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "cart.*" %>

<% request.setCharacterEncoding("utf-8");%>

<%
   String kit_kind = request.getParameter("kit_kind");
   String buy_count = request.getParameter("buy_count");
   String kit_id = request.getParameter("kit_id");
   String kit_title = request.getParameter("kit_title");
   String buy_price = request.getParameter("buy_price");
   String kit_img = request.getParameter("kit_img");
   String buyer = (String)session.getAttribute("id");
%>

<jsp:useBean id="cart" scope="page" class="cart.CartBean"/>

<%
	cart.setKit_id(Integer.parseInt(kit_id));
	cart.setKit_title(kit_title);
	cart.setBuy_price(Integer.parseInt(buy_price));
	cart.setBuy_count(Byte.parseByte(buy_count));
	cart.setKit_img(kit_img);
  	
  	cart.setBuyer(buyer);
  
  	CartPro cartProcess = CartPro.getInstance();
  	cartProcess.insertCart(cart);
  	response.sendRedirect("cartList.jsp?kit_kind="+kit_kind);
%>