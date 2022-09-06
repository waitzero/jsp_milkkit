<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "cart.*" %>
<%@ page import = "customer.*" %>
<%@ page import = "buy.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../common/color.jsp"%> 

<%
   String kit_kind = request.getParameter("kit_kind");
   String buyer = (String)session.getAttribute("id");
%>

<html>
	<head>
		<title>Meal-Kit Shopping mall</title>
		<link href="../common/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<%
		List<CartBean> cartLists = null;
		List<String> accountLists = null;
		List<BuyBean> addressLists = null;
		CartBean cartList = null;
		CustomerBean member = null;
		int number = 0;
		int total = 0;
		
		if(session.getAttribute("id")==null){
			response.sendRedirect("shopMain.jsp");        
		}else{
			CartPro cart = CartPro.getInstance();
		    cartLists = cart.getCart(buyer);
		    
		    CustomerPro customer = CustomerPro.getInstance();
		    member = customer.getMember(buyer);
		    
		    BuyPro buy = BuyPro.getInstance();
		    accountLists = buy.getAccount();
		%>
		  <h3><b>구매 목록</b></h3>
		
		  <form name="inform" method="post" action="updateCart.jsp">
		  <table> 
		    <tr> 
		      <td width="50">번호</td> 
		      <td width="300">밀키트 이름</td> 
		      <td width="100">판매가격</td>
		      <td width="150">수량</td> 
		      <td width="150">금액</td>
		    </tr>   
		<%
		  for(int i=0;i<cartLists.size();i++){
		     cartList = cartLists.get(i);
		%>
		     
		     <tr> 
		       <td width="50"><%=++number %></td> 
		       <td width="300" align="left">
		           <%=cartList.getKit_title()%>
		       </td> 
		       <td width="100"><%=NumberFormat.getInstance().format(cartList.getBuy_price())%></td>
		       <td width="150"><%=cartList.getBuy_count()%></td> 
		       <td width="150">
		          <%total += cartList.getBuy_count()*cartList.getBuy_price();%>
		          <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
		      </td>
		    </tr>
		<%
		  }
		%>
		  <tr>
		    <td colspan="5" align="right"><b>총 구매금액 : <%=NumberFormat.getInstance().format(total)%></b></td>
		  </tr>
		</table>
		</form>
		<%} 
		 %>
		<br>
		<form method="post" action="buyPro.jsp" name="buyinput">
			 <table>
			 	<tr>
			   		<td  colspan="2"><font size="+1" ><b>주문자 정보</b></font></td>
		   		</tr>
			   	<tr> 
			    	<td  width="200" align="left">성명</td>
			    	<td  width="400" align="left"><%=member.getName()%></td>
			   	</tr>
			   	<tr> 
				    <td  width="200" align="left">전화번호</td>
				    <td  width="400" align="left"><%=member.getTel()%></td>
			   	</tr>
			   	<tr> 
				    <td  width="200" align="left">주소</td>
				    <td  width="400" align="left"><%=member.getAddress()%></td>
			   	</tr>
			   	<tr> 
				     <td  width="200" align="left">결제계좌</td>
				     <td  width="400" align="left">
				       <select name="account">
				        <%
				          for(int i=0;i<accountLists.size();i++){
				           	String accountList = accountLists.get(i);
				         %>
				           <option value="<%=accountList %>"><%=accountList %></option>
				        <%}%>
				       </select>
			   	 	</td>
			  	</tr>
			  </table>
			  <br>
		   
			<table>
			  	<tr> 
			   		<td colspan="2" align="center"><font size="+1" ><b>배송지 정보</b></font></td>
			  	</tr>
			  	<tr> 
			    	<td width="200" align="left">성명</td>
			   		<td width="400" align="left"><input type="text" name="deliveryName" value="<%=member.getName()%>"></td>
			  	</tr>
			  	<tr> 
				    <td width="200" align="left">전화번호</td>
				    <td width="400" align="left"><input type="text" name="deliveryTel" value="<%=member.getTel()%>"></td>
			 	</tr>
			  	<tr> 
				    <td width="200" align="left">주소</td>
				    <td width="400" align="left"><input type="text" name="deliveryAddess" value="<%=member.getAddress()%>"></td>
			  	</tr>
			   	<tr> 
			     	<td colspan="2" align="center" >
			       		<input type="submit" value="확인" >
			       		<input type="button" value="취소" onclick="javascript:window.location='shopMain.jsp'">      
			    	 </td>
			   	</tr>
			  </table>
		  </form>
	</body>
</html>