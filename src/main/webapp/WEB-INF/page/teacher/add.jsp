<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>teacher add</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/validate_repeat.js"></script>
<script type="text/javascript" src="/seed/js/laydate/laydate.js"></script>

<script type="text/javascript">
	$(function() {
		laydate.render({
			elem : '#birthday' //指定元素
		});
		$('#name').validatebox({
			required : true,
			validType : 'repeat[16,"teacher","name"]',
			invalidMessage : '不超过16个字,不能重复'
		});
		$('#remark').validatebox({
			required : false,
			validType : 'length[0,255]',
			invalidMessage : '不超过255个字'
		});
		
	});
	function ok() {
		$.messager.progress();
		$('#teacher_form').form('submit', {
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
					$('#teacher_form').form('clear');
				}
				$.messager.progress('close');
			}

		});
	}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<form id="teacher_form" action="/seed/teacher/add" method="post">
			<table>
				<tr>
					<th>姓名:</th>
					<td><input type="text" id="name" name="name" value=""
						maxlength="16"></td>
				</tr>
				<tr>
					<th>性别:</th>
					<td>男<input type="radio" name="sex" value="男"> 
						女<input type="radio" name="sex" value="女">
					</td>
				</tr>
				<tr>
					<th>科目:</th>
					<td><select id="subject" name="subject">
							<option value="数学">数学</option>
							<option value="物理">物理</option>
							<option value="化学">化学</option>
							<option value="英语">英语</option>
							<option value="语文">语文</option>
							<option value="地理">地理</option>
							<option value="生物">生物</option>
							<option value="历史">历史</option>
							<option value="政治">政治</option>
					</select></td>
				</tr>
				<tr>
					<th>生日:</th>
					<td><input type="text" id="birthday" name="birthday"></td>
				</tr>
				<tr>
					<th>备注:</th>
					<td><textarea rows="3" cols="25" id="remark" name="remark"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>