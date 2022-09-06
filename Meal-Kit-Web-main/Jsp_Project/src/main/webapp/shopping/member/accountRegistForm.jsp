<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/color.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meal-Kit Shopping mall</title>
<link href="form.css" rel="stylesheet" type="text/css">
</head>
<body>
<p class="head-line">계좌 넣기</p><br>
<div class="form-card">
					<div class="row justify-content-between text-left">
<form method="post" name="writeform" action="accountRegistPro.jsp">
<div class="container-fluid px-1 py-5 mx-auto">
   			 				<div class="row d-flex justify-content-center">
      					    <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
      				 	    <div class="card">
	<ul>
		<li>
			<label for="account">계좌번호</label>
			<input id="account" name="account" size="20" placeholder="000-000-0000"/>
		</li>
		<li>
			<label for="bank">은행</label>
			<select name="bank">
				<option value="국민">국민은행</option>
				<option value="농협">농협은행</option>
				<option value="신한">신한은행</option>
			</select>
		</li>
		<li>
			<label for="name">계좌이름</label>
			<input id="name" name="name" size="20" placeholder="00의 통장"/>
		</li>
		<li class="label2">
			<input type="submit" value="등록하기" />
			<input type="button" value="취소" onclick="javascript:window.location='../myPage.jsp'"/>
		</li>

	</ul>
	</div>
						</div>
						</div>
						</div>   
</form>
</div>
</body>
</html>