<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>demo4</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({
		url:'/seed/demo4/page',
	    pagination:true,
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    remoteSort:false
	});
	$('#dd').dialog({
	    title: 'demo4 add',
	    width: $(document).width()-50,
	    height: $(document).height()-100,
	    closed: true,
	    maximizable:true,
	    maximizabd:true,
	    cache: false,
	    modal: true,
	    onClose:function(){
	    	$('#dg').datagrid('reload'); 
	    }
	});
});
function openAdd(){
	$("#demo4_add_iframe").attr("src","/seed/demo4/toAdd");
	$('#dd').dialog('open');
}
function openEdit(id){
	$("#demo4_add_iframe").attr("src","/seed/demo4/toEdit?id="+id);
	$('#dd').dialog({title:'demo4 edit'});
	$('#dd').dialog('open');
}
function buildButton(value,row,index){
	var str='<a href="javascript:void(0);" onclick="openEdit(\''+row.id+'\');">编辑</a>';
	str+='&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''+row.id+'\');">删除</a>'
	return str;
}
function deleteOne(id){
	$.post('/seed/demo4/delete',{'id':id},function(data){
		$.messager.alert("操作提示", data.message);
		if (data.success) {
			$('#dg').datagrid('reload'); 
		}
	});
}
function searchPage(){
	var name=$("#name").val();
	var age=$("#age").val();



	$('#dg').datagrid('load', {
		 name:name
		 ,age:age
	});

}
</script>
</head>
<body>
<input type="text" id="name"  placeholder="name" >
<input type="text" id="age"  placeholder="age" >
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<div id="tb">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openAdd();"></a>
</div>
<table id="dg" class="easyui-datagrid" style="width:100%;height:auto">
    <thead>
		<tr>
			<th data-options="field:'id',width:50,sortable:true" >ID</th>
					<th data-options="field:'name',width:100,sortable:true">name</th>
					<th data-options="field:'age',width:100,sortable:true">age</th>
			<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
		</tr>
    </thead>
</table>
<div id="dd">
<iframe id="demo4_add_iframe" src="" width="100%" height="100%"></iframe>
</div>
</body>
</html>