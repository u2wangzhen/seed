<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>user</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/user/getPageList',
	    pagination:true,
	    loadMsg:'请稍后...'
	});
});
</script>
</head>
<body>
<form action="/seed/user/add" method="post">
	name:<input type="text" name="name" value="">
	age:<input type="text" name="age" value="">
	password:<input type="text" name="password" value="">
	<button type="submit">submit</button>
</form>

<table id="dg" class="easyui-datagrid" style="width:100%;height:500px">
    <thead>
		<tr>
			<th data-options="field:'id',width:100">ID</th>
			<th data-options="field:'name',width:100">姓名</th>
			<th data-options="field:'age',width:100">年龄</th>
			<th data-options="field:'password',width:100,align:'right'">密码</th>
		</tr>
    </thead>
</table>
</body>
</html>