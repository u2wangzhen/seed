<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>demo2 add</title>
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
	$('#demo2_form').form('submit', {
		onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	// hide progress bar while the form is invalid
				}
				return isValid;	// return false will stop the form submission
			},
		success : function(data) {
			var data = eval('(' + data + ')'); // change the JSON string to javascript object
			if (data.success) {
				$.messager.alert("操作提示", data.message);
				$('#demo2_form').form('clear');
			}
			$.messager.progress('close');
		}

	});
}
	function openSelect(key) {
		$('#select').html('<iframe id="select_iframe" src="/seed/'+key+'/toSelect" width="100%" height="100%"></iframe>');
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
<form id="demo2_form" action="/seed/demo2/add" method="post">
<input type="hidden" name="demo1_fid" value="${demo1_fid}">
<table>
<tr>
<th>name:</th>
<td><input type="text" name="name"  class="easyui-textbox" value="" maxlength="16" ></td>
</tr>
<tr>
<th>age:</th>
<td><input type="text" name="age"  class="easyui-textbox" value="" maxlength="4" ></td>
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
<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
</div>
<div id="select" data-options="region:'east',split:true,title:'附属窗口'" style="width: 600px; padding: 10px;"></div>
</body>
</html>