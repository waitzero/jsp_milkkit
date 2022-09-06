<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "manager.*" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../common/color.jsp"%> 
 
<%
 String kit_kind = request.getParameter("kit_kind");
 String kit_id = request.getParameter("kit_id");
 String id = "";
 int buy_price=0;
 try{
   if(session.getAttribute("id")==null)
     id="not";
   else
     id= (String)session.getAttribute("id");    
}catch(Exception e){}
%>

<html>
	<head>
		<title>Meal-Kit Shopping Mall</title>
		<link href="../common/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<% 	KitBean kitList = null;
		String kit_kindName="";		  
		KitPro kitPro = KitPro.getInstance();		 
		kitList = kitPro.getKit(Integer.parseInt(kit_id));
		     
		if(kit_kind.equals("100"))
			kit_kindName="한식";
		else if(kit_kind.equals("200"))
			kit_kindName="양식";  
		else if(kit_kind.equals("300"))
			kit_kindName="중식";
		else if(kit_kind.equals("400"))
			kit_kindName="일식";
	%>
		<form name="inform" method="post" action="cartInsert.jsp">
			<table> 
			   <tr height="30"> 
			     <td rowspan="6"  width="150"> <img src="../imageFile/<%=kitList.getKit_img()%>" border="0" width="150" height="200"></td> 
			     <td width="500"><font size="+1"> <b><%=kitList.getKit_title() %></b></font></td></tr> 
			   <tr><td width="500">재료 : <%=kitList.getKit_material()%></td></tr>
			   <tr><td width="500">알러지 성분 : <%=kitList.getKit_allergy()%></td></tr> 
			   <tr><td width="500">정가 : <%=NumberFormat.getInstance().format(kitList.getKit_price())%>원<br>
			      <%buy_price = (int)(kitList.getKit_price()*((double)(100-kitList.getDiscount_rate())/100)) ;%>
			            판매가 : <b><font color="red">
			            <%=NumberFormat.getInstance().format((int)(buy_price))%>원
			            </font></b></td>
			   </tr>          
			   <tr><td width="500">수량 : <input type="text" size="5"name="buy_count" value="1"> 개
			 <%
			   if(id.equals("not")){
			     if(kitList.getKit_count()==0){
			 %>
			        <b>일시품절</b>
			<%  
			     }           
			  }else{ 
			     if(kitList.getKit_count()==0){
			%>
			         <b>일시품절</b>
			                           
			<%   }else{ %>	 
			       <input type="hidden" name="kit_id" value="<%=kit_id %>">
			       <input type="hidden" name="kit_image" value="<%=kitList.getKit_img()%>">
			       <input type="hidden" name="kit_title" value="<%=kitList.getKit_title() %>">
			       <input type="hidden" name="buy_price" value="<%=buy_price %>">
			       <input type="hidden" name="kit_kind" value="<%=kit_kind %>">              
			       <input type="submit" value="장바구니에 담기">
			<%}}%>
			   <input type="button" value="목록으로" onclick="javascript:window.location='list.jsp?kit_kind=<%=kit_kind%>'">
			   <input type="button" value="메인으로" onclick="javascript:window.location='shopMain.jsp'">
			  </td></tr>         
			  <tr><td colspan="2" align="left"><br><%=kitList.getKit_how()%></td></tr> 
			</table>
		</form>
	</body>
</html>