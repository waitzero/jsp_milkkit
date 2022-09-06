<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="customer.*" %>

<% request.setCharacterEncoding("utf-8");%>

 <jsp:useBean id="member" class="customer.CustomerBean">
      <jsp:setProperty name="member" property="*"/>
 </jsp:useBean>
 
<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()) );
	CustomerPro logon = CustomerPro.getInstance();
  	logon.insertMember(member);
%>

<script>
    alert("회원가입되었습니다.");
	location.href="../shopMain.jsp";
</script>

