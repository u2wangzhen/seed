<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>student</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '/seed/student/page',
			pagination : true,
			loadMsg : '请稍后...',
			toolbar : '#tb',
			remoteSort : false
		});
		$('#dd').dialog({
			title : '添加学生信息',
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
		$("#student_add_iframe").attr("src", "/seed/student/toAdd");
		$('#dd').dialog('open');
	}
	function openEdit(id) {
		$("#student_add_iframe").attr("src", "/seed/student/toEdit?id=" + id);
		$('#dd').dialog({
			title : '编辑学生信息'
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
				$.post('/seed/student/delete', {
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
		var sex = $("#sex").val();
		var name = $("#name").val();
		$('#dg').datagrid('load', {
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
				<th data-options="field:'school',width:200,sortable:true">学校</th>
				<th data-options="field:'birthday',width:100,sortable:true">生日</th>
				<th data-options="field:'createTime',width:100,sortable:true">登记日期</th>
				<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
				<th data-options="field:'remark'">备注</th>
			</tr>
		</thead>
	</table>
	<div id="dd">
		<iframe id="student_add_iframe" src="" width="100%" height="100%"></iframe>
	</div>
</body>
</html>