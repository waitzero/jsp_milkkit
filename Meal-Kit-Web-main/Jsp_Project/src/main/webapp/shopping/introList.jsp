<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="manager.*"%>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../common/color.jsp"%> 

<html>
<head>
<title>Meal-kit Shopping Mall</title>
<link href="../commonc/style.css" rel="stylesheet" type="text/css">
<link href="styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<h3>상품</h3>
<%
  KitBean kitLists[] = null;
  int number = 0;
  String kit_kindName="";
  
  KitPro kit = KitPro.getInstance();
  for(int i=1; i<=4;i++){
	  kitLists = kit.getKits(i+"00", 1);
    
     if(kitLists[0].getKit_kind().equals("100")){
    	 kit_kindName="한식";
     }else if(kitLists[0].getKit_kind().equals("200")){
    	 kit_kindName="양식";
     }else if(kitLists[0].getKit_kind().equals("300")){
    	 kit_kindName="중식";
     }else if(kitLists[0].getKit_kind().equals("400")){
    	 kit_kindName="일식";
     }
%>
  <br><font size="+1"><b><%=kit_kindName%> 분류의 제품목록: 
  <a href="list.jsp?kit_kind=<%=kitLists[0].getKit_kind()%>">더보기</a>
  </b></font>
<%             
  for(int j=0;j<kitLists.length;j++){
%>

    <table> 
      <tr height="30"> 
        <td rowspan="4" >
          <a href="kitContent.jsp?kit_id=<%=kitLists[j].getKit_id()%>&kit_kind=<%=kitLists[0].getKit_kind()%>">
             <img src="../imageFile/<%=kitLists[j].getKit_img()%>" 
             border="0" width="80" height="100"></a></td> 
       <td width="350"><font size="+1"><b>
          <a href="kitContent.jsp?kit_id=<%=kitLists[j].getKit_id()%>&kit_kind=<%=kitLists[0].getKit_kind()%>">
              <%=kitLists[j].getKit_title() %></a></b></font></td> 
       <td rowspan="4" width="100">
          <%if(kitLists[j].getKit_count()==0){ %>
              <b>일시품절</b>
          <%}else{ %>
               &nbsp;
          <%} %>
       </td>
     </tr>        
     <tr height="30"> 
       <td width="350">재료 : <%=kitLists[j].getKit_material()%></td> 
     </tr>
     <tr height="30"> 
       <td width="350">알러지 성분 : <%=kitLists[j].getKit_allergy()%></td>
     </tr>
     <tr height="30" > 
       <td width="350">정가 :<%=NumberFormat.getInstance().format(kitLists[j].getKit_price())%>원<br>
                판매가 : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(kitLists[j].getKit_price()*((double)(100-kitLists[j].getDiscount_rate())/100)))%>
            </font></b>원</td> 
     </tr> 
     </table>
     <br>
<%
  }
}
%>

</body>
</html>