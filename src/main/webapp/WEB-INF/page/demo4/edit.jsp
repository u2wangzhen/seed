<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>demo4 edit</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
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
			openSub('demo1');
});

function ok() {
	$.messager.progress();
	$('#demo4_form').form('submit', {
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
				$('#demo4_form').form('clear');
			}
			$.messager.progress('close');
		}
	});
}
	function openSub(key) {
		var id = $("#id").val();
		$('#selectWindow').html(
				'<iframe id="select_iframe" src="/seed/'+key+'?demo4_fid=' + id
						+ '" width="100%" height="100%"></iframe>');
		$('#selectWindow').panel('setTitle','edit '+key);
	}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
<form id="demo4_form" action="/seed/demo4/update" method="post">
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
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openSub('demo1');">open demo1</a>
	</th>
</tr>
<tr>
<th colspan="2">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
</th>
</tr>
</table>
</div>
<div id="selectWindow" data-options="region:'east',split:true,title:' '" style="width: 600px; padding: 10px;"></div>
</form>
</body>
</html>