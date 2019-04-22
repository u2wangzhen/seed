<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>sys</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({
		url : '/seed/main/getAllFruit',
		loadMsg : '请稍后...',
		idField : 'id',
		remoteSort : false,
		collapsible:true
	});
	
});
function deleteOne(id) {

	$.messager.confirm("提醒", "确定删除?", function(r) {
		if (r) {
			$.post('/seed/lesson/delete', {
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
function buildButton(value, row, index) {
	
	var str = '<a href="javascript:void(0);" onclick="deleteOne(\''
			+ row.id + '\');">删除</a>'
	return str;
}
function searchPage() {
	var id = $("#id").val();
	var fkey = $("#fkey").val();
	var sql = $("#sql").val();
	$('#dg').datagrid('load', {
		id : id,
		fkey : fkey,
		sql:sql
	});

}
</script>
</head>
<body>
	<input type="text" id="id" placeholder="id">
	<input type="text" id="fkey" placeholder="fkey"><br>
	<br>
	<!-- <input type="text" id="sql" placeholder="sql" size="100"> -->
	<textarea id="sql" placeholder="sql" rows="3" cols="100"></textarea>
	<a href="javascript:void(0);" class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true"
		onclick="searchPage();"></a>
	<table id="dg" class="easyui-datagrid"
		title="所有数据列表" style="width: 99%;">
		<thead>
			<tr>
				<th data-options="field:'id',width:50,sortable:true">ID</th>
				<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
				<th data-options="field:'key',sortable:true">key</th>
				<th data-options="field:'cited'">cited</th>
				<th data-options="field:'other'">other</th>
				<th data-options="field:'jsonStr'">data</th>
			</tr>
		</thead>
	</table>
</body>
</html>
