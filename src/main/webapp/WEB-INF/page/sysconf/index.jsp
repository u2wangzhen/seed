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
	/* $(function(){
			
	}); */
	function ok() {
		$('#sysconfForm').form('submit', {

			success : function(data) {
				var data = eval('(' + data + ')'); // change the JSON string to javascript object
				if (data.success) {
					alert(data.message);
					$("#sysconfDatagrid").datagrid('reload');
					$('#sysconfForm').form('clear');
				}
			},
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if (!isValid) {
					$.messager.progress('close'); // hide progress bar while the form is invalid
				}
				return isValid; // return false will stop the form submission
			}

		});
	}
</script>
</head>
<body>
	<form action="/seed/sysconf/add" method="post" id="sysconfForm">
		<table>
			<tr>
				<th>fkey:</th><td><input type="text" name="fkey" class="easyui-textbox" data-options="required:true"></td>
				</tr><tr>
				<th>skey:</th><td><input type="text" name="skey" class="easyui-textbox" data-options="required:true"></td>
				</tr><tr>
				<th>vlength:</th><td><input type="text" name="vlength" class="easyui-textbox" data-options="required:true"></td>
			</tr>
			<tr>
			<th colspan="2"><button type="button" onclick="ok();">添加</button></th>
			</tr>
		</table>
		
	</form>

	<table id="sysconfDatagrid" class="easyui-datagrid"
		title="列表" style="width: 100%; height: 100%"
		data-options="singleSelect:true,collapsible:true,url:'/seed/sysconf/getAll',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80">ID</th>
				<th data-options="field:'key',width:80">key</th>
				<th data-options="field:'fkey',width:100">fkey</th>
				<th data-options="field:'skey',width:100,align:'right'">skey</th>
				<th data-options="field:'vlength',width:80,align:'right'">length</th>

			</tr>
		</thead>
	</table>
</body>
</html>
