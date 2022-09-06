<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="color.jsp"%> 
<html>
<head>
<link href="var.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
 	try{
   		if(session.getAttribute("id")==null){ // 로그인을 하지 않은 사용자
%>
   			<form name="inform" method="post" action="member/loginPro.jsp">
         		아이디:  <input type="text" name="id" size="15" maxlength="50">   비밀번호:  <input type="password" name="passwd" size="15" maxlength="16">
    			<input type="submit" name="Submit" value="로그인"><input type="button" value="회원가입" OnClick="location.href='../shopping/shopMain.jsp?key=register'"/> 
   			</form>
   			<font class="font"color="red">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.*</font>    
 <%		} else {%>
    		<a href="../shopping/list.jsp?kit_kind=all">전체목록보기</a>&nbsp;
    		<a href="../shopping/cartList.jsp?kit_kind=all">장바구니보기</a>&nbsp;
    		<a href="../shopping/buyList.jsp">구매목록보기</a>&nbsp;
    		<a href="../shopping/myPage.jsp">마이페이지</a>&nbsp;
    		<br><br> 
    		<b><%=session.getAttribute("id")%></b> 님 , 즐거운 쇼핑시간이 되세요.
    		<input type="button"  value="로그아웃" onclick="javascript:window.location='member/logout.jsp'">
 <%
 		}
 	}catch(NullPointerException e){
	 	e.printStackTrace();
 	}
 %>
</body>
</html>