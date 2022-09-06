<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../common/color.jsp"%> 

<%
	String managerId ="";
	try{
		managerId = (String)session.getAttribute("managerId");
		if(managerId==null || managerId.equals("")){
       		response.sendRedirect("../logon/managerLoginForm.jsp");
		} else {
       		int kit_id = Integer.parseInt(request.getParameter("kit_id"));
       		String kit_kind = request.getParameter("kit_kind");
%>

<html>
<head>
<title>책삭제</title>
<link href="../../common/style.css" rel="stylesheet" type="text/css">
<link href="form.css" rel="stylesheet" type="text/css">
</head>
<style>
tbody{
position:relative;
left:100%;
}
</style>
<body>
	<p class="head-line">밀키트 삭제</p>
	<br>
	
	<div class="form-card">
	<div class="row justify-content-between text-left">
	<form method="POST" name="delForm"  
   		action="kitDeletePro.jsp?kit_id=<%= kit_id%>&kit_kind=<%=kit_kind%>" 
   		onsubmit="return deleteSave()"> 
   		<div class="row d-flex justify-content-center">
      <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
      <div class="card">
 		<table class="dt">
 			<tr height="30">
    			<td align=center >
      				<input class="d-btn"type="submit" value="삭제" >  
   				</td>
		 	</tr> 
 			<tr>
     			<td class="l-btn" align="right"  >
	    		<a   href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
	    		<a  href="kitList.jsp?kit_kind=<%=kit_kind%>">목록으로</a>
     			</td>
 	 		</tr>
  
 
		</table>
		</div>
		</div>
		</div> 
	</form>
	</div>
	</div>
</body>
</html>
<% 
   		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>