<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>menu edit</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
		$('#name').validatebox({
		    required: false,
		    validType: 'length[0,32]',
		    invalidMessage:'不超过32个字'
		});
		
		$('#selectWindow').panel('resize',{
			width: $(document).width()*0.7
		});
		$('body').layout('resize');
		
			openSub('menu');
});

function ok() {
	$.messager.progress();
	$('#menu_form').form('submit', {
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
				$('#menu_form').form('clear');
			}
			$.messager.progress('close');
		}
	});
}
	function openSub(key) {
		var id = $("#id").val();
		$('#selectWindow').html(
				'<iframe id="select_iframe" src="/seed/'+key+'?menu_fid=' + id
						+ '" width="100%" height="100%"></iframe>');
		$('#selectWindow').panel('setTitle','edit '+key);
	}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
<form id="menu_form" action="/seed/menu/update" method="post">
<input type="hidden" id="id" name="id" value="${id}">
	<c:forEach items="${menu}" var="obj">
		<input type="hidden" name="menu_fid" value="${obj.id}" />
	</c:forEach>
<table>
<tr>
<th>name:</th>
<td><input type="text" id="name" name="name" value="${name}" maxlength="32"></td>
</tr>

<tr>
	<th colspan="2">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openSub('menu');">open menu</a>
	</th>
</tr>
<tr>
	<th colspan="2">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openSub('model');">open model</a>
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