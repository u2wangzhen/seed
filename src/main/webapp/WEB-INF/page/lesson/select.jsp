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
<script type="text/javascript">
	$(function() {
		var student_fid = $("#student_fid").val();
		$('#dg').datagrid({
			url : '/seed/lesson/getAll?student_fid='+student_fid,
			loadMsg : '请稍后...',
			idField : 'id',
			remoteSort : false,
			singleSelect : ${empty singleSelect?'false':singleSelect},
			onLoadSuccess : function() {
				var s = $("[name='lesson_fid']", window.parent.document);
				if (s != null && s.length > 0) {
					for (var i = 0; i < s.length; i++) {
						$('#dg').datagrid("selectRecord", s[i].value);
					}

				}
			},
			onSelect : function() {
				getSelections();
			},
			onUnselect : function() {
				getSelections();
			}
		});

	});

	function getSelections() {
		var s = $('#dg').datagrid("getSelections");
		if (s != null && s.length > 0) {
			parent.insert("lesson", s);
		} else {
			parent.clear("lesson");
		}
	}
	function searchPage() {
		var subject = $("#subject").val();
		var grade = $("#grade").val();
		var name = $("#name").val();
		var student_fid = $("#student_fid").val();
		$('#dg').datagrid('load', {
			subject : subject,
			grade : grade,
			name : name,
			student_fid:student_fid
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
	<input type="hidden" id="student_fid" value="${student_fid }">
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
	<a href="javascript:void(0);" class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true"
		onclick="searchPage();"></a>
	<table id="dg" class="easyui-datagrid"
		style="width: 100%; height: auto">
		<thead>
			<tr>
				<th data-options="field:'id',width:50,sortable:true">ID</th>
				<th data-options="field:'name',width:150,sortable:true">名称</th>
				<th data-options="field:'subject',width:50,sortable:true">科目</th>
				<th data-options="field:'grade',width:50,sortable:true">年级</th>
				<th data-options="field:'teacher_s',width:100,sortable:true,formatter:viewFruit">老师</th>
				<th data-options="field:'student_s',width:150,sortable:true,formatter:viewFruit">学生</th>
				<th data-options="field:'createTime',width:100,sortable:true">创建时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>