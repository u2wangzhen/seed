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
		var lesson_fid=$("#lesson_fid").val();
		$('#dg').datagrid({
			url : '/seed/student/getAll?lesson_cited='+lesson_fid,
			loadMsg : '请稍后...',
			idField : 'id',
			remoteSort : false,
			singleSelect : ${empty singleSelect?'false':singleSelect},
			onLoadSuccess : function() {
				var s = $("[name='student_fid']", window.parent.document);
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
			parent.insert("student", s);
		} else {
			parent.clear("student");
		}
	}
	function searchPage() {
		var sex = $("#sex").val();
		var name = $("#name").val();
		var lesson_fid=$("#lesson_fid").val();
		$('#dg').datagrid('load', {
			sex : sex,
			name_l : name,
			lesson_cited:lesson_fid
		});
	}
</script>
</head>
<body>
	<input type="hidden" id="lesson_fid" value="${lesson_fid }">
	<input type="text" id="name" placeholder="姓名"> 性别：
	<select id="sex">
		<option value="">--</option>
		<option value="男">男</option>
		<option value="女">女</option>
	</select>
	<a href="javascript:void(0);" class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true"
		onclick="searchPage();"></a>
	<table id="dg" class="easyui-datagrid"
		style="width: 100%; height: auto">
		<thead>
			<tr>
				<th data-options="field:'id',width:50,sortable:true">ID</th>
				<th data-options="field:'name',width:100,sortable:true">姓名</th>
				<th data-options="field:'sex',width:50,sortable:true">性别</th>
				<th data-options="field:'school',width:150,sortable:true">学校</th>
				<th data-options="field:'birthday',width:100,sortable:true">生日</th>
				<th data-options="field:'createTime',width:100,sortable:true">登记日期</th>
				<th data-options="field:'remark',width:100,sortable:true">备注</th>
			</tr>
		</thead>
	</table>
</body>
</html>