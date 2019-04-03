<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>maker</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/maker/page',
	    pagination:true,
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    remoteSort:false
	});
	$('#dd').dialog({
	    title: 'maker add',
	    width: 600,
	    height: 400,
	    closed: true,
	    cache: false,
	    modal: true,
	    onClose:function(){
	    	$('#dg').datagrid('reload'); 
	    }
	});
});
function openAdd(){
	$("#maker_add_iframe").attr("src","/seed/maker/toAdd");
	$('#dd').dialog('open');
}
function openEdit(id){
	$("#maker_add_iframe").attr("src","/seed/maker/toEdit?id="+id);
	$('#dd').dialog({title:'maker edit'});
	$('#dd').dialog('open');
}
function buildButton(value,row,index){
	var str='<a href="javascript:void(0);" onclick="openEdit(\''+row.id+'\');">编辑</a>';
	str+='&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''+row.id+'\');">删除</a>'
	str+='&nbsp;&nbsp;<a href="javascript:void(0);" onclick="makerPages(\''+row.id+'\');">生成代码</a>'
	return str;
}
function deleteOne(id){
	$.post('/seed/maker/delete',{'id':id},function(data){
		/* alert(data);
		var data = eval('(' + data + ')');
		alert(data); */
		if (data.success) {
			alert(data.message);
			$('#dg').datagrid('reload'); 
		}
	});
}
function makerPages(id){
	$.post('/seed/maker/makerPages',{'id':id},function(data){
		/* alert(data);
		var data = eval('(' + data + ')');
		alert(data); */
		if (data.success) {
			alert(data.message);
			$('#dg').datagrid('reload'); 
		}
	});
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
			<th data-options="field:'key',width:100,sortable:true">自己</th>
			<th data-options="field:'fkey',width:100,sortable:true">目标</th>
			<th data-options="field:'sss',width:100,align:'right',sortable:true">检索</th>
			<th data-options="field:'status',width:100,align:'right',sortable:true">状态</th>
			<th data-options="field:'c',width:200,align:'center',formatter:buildButton">操作</th>
		</tr>
    </thead>
</table>
<div id="dd">
<iframe id="maker_add_iframe" src="/seed/maker/toAdd" width="100%" height="100%"></iframe>
</div>
</body>
</html>