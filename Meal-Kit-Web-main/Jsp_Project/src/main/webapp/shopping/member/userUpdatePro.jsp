<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "customer.*" %>
<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="member" scope="page" class="customer.CustomerBean">
</jsp:useBean>

<%
 	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	String allergy = request.getParameter("allergy");

	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setAddress(address);
	member.setTel(tel);
	member.setAllergy(allergy);
	

 	CustomerPro customerPro = CustomerPro.getInstance();
 	customerPro.updateUser(member, id);

  	session.invalidate();
  	response.sendRedirect("../shopMain.jsp");
%>