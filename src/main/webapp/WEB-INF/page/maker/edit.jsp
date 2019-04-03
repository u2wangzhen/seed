<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>maker edit</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
function ok() {
	$('#maker_form').form('submit', {

		success : function(data) {
			var data = eval('(' + data + ')'); // change the JSON string to javascript object
			if (data.success) {
				alert(data.message);
				$('#maker_form').form('clear');
			}
		}

	});
}
</script>
</head>
<body>
<form id="maker_form" action="/seed/maker/update" method="post">
	<input type="hidden" name="id" value="${id}">

<table>
<tr>
<th>fkey:</th>
<td><input type="text" name="fkey"  class="easyui-textbox" value="${fkey }"></td>
</tr>
<tr>
<th>sss:</th>
<td><input type="text" name="sss"  class="easyui-textbox" value="${sss }"></td>
</tr>
<tr>
<th>status:</th>
<td><input type="text"  class="easyui-textbox" name="status" value="${status }"></td>
</tr>
<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
</body>
</html>