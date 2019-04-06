<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>sys</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
</head>
<body>


	<table id="" class="easyui-datagrid"
		title="所有数据列表" style="width: 100%; height: 100%"
		data-options="remoteSort:false,collapsible:true,url:'/seed/main/getAllFruit',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,sortable:true">ID</th>
				<th data-options="field:'key',width:80">key</th>
				<th data-options="field:'jsonStr'">data</th>
				

			</tr>
		</thead>
	</table>
</body>
</html>
