<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>teacher</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '/seed/teacher/page',
			pagination : true,
			loadMsg : '请稍后...',
			toolbar : '#tb',
			remoteSort : false
		});
		$('#dd').dialog({
			title : '添加老师信息',
			width : $(document).width() / 2,
			height : $(document).height() / 2,
			closed : true,
			maximizable : true,
			maximizabd : true,
			cache : false,
			modal : true,
			onClose : function() {
				$('#dg').datagrid('reload');
			}
		});
	});
	function openAdd() {
		$("#teacher_add_iframe").attr("src", "/seed/teacher/toAdd");
		$('#dd').dialog('open');
	}
	function openEdit(id) {
		$("#teacher_add_iframe").attr("src", "/seed/teacher/toEdit?id=" + id);
		$('#dd').dialog({
			title : '编辑老师信息'
		});
		$('#dd').dialog('open');
	}
	function closeDialog(){
		$('#dd').dialog('close');
	}
	function buildButton(value, row, index) {
		var str = '<a href="javascript:void(0);" onclick="openEdit(\'' + row.id
				+ '\');">编辑</a>';
		str += '&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''
				+ row.id + '\');">删除</a>'
		return str;
	}
	function deleteOne(id) {
		$.messager.confirm("提醒", "确定删除?", function(r) {
			if (r) {
				$.post('/seed/teacher/delete', {
					'id' : id
				}, function(data) {
					$.messager.alert("操作提示", data.message);
					if (data.success) {
						$('#dg').datagrid('reload');
					}
				});
			}
		});

	}
	function searchPage() {
		var subject = $("#subject").val();
		var sex = $("#sex").val();
		var name = $("#name").val();

		$('#dg').datagrid('load', {
			subject : subject,
			sex : sex,
			name_l : name
		});

	}
</script>
</head>
<body>
	<input type="text" id="name" placeholder="姓名"> 性别：
	<select id="sex">
		<option value="">--</option>
		<option value="男">男</option>
		<option value="女">女</option>
	</select> 科目：
	<select id="subject">
		<option value="">--</option>
		<option value="数学">数学</option>
		<option value="物理">物理</option>
		<option value="化学">化学</option>
		<option value="英语">英语</option>
		<option value="语文">语文</option>
		<option value="地理">地理</option>
		<option value="生物">生物</option>
		<option value="历史">历史</option>
		<option value="政治">政治</option>
	</select>
	<a href="javascript:void(0);" class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true"
		onclick="searchPage();"></a>
	<div id="tb">
		<a href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="openAdd();"></a>
	</div>
	<table id="dg" class="easyui-datagrid"
		style="width: 100%; height: auto">
		<thead>
			<tr>
				<th data-options="field:'id',width:50,sortable:true">ID</th>
				<th data-options="field:'name',width:100,sortable:true">姓名</th>
				<th data-options="field:'sex',width:50,sortable:true">性别</th>
				<th data-options="field:'subject',width:50,sortable:true">科目</th>
				<th data-options="field:'birthday',width:100,sortable:true">生日</th>
				<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
				<th data-options="field:'remark'">备注</th>
			</tr>
		</thead>
	</table>
	<div id="dd">
		<iframe id="teacher_add_iframe" src="" width="100%" height="100%"></iframe>
	</div>
</body>
</html>