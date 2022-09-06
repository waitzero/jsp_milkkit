<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "manager.*" %>

<%@ include file="../../common/color.jsp"%> 
 
<%
	String managerId ="";
	try {
		managerId = (String)session.getAttribute("managerId");
   		if(managerId==null || managerId.equals("")){
    	  	response.sendRedirect("../logon/managerLoginForm.jsp");
		} else {
			int kit_id = Integer.parseInt(request.getParameter("kit_id"));
			String kit_kind = request.getParameter("kit_kind");
	
			KitPro kitPro = KitPro.getInstance();
			KitBean kit =  kitPro.getKit(kit_id); 
%>
<html>
<head>
<title>상품수정</title>
<link href="../../common/style.css" rel="stylesheet" type="text/css">
<link href="form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../common/script.js"></script>
</head>
<body>
			<p class="head-line">밀키트 정보 수정</p><br>	
			<div class="form-card">
					<div class="row justify-content-between text-left">	
			<form method="post" name="writeform" action="kitUpdatePro.jsp"  enctype="multipart/form-data">
				<div class="container-fluid px-1 py-5 mx-auto">
   			 				<div class="row d-flex justify-content-center">
      					    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
      				 	    <div class="card">
				<table>
					<tr>
						<td class="move" align="right" colspan="2">
						    <a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
						    <a href="kitList.jsp?kit_kind=<%=kit_kind%>">목록으로</a>
					  	</td>
				   	</tr>
				   	<tr>
					    <td  width="100" >분류 선택</td>
					    <td  width="400"  align="left">
					       	<select name="kit_kind">
					           	<option value="100" 
<%									if (kit.getKit_kind().equals("100")) {%>selected<%} %>
					            >한식</option>
					           <option value="200" 
<%									if (kit.getKit_kind().equals("200")) {%>selected<%} %>
					           >양식</option>
					           <option value="300" 
<%									if (kit.getKit_kind().equals("300")) {%>selected<%} %>
					           >중식</option>
					           <option value="400" 
<%									if (kit.getKit_kind().equals("400")) {%>selected<%} %>
					           >일식</option>
					       	</select>
				    	</td>
				   	</tr>
				  <tr>
					<td  width="100" >밀키트 이름</td>
					<td  width="400" align="left">
						<input type="text" size="50" maxlength="50" name="kit_title" value="<%=kit.getKit_title() %>">
					    <input type="hidden" name="kit_id" value="<%=kit_id%>"></td>
				  </tr>
				  <tr>
				    <td  width="100" >가 격</td>
				    <td  width="400" align="left">
				        <input type="text" size="10" maxlength="9" name="kit_price" value="<%=kit.getKit_price() %>">원</td>
				  </tr>
				  <tr>
				    <td  width="100" >수 량</td>
				    <td  width="400" align="left">
				        <input type="text" size="10" maxlength="5" name="kit_count" value="<%=kit.getKit_count() %>">권</td>
				  </tr>
				  <tr>
				    <td  width="100" >이미지</td>
				    <td  width="400" align="left">
				        <input type="file" name="kit_img" value="<%=kit.getKit_img()%>"></td>				  
				  </tr>
				  <tr>
					<td  width="100" >재료 </td>
				    <td  width="400" align="left">
				     	<textarea name="kit_material" rows="13" cols="40"><%=kit.getKit_material() %></textarea> </td>
				  </tr>
				  <tr>
				    <td  width="100" >만드는 방법</td>
				    <td  width="400" align="left">
				     	<textarea name="kit_how" rows="13" cols="40"><%=kit.getKit_how() %></textarea> </td>
				  </tr>
				  <tr>
				    <td  width="100" >알러지 성분</td>
				    <td  width="400" align="left">
				     	<textarea name="kit_allergy" rows="13" cols="40"><%=kit.getKit_allergy() %></textarea> </td>
				  </tr>
				  <tr>
				    <td  width="100" >할인율</td>
				    <td  width="400" align="left">
				        <input type="text" size="5" maxlength="2" name="discount_rate" value="<%=kit.getDiscount_rate() %>">%</td>
				  </tr>
				  <tr>      
					<td colspan=2 align="center"> 
				  	<input type="button" value="밀키트 정보 수정" onclick="updateCheckForm(this.form)">    <input type="reset" value="다시작성">
					</td>
				  </tr>
				</table>         
				</div>
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