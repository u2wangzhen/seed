<html>
<head>
	<meta charset="UTF-8">
	<title>Basic DataGrid - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="../js/ui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../js/ui/themes/icon.css">
	<script type="text/javascript" src="../js/ui/jquery.min.js"></script>
	<script type="text/javascript" src="../js/ui/jquery.easyui.min.js"></script>
</head>
<body>
<h2>Basic DataGrid</h2>
	<p>The DataGrid is created from markup, no JavaScript code needed.</p>
	<div style="margin:20px 0;"></div>
	
	<table class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
			data-options="singleSelect:true,collapsible:true,url:'/seed/sysconf/getAll',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80">ID</th>
				<th data-options="field:'fkey',width:100">fkey</th>
				<th data-options="field:'skey',width:80,align:'right'">skey</th>
				<th data-options="field:'vlength',width:80,align:'right'">length</th>
				
			</tr>
		</thead>
	</table>
</body>
</html>
