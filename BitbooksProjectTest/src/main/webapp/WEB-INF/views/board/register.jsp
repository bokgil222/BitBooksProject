<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
</head>
<body>
	<h3>REGISTER</h3>
	
	<form method="post", action="/board/post">
		<button type="submit" nmae="register">Register</button>
	</form>
	
	<a href="/board/get?list">LIST</a>
</body>
</html>