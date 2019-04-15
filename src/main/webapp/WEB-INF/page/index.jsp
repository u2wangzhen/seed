<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>login</title>
</head>
<body>
<h2>Hello World!</h2>
<form id="login" action="/seed/main/toMain" method="post">
	<input type="text" name="user" autocomplete="off" >
	<input type="password" name="password" autocomplete="off">
	<button type="submit">login</button>
</form>
</body>
</html>
