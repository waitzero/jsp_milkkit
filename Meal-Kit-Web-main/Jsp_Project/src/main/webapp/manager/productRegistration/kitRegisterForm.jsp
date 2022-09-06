<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>

<%@ include file="../../common/color.jsp"%> 

<%
   	String managerId ="";
   	try{
	   	managerId = (String)session.getAttribute("managerId");
	   	if(managerId==null || managerId.equals("")) {
           	response.sendRedirect("../logon/managerLoginForm.jsp");
	   	} else {
%>

			<html>
				<head>
					<title>상품등록</title>
					<link href="../../common/style.css" rel="stylesheet" type="text/css">
					<link href="form.css" rel="stylesheet" type="text/css">
					<script type="text/javascript" src="../../common/script.js"></script>
				</head>
				<body >
					<p class="head-line">밀키트 등록</p>
					<br>
					<div class="form-card">
					<div class="row justify-content-between text-left">
					<form  method="post" name="writeform" action="kitRegisterPro.jsp" enctype="multipart/form-data">
					<div class="container-fluid px-1 py-5 mx-auto">
   			 				<div class="row d-flex justify-content-center">
      					    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
      				 	    <div class="card">
						<table>
							<tr>
						    	<td class="move"align="right" colspan="2"><a href="../managerMain.jsp">관리자 메인으로</a> </td>
						   	</tr>
						   	
						   	<tr>
						    	<td width="100" >분류 선택</td>
						    	<td width="400" align="left">
							       <select name="kit_kind">
							           <option value="100">한식</option>
							           <option value="200">양식</option>
							           <option value="300">중식</option>
							           <option value="400">일식</option>
							       </select>
						    	</td>
						  	<tr>
						  	<tr>
							    <td width="100" >밀키트 이름</td>
							    <td width="400" align="left"><input type="text" size="50" maxlength="50" name="kit_title"></td>
							</tr>
						  	<tr>
							    <td width="100" >가 격</td>
							    <td width="400" align="left"><input type="text" size="10" maxlength="9" name="kit_price">원</td>
						  	</tr>
						  	<tr>
							    <td  width="100" >수 량</td>
							    <td  width="400" align="left"><input type="text" size="10" maxlength="5" name="kit_count">개</td>
						  	</tr>
						  	<tr>
							    <td width="100" >이미지</td>
							    <td width="400" align="left"><input type="file" name="kit_image"></td>
						  	</tr>
						  	<tr>
							    <td width="100" >재 료</td>
							    <td width="400" align="left"><textarea name="kit_material" rows="13" cols="40"></textarea></td>
						  	</tr>
						  	<tr>
							    <td width="100" >만드는 방법</td>
							    <td width="400" align="left"><textarea name="kit_how" rows="13" cols="40"></textarea></td>
						  	</tr>
						  	<tr>
							    <td width="100" >알러지 성분</td>
							    <td width="400" align="left"><textarea name="kit_allergy" rows="13" cols="40"></textarea></td>
						  	</tr>
						 	<tr>
						    	<td width="100" >할인율</td>
						    	<td width="400" align="left"><input type="text" size="5" maxlength="2" name="discount_rate">%</td>
						  	</tr>
							<tr>    
								<td colspan=2 align="center"> 
							  		<input class="form-group col-sm-6" type="button" value="등록" onclick="checkForm(this.form)">   <input type="reset" value="다시작성">
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
<% 
	   	}
	   
   	}catch(Exception e){
		e.printStackTrace();
	}
%>