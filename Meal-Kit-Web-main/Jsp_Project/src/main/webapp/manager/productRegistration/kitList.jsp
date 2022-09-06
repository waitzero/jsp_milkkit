<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="manager.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="../../common/color.jsp"%> 

<%
	String managerId ="";
	try {
		managerId = (String)session.getAttribute("managerId");
		if(managerId==null || managerId.equals("")) {
       		response.sendRedirect("../logon/managerLoginForm.jsp");
		} else {
%> 

<%!
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    		List<KitBean> kitList = null; 
    		int number = 0;
    		String kit_kind="";
    
    		kit_kind = request.getParameter("kit_kind");
 
    		KitPro kitPro = KitPro.getInstance();
    		int count = kitPro.getkitCount();
    
    		if (count > 0) {
    			kitList = kitPro.getKits(kit_kind);
    		}
%>
<html>
<head>
<title>등록된 키트 목록</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
<link href="form.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
   			String kit_kindName="";
   			if(kit_kind.equals("100")) {
	   			kit_kindName="한식";
   			} else if(kit_kind.equals("200")) {
	   			kit_kindName="양식";  
   			} else if(kit_kind.equals("300")) {
	   			kit_kindName="중식";
   			} else if(kit_kind.equals("400")) {
	   			kit_kindName="일식";
   			} else if(kit_kind.equals("all")) {
	   			kit_kindName="전체";
   			}
%>
			<a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
			<p><%=kit_kindName%> 분류의 목록: 
<%			if(kit_kind.equals("all")) {%> 
    			<%=count%>개
<%			} else {%>
    			<%=kitList.size() %>개
<%			} %>
			</p>
			<table>
				<tr>
    				<td align="right" ">
       				<a href="kitRegisterForm.jsp">키트 등록</a>
    			</td>
			</table>

<%
  			if (count == 0) {
%>
				<table>
					<tr>
   						<td align="center">등록된 키트가 없습니다.</td>
				</table>

<%			} else {%>
				<table> 
					<tr height="100"> 
    					<td align="center"  width="60">번호</td> 
					    <td align="center"  width="60">밀키트 분류</td> 
					    <td align="center"  width="60">밀키트 이름</td> 
					    <td align="center"  width="60">가격</td> 
					    <td align="center"  width="60">수량</td>
					    <td align="center"  width="60">일키트 이미지</td>
					    <td align="center"  width="60">재료</td>
					    <td "align="center" width="60">만드는 방법</td>
					    <td align="center"  width="60">알러지 성분</td>
					    <td align="center"  width="60">할인율</td>
					    <td align="center"  width="60">수정</td>
					    <td align="center"  width="60">삭제</td>         
					</tr>
<%  
    			for (int i = 0 ; i < kitList.size() ; i++) {
    				KitBean kit = (KitBean)kitList.get(i);
%>
   					<tr height="100">
      					<td width="30"><%=++number%></td> 
      					<td width="30"><%=kit.getKit_kind()%></td>
      					<td width="30" align="left"><%=kit.getKit_title()%></td>
      					<td width="30" align="right"><%=kit.getKit_price()%></td> 
      					<td width="30" align="right">
<% 						if(kit.getKit_count()==0) {%>
         					<font color="red"><%="일시품절"%></font>
<% 						} else { %>
							<%=kit.getKit_count()%>
<%						} %>
      					</td> 
      					<td width="70"><%=kit.getKit_img()%></td>
      					<td width="70"><%=kit.getKit_material()%></td>
      					<div >
      					<td width="70" ><%=kit.getKit_how()%></td>
      					</div>
      					<td width="50"><%=kit.getKit_allergy()%></td>
      					<td width="30"><%=kit.getDiscount_rate()%></td>
      					<td width="50">
         					<a href="kitUpdateForm.jsp?kit_id=<%=kit.getKit_id()%>&kit_kind=<%=kit.getKit_kind()%>">수정</a></td>
      					<td width="50">
         					<a href="kitDeleteForm.jsp?kit_id=<%=kit.getKit_id()%>&kit_kind=<%=kit.getKit_kind()%>">삭제</a></td>    
   					</tr>
<%				}%>
				</table>
<%			}%>
			<br>
			<a href="../managerMain.jsp"> 관리자 메인으로</a> 
</body>
</html>

<% 
   		}
	} catch(Exception e) {
   		e.printStackTrace();
	}
%>