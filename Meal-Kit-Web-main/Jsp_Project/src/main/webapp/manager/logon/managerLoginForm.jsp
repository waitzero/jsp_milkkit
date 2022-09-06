<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>로그인</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="login.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Application<br> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
    <div class="main">
     <div class="col-md-6 col-sm-12">
     	<div class="login-form">
   		 <form method="post" action="managerLoginPro.jsp">
        Id: <input  class="form-control" type="text" name="id" maxlength="50" style="ime-mode:inactive;"><br>
        Password: <input class="form-control" type="password" name="passwd" maxlength="16" style="ime-mode:inactive;"><br>
        <input class="btn btn-black" type="submit" value="로그인">
        <a class="btn btn-secondary" href="../../shopping/shopMain.jsp">메인페이지로</a>
    </form>
    </div>
    </div>
    </div>
</body>
</html>