<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "customer.*" %>
<%@ include file="../../common/color.jsp"%> 

<%
	String id = (String)session.getAttribute("id");
	CustomerPro customerPro = CustomerPro.getInstance();
	CustomerBean member = customerPro.getMember(id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Meal-Kit Shopping mall</title>
<link href="update.css" rel="stylesheet" type="text/css">
</head>
<body >
<div class="card">
			<p class="b-name">유저 정보 수정</p><br>		
			<form method="post" name="writeform" action="userUpdatePro.jsp" >
	<ul>
 		<li >	
 			<label for="id">아이디</label>
          	<input type="email" id="id" name="id"  size="20" maxlength="50" value="<%=member.getId()%>" autofocus/>
          	
        </li>
      	<li>
      	 	<label for="passwd">비밀번호</label>
      		<input id="passwd" name="passwd" type="password"  size="20" placeholder="6~16자 숫자/문자" maxlength="16"/>
      	</li>
        <li>
         	<label for="repass">비밀번호 재입력</label>
          	<input id="repass" name="repass" type="password" size="20" placeholder="비밀번호재입력" maxlength="16"/>
        </li>
      	<li>
      		<label for="name">이름</label>
          	<input id="name" name="name" type="text" size="20" value=<%= member.getName()%> maxlength="10"/>
       	</li>
      	<li>
      		<label for="address">주소</label>
          	<input id="address" name="address" type="text" size="30" value="<%= member.getAddress()%>" maxlength="50"/>
      	</li>
      
      	<li>
      		<label for="tel">전화번호</label>
          	<input id="tel" name="tel" type="tel" size="20" value="<%=member.getTel()%>" maxlength="20">
      	</li>
      	<li>
      		<label for="allergy">알러지</label>
          	<input id="allergy" name="allergy" type="checkbox" value="고기">고기
          	<input id="allergy" name="allergy" type="checkbox" value="야채">야채
          	<input id="allergy" name="allergy" type="checkbox" value="과일">과일
      	</li>
      	<li class="label2">
      		<input type="submit" value="수정하기" /> 
      		<input type="button" value="취소" onclick="javascript:window.location='../myPage.jsp'"/>
      	</li>	
   </ul>
</form>
</div>   
</body>
</html>