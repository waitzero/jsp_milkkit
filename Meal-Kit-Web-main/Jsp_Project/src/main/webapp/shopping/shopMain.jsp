<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<html>
	<head>
		<link href="styles.css" rel="stylesheet" type="text/css">
		<meta charset="UTF-8">
		<title>Meal-Kit Shopping Mall</title>
		<style>
    a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
</style>
	</head>
	<body>
		   <div class="top"><jsp:include page="../common/top.jsp" flush="false" /></div>   
		
		 	<div class="left"><jsp:include page="../common/left.jsp" flush="false" /></div>
		 
		<div class="object">
	    
		    	<%
		    		String key = request.getParameter("key");
		    		if(key==null){
		    	%>
		    			<jsp:include page="./introList.jsp" flush="false"/>
		    	<%	}else{%>
		    	 		<jsp:include page="./member/registerForm.jsp" flush="false"/>
		       	<%	} %> 
		
		</div>
	</body>
</html>