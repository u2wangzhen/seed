<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>demo2 edit</title>
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
					$.messager.progress('close');
				}
				return isValid;
			},
		success : function(data) {
			var data = eval('(' + data + ')');
			if (data.success) {
				$.messager.alert("操作提示", data.message);
				$('#demo2_form').form('clear');
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
<form id="demo2_form" action="/seed/demo2/update" method="post">
<input type="hidden" id="id" name="id" value="${id}">
	<c:forEach items="${demo1}" var="obj">
		<input type="hidden" name="demo1_fid" value="${obj.id}" />
	</c:forEach>
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
					<th>teacher:</th>
					<td><div id="teacher" class="selectOther">
							<c:forEach items="${teacher}" var="obj">
								<div>
									<input type="hidden" name="teacher_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('teacher');"></a></td>
				</tr>
<tr>
					<th>student:</th>
					<td><div id="student" class="selectOther">
							<c:forEach items="${student}" var="obj">
								<div>
									<input type="hidden" name="student_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('student');"></a></td>
				</tr>
<tr>
					<th>demo5:</th>
					<td><div id="demo5" class="selectOther">
							<c:forEach items="${demo5}" var="obj">
								<div>
									<input type="hidden" name="demo5_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('demo5');"></a></td>
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