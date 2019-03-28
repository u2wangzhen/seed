<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>user edit</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
function ok() {
	$('#user_form').form('submit', {

		success : function(data) {
			var data = eval('(' + data + ')'); // change the JSON string to javascript object
			if (data.success) {
				alert(data.message);
				$('#user_form').form('clear');
			}
		}

	});
}
</script>
</head>
<body>
<form id="user_form" action="/seed/user/update" method="post">
	<input type="hidden" name="id" value="${id}">

<table>
<tr>
<th>name:</th>
<td><input type="text" name="name"  class="easyui-textbox" value="${name }"></td>
</tr>
<tr>
<th>age:</th>
<td><input type="text" name="age"  class="easyui-textbox" value="${age }"></td>
</tr>
<tr>
<th>password:</th>
<td><input type="password"  class="easyui-textbox" name="password" value="${password }"></td>
</tr>
<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
</body>
</html>