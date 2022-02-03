<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
</head>
<body>
	<h3>READ</h3>

	<form method="get" action="/board/get">
		<button type="submit" name="modify">Modify</button>
		<button type="submit" name="remove">REMOVE</button>
	</form>

	<a href="/board/get?list">LIST</a>
</body>
</html>