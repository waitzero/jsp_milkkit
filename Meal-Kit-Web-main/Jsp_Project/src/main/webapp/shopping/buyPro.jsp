<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "cart.*" %>
<%@ page import = "buy.*" %>
<%@ page import = "manager.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>
<%
   String account = request.getParameter("account");
   String deliveryName = request.getParameter("deliveryName");
   String deliveryTel = request.getParameter("deliveryTel");
   String deliveryAddess = request.getParameter("deliveryAddess");
   String buyer = (String)session.getAttribute("id");
   
   CartPro cartProcess = CartPro.getInstance();
   List<CartBean> cartLists = cartProcess.getCart(buyer);
   
   BuyPro buyProcess = BuyPro.getInstance();
   
   buyProcess.insertBuy(cartLists,buyer,account, deliveryName, deliveryTel, deliveryAddess);
   
   response.sendRedirect("buyList.jsp");
%>