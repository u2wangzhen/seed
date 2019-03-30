<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>maker add</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#fkey").combobox({
		url:'/seed/sysconf/getfkeys',
		method: 'get',
		valueField: 'fkey',
		textField: 'fkey',
		onSelect:function(rec){
			url='/seed/sysconf/getAll?fkey='+rec.fkey
			$("#sss").combobox("reload",url);
		}
	});
	
	$("#sss").combobox({
		url:'',
		method: 'get',
		valueField: 'skey',
		textField: 'skey',
		multiple: true
	});
	
});
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

<form id="maker_form" action="/seed/maker/add" method="post">
	<table>
<tr>
<th>fkey:</th>
<td><input type="text" id="fkey" name="fkey"  class="easyui-textbox" value=""></td>
</tr>
<tr>
<th>sss:</th>
<td><input id="sss" type="text" name="sss"  class="easyui-textbox" value=""></td>
</tr>
<tr>
<th>status:</th>
<td><input type="text"  class="easyui-textbox" name="status" value=""></td>
</tr>
<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
</body>
</html>