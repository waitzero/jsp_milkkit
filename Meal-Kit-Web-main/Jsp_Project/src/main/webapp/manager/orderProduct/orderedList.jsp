<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "buy.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../../common/color.jsp"%> 

<%
  	String buyer = (String)session.getAttribute("id");
%>

<html>
<head>
	<title>Milk kit Mall</title>
		<link href="order.css" rel="stylesheet" type="text/css">
	<link href="../../common/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	List<BuyBean> buyLists = null;
	BuyBean buyList = null; 
	int count = 0;

	BuyPro buyProcess = BuyPro.getInstance();
	count = buyProcess.getListCount();

	if(count == 0) {
%>
  	<h3><b>주문목록</b></h3>
  
  	<table> 
    	<tr><td>구매목록이 없습니다.</td> </tr>
  	</table>
  	<a " href="../managerMain.jsp"> 관리자 메인으로</a> 
<%
	} else {
   		buyLists = buyProcess.getBuyList();
%><a class="move" href="../managerMain.jsp"> 관리자 메인으로</a>
  		<h3 class="kaboom"><b class="text">주문목록</b></h3>
    	<div class="container mt-5 px-2">
    <div class="mb-2 d-flex justify-content-between align-items-center">
        <div class="position-relative"> <span class="position-absolute search"><i class="fa fa-search"></i></span> </div>
        <div class="px-2"> <span><i class="fa fa-angle-down"></i></span> <i class="fa fa-ellipsis-h ms-3"></i> </div>
    </div>
    <div class="table-responsive">
  		<table> 
	    	<tr class="bg-light"> 
	      		<td scope="col" width="5%">주문번호</td> 
	      		<td scope="col" width="5%">주문자</td> 
	      		<td scope="col" width="5%">밀키트 이름</td>
	      		<td scope="col" width="5%">주문가격</td> 
	      		<td scope="col" width="5%">주문수량</td>
	      		<td scope="col" width="5%">주문일</td>
	      		<td scope="col" width="14%">결제계좌</td>
	      		<td scope="col" width="5%">배송명</td>
	      		<td scope="col" width="5%">배송지주소</td>
	      		<td scope="col" width="5%">배송지전화</td>
	      		<td scope="col"class="text-end" width="5%">배송지상황</td>
	   		</tr>
<%
			for(int i=0;i<buyLists.size();i++){
	    		buyList = (BuyBean)buyLists.get(i);	     	 
%>
		   		<tr> 
		      		<td><%=buyList.getBuy_id() %></td> 
		      		<td><%=buyList.getBuyer() %></td> 
		      		<td><%=buyList.getKit_title() %></td>
		      		<td><%=buyList.getBuy_price() %></td> 
		      		<td><%=buyList.getBuy_count()%></td>
		      		<td><%=buyList.getBuy_date().toString() %></td>
		      		<td><%=buyList.getAccount() %></td>
		      		<td><%=buyList.getDeliveryName() %></td>
		      		<td><%=buyList.getDeliveryTel() %></td>
		      		<td><%=buyList.getDeliveryAddress() %></td>
		      		<td><%=buyList.getSanction() %></td>
		    	</tr>
<%			} %>
		</table>
		</div>
		</div>
<%	} %>
</body>
</html>