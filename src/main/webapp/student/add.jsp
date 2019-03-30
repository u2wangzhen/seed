<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>student add</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
function ok() {
	$('#student_form').form('submit', {

		success : function(data) {
			var data = eval('(' + data + ')'); // change the JSON string to javascript object
			if (data.success) {
				alert(data.message);
				$('#student_form').form('clear');
			}
		}

	});
}
</script>
</head>
<body>
<form id="student_form" action="/seed/student/add" method="post">
<table>
<tr>
<th>code:</th>
<td><input type="text" name="code"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>school:</th>
<td><input type="text" name="school"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>sex:</th>
<td><input type="text" name="sex"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>name:</th>
<td><input type="text" name="name"  class="easyui-textbox" value=""></td>
</tr>


<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
</body>
</html>