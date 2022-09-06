<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/color.jsp"%>

<%
   String managerId ="";
   try {
	   managerId = (String)session.getAttribute("managerId");
	   if(managerId==null || managerId.equals("")){
          response.sendRedirect("logon/managerLoginForm.jsp");
	   } else {
%>
<html>
<head>
<style>
    a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
</style>

<title>관리</title>
<link href="managermain.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="sidenav">
         <div class="login-main-text">
            <h2>Application<br> Manage Page</h2>
            <p>Support or Management from here.</p>
         </div>
      </div>
      
      <div class="main">
  	<form method="post" action="logon/managerLogout.jsp">
  		<div class="boom">
	 	<b>관리작업중.. </b><input type="submit" value="로그아웃">
	 	<a href="../shopping/shopMain.jsp">메인페이지로</a>
	 	</div>
  	</form>
  	</div>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<div class="object">
   	<table class="table1">
     	<tr>
     		<td class="bolde"align="center">상품관련 작업</td>
     	</tr>
     	<tr>
     		<td>
     			<a class="middel"href='productRegistration/kitRegisterForm.jsp'>상품 등록</a>
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<a class="middel"href='productRegistration/kitList.jsp?kit_kind=all'>상품수정/삭제</a>
	     	</td>
	     </tr>
   	</table><br><br>
   
   	<table>
     	<tr>
     		<td class="bolde" align="center">구매된 상품관련 작업</td>
     	</tr>
     	<tr>
     		<td><a class="middel" href='orderProduct/orderedList.jsp'>전체구매목록 확인</a></td>
     	</tr>
     </table>
	</div>

</body>
</html>
<% 
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>