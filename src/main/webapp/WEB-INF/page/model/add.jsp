<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>model add</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">

$(function(){
		$('#name').validatebox({
		    required: false,
		    validType: 'length[0,32]',
		    invalidMessage:'不超过32个字'
		});
		$('#path').validatebox({
		    required: false,
		    validType: 'length[0,64]',
		    invalidMessage:'不超过64个字'
		});
		$('#selectWindow').panel('resize',{
			width: $(document).width()*0.7
		});
		$('body').layout('resize');
});
function ok() {
	$.messager.progress();
	$('#model_form').form('submit', {
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
				$('#model_form').form('clear');
			}
			$.messager.progress('close');
		}

	});
}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
<form id="model_form" action="/seed/model/add" method="post">
<input type="hidden" name="menu_fid" value="${menu_fid}">
<table>
<tr>
<th>name:</th>
<td><input type="text" id="name" name="name" value="" maxlength="32" ></td>
</tr>
<tr>
<th>path:</th>
<td><input type="text" id="path" name="path" value="" maxlength="64" ></td>
</tr>
<tr>
<th colspan="2">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
</th>
</tr>
</table>
</form>
</div>
</body>
</html>