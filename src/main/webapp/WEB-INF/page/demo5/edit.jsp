<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>demo5 edit</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
		$('#name').validatebox({
		    required: false,
		    validType: 'length[0,16]',
		    invalidMessage:'不超过16个字'
		});
		$('#age').validatebox({
		    required: false,
		    validType: 'length[0,4]',
		    invalidMessage:'不超过4个字'
		});
});

function ok() {
	$.messager.progress();
	$('#demo5_form').form('submit', {
		onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');
				}
				return isValid;
			},
		success : function(data) {
			var data = eval('(' + data + ')');
			if (data.success) {
				$.messager.alert("操作提示", data.message);
				$('#demo5_form').form('clear');
			}
			$.messager.progress('close');
		}
	});
}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
<form id="demo5_form" action="/seed/demo5/update" method="post">
<input type="hidden" id="id" name="id" value="${id}">
<table>
<tr>
<th>name:</th>
<td><input type="text" id="name" name="name" value="${name}" maxlength="16"></td>
</tr>
<tr>
<th>age:</th>
<td><input type="text" id="age" name="age" value="${age}" maxlength="4"></td>
</tr>

<tr>
<th colspan="2">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
</th>
</tr>
</table>
</div>
</form>
</body>
</html>