<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>user</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/user/page',
	    pagination:true,
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    remoteSort:false
	});
	$('#dd').dialog({
	    title: 'user add',
	    width: 400,
	    height: 200,
	    closed: true,
	    cache: false,
	    modal: true,
	    onClose:function(){
	    	$('#dg').datagrid('reload'); 
	    }
	});
});
function openAdd(){
	$("#user_add_iframe").attr("src","/seed/user/toAdd");
	$('#dd').dialog('open');
}
function openEdit(id){
	$("#user_add_iframe").attr("src","/seed/user/toEdit?id="+id);
	$('#dd').dialog({title:'user edit'});
	$('#dd').dialog('open');
}
function buildButton(value,row,index){
	var str='<a href="javascript:void(0);" onclick="openEdit(\''+row.id+'\');">edit</a>';
	return str;
}
function searchPage(){
	var name=$("#name").val();
	var age=$("#age").val();
	$('#dg').datagrid('load', {
	    name_l: name,age:age
	});
}
</script>
</head>
<body>
<input type="text" class="easyui-textbox" id="name" ><input type="text" class="easyui-textbox" id="age" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<div id="tb">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openAdd();"></a>
</div>
<table id="dg" class="easyui-datagrid" style="width:100%;height:500px">
    <thead>
		<tr>
			<th data-options="field:'id',width:100,sortable:true" >ID</th>
			<th data-options="field:'name',width:100,sortable:true">姓名</th>
			<th data-options="field:'age',width:100,sortable:true">年龄</th>
			<th data-options="field:'password',width:100,align:'right',sortable:true">密码</th>
			<th data-options="field:'c',width:200,align:'center',formatter:buildButton">操作</th>
		</tr>
    </thead>
</table>
<div id="dd">
<iframe id="user_add_iframe" src="/seed/user/toAdd" width="100%" height="100%"></iframe>
</div>
</body>
</html>