<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>period</title>
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
			url : '/seed/period/page',
			pagination : true,
			loadMsg : '请稍后...',
			toolbar : '#tb',
			remoteSort : false
		});
		$('#dd').dialog({
			title : '添加课时',
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
		$("#period_add_iframe").attr("src", "/seed/period/toAdd");
		$('#dd').dialog('open');
	}
	function openEdit(id) {
		$("#period_add_iframe").attr("src", "/seed/period/toEdit?id=" + id);
		$('#dd').dialog({
			title : '编辑课时'
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
				$.post('/seed/period/delete', {
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
		var pdate = $("#pdate").val();
		var sta = $("#starttime").val();
		var end = $("#endtime").val();
		if (sta != '' || end != '') {
			if (sta != '') {
				sta = 'GTEQ,' + sta + ",date_c";
			}
			if (end != '') {
				end = 'LTEQ,' + end + ",date_c";
			}
		} else {
			if (pdate != '') {
				pdate = "LIKE," + pdate;
			}
		}
		var student = $("#student").val();
		if (student != '') {
			student = "LIKE," + student;
		}
		var teacher = $("#teacher").val();
		if (teacher != '') {
			teacher = "LIKE," + teacher;
		}
		$('#dg').datagrid('load', {
			pdate : pdate,
			'student_o@name_s' : student,
			'lesson_o@teacher_o@name_s' : teacher,
			pdate_1_index : sta,
			pdate_2_index : end,
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
	<input type="text" id="student" placeholder="学生姓名">
	<input type="text" id="teacher" placeholder="老师姓名">
	<input type="text" id="pdate" placeholder="日期">
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
				<th
					data-options="field:'lesson_s',sortable:true,formatter:viewFruit">课程</th>
				<th data-options="field:'student_s',formatter:viewFruit">上课学生</th>
				<th data-options="field:'pdate',width:100,sortable:true">日期</th>
				<th data-options="field:'phour',width:50,sortable:true">课时</th>
				<th data-options="field:'startTime',width:100,sortable:true">开始时间</th>
				<th data-options="field:'endTime',width:100,sortable:true">结束时间</th>
				<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
				<th data-options="field:'remark'">备注</th>
			</tr>
		</thead>
	</table>
	<div id="dd">
		<iframe id="period_add_iframe" src="" width="100%" height="100%"></iframe>
	</div>
</body>
</html>