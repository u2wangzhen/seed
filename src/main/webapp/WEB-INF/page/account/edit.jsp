<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>account edit</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/validate_repeat.js"></script>
<script type="text/javascript">
	$(function() {
		$('#name').validatebox({
			required : true,
			validType : 'repeat[8,"account","name"]',
			invalidMessage : '不超过8个字,不能重复'
		});
		$('#account').validatebox({
			required : false,
			validType : 'length[0,16]',
			invalidMessage : '不超过16个字'
		});
		$('#password').validatebox({
			required : false,
			validType : 'length[0,128]',
			invalidMessage : '不超过128个字'
		});

		$('#selectWindow').panel('resize', {
			width : $(document).width() * 0.7
		});
		$('body').layout('resize');

	});

	function ok() {
		$.messager.progress();
		$('#account_form').form('submit', {
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if (!isValid) {
					$.messager.progress('close');
				}
				return isValid;
			},
			success : function(data) {
				var data = eval('(' + data + ')');
				if (data.success) {
					$.messager.alert("操作提示", data.message);
					$('#account_form').form('clear');
				}
				$.messager.progress('close');
			}
		});
	}
	function openSelect(key) {
		$('#selectWindow').html(
				'<iframe id="select_iframe" src="/seed/' + key
						+ '/toSelect" width="100%" height="100%"></iframe>');
		$('#selectWindow').panel('setTitle', 'select ' + key);
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
		<form id="account_form" action="/seed/account/update" method="post">
			<input type="hidden" id="id" name="id" value="${id}">
			<table>
				<tr>
					<th>名称:</th>
					<td><input type="text" id="name" name="name" value="${name}"
						maxlength="8"></td>
				</tr>
				<tr>
					<th>账号:</th>
					<td><input type="text" id="account" name="account"
						value="${account}" maxlength="16"></td>
				</tr>
				<tr>
					<th>修改密码:</th>
					<td><input type="text" id="password" name="password"
						maxlength="128"></td>
				</tr>

				<tr>
					<th>权限:</th>
					<td><div id="role" class="selectOther">
							<c:forEach items="${role}" var="obj">
								<div>
									<input type="hidden" name="role_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('role');"></a></td>
				</tr>
				<tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="ok();">保存</a>
					</th>
				</tr>
			</table>
	</div>
	<div id="selectWindow"
		data-options="region:'east',split:true,title:' '"
		style="width: 600px; padding: 10px;"></div>
	</form>
</body>
</html>