<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../common/color.jsp"%>


<%
	String id = (String)session.getAttribute("id");
%>
<html>
<head>
<title>Meal-Kit Shopping mall</title>
<link href="../../common/style.css" rel="stylesheet" type="text/css">
<link href="form.css" rel="stylesheet" type="text/css">
<style>
tbody{
position:relative;
left:100%;
}
</style>
</head>
<body >
	<p class="head-line">회원 탈퇴</p>
	<br>
	<div class="form-card">
					<div class="row justify-content-between text-left">
	<form method="POST" name="delForm" action="userDeletePro.jsp?id=<%=id%>" onsubmit="return deleteSave()"> 
 		<div class="container-fluid px-1 py-5 mx-auto">
   			 				<div class="row d-flex justify-content-center">
      					    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
      				 	    <div class="card">
 		<table>
 			<tr>
     			<td align="right" >
	    		<input type="button" value="메인으로" onclick="javascript:window.location='../shopMain.jsp'"/>
	    		<input type="button" value="마이페이지로" onclick="javascript:window.location='../myPage.jsp'"/>
     			</td>
 	 		</tr>
 			<tr id="po"height="30">
    			<td align=center >
      				<input type="submit" value="삭제" >  
   				</td>
		 	</tr>  
		</table> 
		</div>
						</div>
						</div>
						</div> 
	</form>
	</div>
</body>
</html>