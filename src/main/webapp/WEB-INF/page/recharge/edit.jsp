<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>recharge edit</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function() {
		laydate.render({
			elem : '#date', //指定元素
			value : new Date()
		});
		$('#times').validatebox({
			required : true,
			validType : 'length[0,4]',
			invalidMessage : '不超过4个字'
		});
		$('#remark').validatebox({
			required : false,
			validType : 'length[0,255]',
			invalidMessage : '不超过255个字'
		});
		$('#selectWindow').panel('resize', {
			width : $(document).width() * 0.7
		});
		$('body').layout('resize');

	});

	function ok() {
		$.messager.progress();
		$('#recharge_form').form('submit', {
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
					$('#recharge_form').form('clear');
				}
				$.messager.progress('close');
			}
		});
	}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<form id="recharge_form" action="/seed/recharge/update" method="post">
			<input type="hidden" id="id" name="id" value="${id}">
			<c:forEach items="${classaccount}" var="obj">
				<input type="hidden" name="classaccount_fid" value="${obj.id}" />
			</c:forEach>
			<table>
				<tr>
					<th>充值:</th>
					<td><input type="text" id="times" name="times"
						value="${times}" maxlength="4" size="4">(h)</td>
				</tr>
				<tr>
					<th>日期:</th>
					<td><input type="text" id="date" name="date" value="${date}"
						maxlength="16" size="16"></td>
				</tr>
				<tr>
					<th>备注:</th>
					<td><textarea rows="3" cols="25" id="remark" name="remark">${remark}</textarea></td>
				</tr>

				<tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="ok();">保存</a>
					</th>
				</tr>
			</table>
	</div>
	</form>
</body>
</html>