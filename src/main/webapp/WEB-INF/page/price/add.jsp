<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>price add</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
function ok() {
	$('#price_form').form('submit', {

		success : function(data) {
			var data = eval('(' + data + ')'); // change the JSON string to javascript object
			if (data.success) {
				alert(data.message);
				$('#price_form').form('clear');
			}
		}

	});
}
</script>
</head>
<body>
<form id="price_form" action="/seed/price/add" method="post">
<input type="hidden" name="lesson_fid" value="${lesson_fid}">
<table>
<tr>
<th>price:</th>
<td><input type="text" name="price"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>remark:</th>
<td><input type="text" name="remark"  class="easyui-textbox" value=""></td>
</tr>


<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
</body>
</html>