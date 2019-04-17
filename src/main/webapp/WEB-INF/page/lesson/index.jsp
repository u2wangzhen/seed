<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>lesson</title>
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
			elem : '#starttime'
		});
		laydate.render({
			elem : '#endtime'
		});
		$('#dg').datagrid({
			url : '/seed/lesson/page',
			pagination : true,
			loadMsg : '请稍后...',
			toolbar : '#tb',
			remoteSort : false
		});
		$('#dd').dialog({
			title : '课程新增',
			width : $(document).width() - 50,
			height : $(document).height() - 100,
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
		$("#lesson_add_iframe").attr("src", "/seed/lesson/toAdd");
		$('#dd').dialog('open');
	}
	function openEdit(id) {
		$("#lesson_add_iframe").attr("src", "/seed/lesson/toEdit?id=" + id);
		$('#dd').dialog({
			title : '课程编辑'
		});
		$('#dd').dialog('open');
	}
	function buildButton(value, row, index) {
		var str = '<a href="javascript:void(0);" onclick="openEdit(\'' + row.id
				+ '\');">编辑</a>';
		str += '&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''
				+ row.id + '\');">删除</a>'
		return str;
	}
	function deleteOne(id) {
		$.post('/seed/lesson/delete', {
			'id' : id
		}, function(data) {
			$.messager.alert("操作提示", data.message);
			if (data.success) {
				$('#dg').datagrid('reload');
			}
		});
	}
	function searchPage() {
		var subject = $("#subject").val();
		var grade = $("#grade").val();
		var name = $("#name").val();
		if(name!=''){
			name="LIKE,"+name;
		}
		var student=$("#student").val();
		if(student!=''){
			student="LIKE,"+student;
		}
		var teacher=$("#teacher").val();
		if(teacher!=''){
			teacher="LIKE,"+teacher;
		}
		var createTime = $("#createTime").val();
		var sta=$("#starttime").val();
		var end=$("#endtime").val();
		if(sta!=''||end!=''){
			if(sta!=''){
				sta='GTEQ,'+sta+",date_c";
			}
			if(end!=''){
				end='LTEQ,'+end+",date_c";
			}
		}else{
			if(createTime!=''){
				createTime="LIKE,"+createTime;
			}
		}
		$('#dg').datagrid('load', {
			subject : subject,
			grade : grade,
			name: name,
			'teacher_o@name_s':teacher,
			'student_o@name_s':student,
			createTime:createTime,
			createTime_1_index:sta,
			createTime_2_index:end
		});

	}
	function viewFruit(value, row, index) {
		var str = "";
		if (value != null && value.length > 0) {
			for (var i = 0; i < value.length; i++) {
				if (i != 0) {
					str += ",";
				}
				str += value[i].name;
			}
		}
		return str;
	}
</script>
</head>
<body>
	<input type="text" id="name" placeholder="名称"> 科目：
	<select id="subject">
		<option value="">----</option>
		<option value="数学">数学</option>
		<option value="物理">物理</option>
		<option value="化学">化学</option>
		<option value="英语">英语</option>
		<option value="语文">语文</option>
		<option value="地理">地理</option>
		<option value="生物">生物</option>
		<option value="历史">历史</option>
		<option value="政治">政治</option>
	</select> 年级:
	<select id="grade" name="grade">
		<option value="">----</option>
		<option value="高三">高三</option>
		<option value="高二">高二</option>
		<option value="高一">高一</option>
		<option value="初三">初三</option>
		<option value="初二">初二</option>
		<option value="初一">初一</option>
	</select>
	<input type="text" id="student" placeholder="学生姓名">
	<input type="text" id="teacher" placeholder="老师姓名">
	<input type="text" id="createTime" placeholder="日期">
	<input type="text" id="starttime" placeholder="开始日期">
	<input type="text" id="endtime" placeholder="结束日期">
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
				<th data-options="field:'name',width:150,sortable:true">名称</th>
				<th data-options="field:'subject',width:50,sortable:true">科目</th>
				<th data-options="field:'grade',width:50,sortable:true">年级</th>
				<th
					data-options="field:'teacher_s',width:100,sortable:true,formatter:viewFruit">老师</th>
				<th
					data-options="field:'student_s',formatter:viewFruit">学生</th>
				<th data-options="field:'createTime',width:100,sortable:true">创建时间</th>
				<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
			</tr>
		</thead>
	</table>
	<div id="dd">
		<iframe id="lesson_add_iframe" src="" width="100%" height="100%"></iframe>
	</div>
</body>
</html>