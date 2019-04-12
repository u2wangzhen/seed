<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>demo1 add</title>
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
});
function ok() {
	$.messager.progress();
	$('#demo1_form').form('submit', {
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
				$('#demo1_form').form('clear');
			}
			$.messager.progress('close');
		}

	});
}
	function openSelect(key) {
		$('#selectWindow').html('<iframe id="select_iframe" src="/seed/'+key+'/toSelect" width="100%" height="100%"></iframe>');
		$('#selectWindow').panel('setTitle','select '+key);
	}
	function insert(key, s) {
		var str = "";
		for (var i = 0; i < s.length; i++) {
			str += build(key, s[i]);
		}
		$("#" + key).html(str);
	}
	function clear(key) {
		$("#" + key).html("");
	}
	function build(key, obj) {
		var str = '<div><input type="hidden" name="'+key+'_fid"  value="'+obj.id+'">'
				+ obj.name + '</div>';
		return str;
	}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
<form id="demo1_form" action="/seed/demo1/add" method="post">
<input type="hidden" name="demo4_fid" value="${demo4_fid}">
<table>
<tr>
<th>name:</th>
<td><input type="text" id="name" name="name" value="" maxlength="16" ></td>
</tr>
<tr>
<th>age:</th>
<td><input type="text" id="age" name="age" value="" maxlength="4" ></td>
</tr>
<tr>
	<th>teachers:</th>
	<td>
		<div id="teacher" class="selectOther"></div>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="openSelect('teacher');"></a>
	</td>
</tr>
<tr>
	<th>students:</th>
	<td>
		<div id="student" class="selectOther"></div>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="openSelect('student');"></a>
	</td>
</tr>
<tr>
	<th>demo5s:</th>
	<td>
		<div id="demo5" class="selectOther"></div>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="openSelect('demo5');"></a>
	</td>
</tr>
<tr>
<th colspan="2">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
</th>
</tr>
</table>
</form>
</div>
<div id="selectWindow" data-options="region:'east',split:true,title:' '" style="width: 600px; padding: 10px;"></div>
</body>
</html>