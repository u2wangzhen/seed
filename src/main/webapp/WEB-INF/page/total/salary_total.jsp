<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>sys</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
</head>
<body>
<c:if test="${!empty total}">
<h1>时间：${total.month}，共${total.hour}小时，总工资：${total.salary}，总收入：${total.profit}</h1>
<c:forEach items="${total.teachers}" var="t">
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;【${t.tname}】--课时： ${t.hour}，工资：${t.salary}，收入：${t.profit}</h2>
	<c:forEach items="${t.lessons}" var="l">
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${l.lname}）--课时： ${l.hour}，工资：${l.salary}，收入：${l.profit}</h4>
		<c:forEach items="${l.periods}" var="p">
			<h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课时： ${p.hour}，工资：${p.salary}，收入：${p.profit}，日期：${p.date}，开始时间：${p.start}，结束时间：${p.end}，学生：${p.student}。</h6>
		</c:forEach>
	</c:forEach>
</c:forEach>
</c:if>
<c:if test="${empty total}">
<h1>无数据！</h1>
</c:if>
</body>
</html>
