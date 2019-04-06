<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>student</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/student/page',
	    pagination:true,
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    remoteSort:false
	});
	$('#dd').dialog({
	    title: 'student add',
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
	$("#student_add_iframe").attr("src","/seed/student/toAdd");
	$('#dd').dialog('open');
}
function openEdit(id){
	$("#student_add_iframe").attr("src","/seed/student/toEdit?id="+id);
	$('#dd').dialog({title:'student edit'});
	$('#dd').dialog('open');
}
function buildButton(value,row,index){
	var str='<a href="javascript:void(0);" onclick="openEdit(\''+row.id+'\');">编辑</a>';
	str+='&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''+row.id+'\');">删除</a>'
	return str;
}
function deleteOne(id){
	$.post('/seed/student/delete',{'id':id},function(data){
		alert(data.message);
		if (data.success) {
			$('#dg').datagrid('reload'); 
		}
	});
}
function searchPage(){
	var sex=$("#sex").val();
	var name=$("#name").val();

	$('#dg').datagrid('load', {
		 sex:sex
	    
		 ,name:name
	    
	});
}
</script>
</head>
<body>
<input type="text" class="easyui-textbox" id="sex" >
<input type="text" class="easyui-textbox" id="name" >
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<div id="tb">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openAdd();"></a>
</div>
<table id="dg" class="easyui-datagrid" style="width:100%;height:500px">
    <thead>
		<tr>
			<th data-options="field:'id',width:100,sortable:true" >ID</th>
					<th data-options="field:'name',width:100,sortable:true">name</th>
					<th data-options="field:'sex',width:100,sortable:true">sex</th>
					<th data-options="field:'school',width:100,sortable:true">school</th>
					<th data-options="field:'remark',width:100,sortable:true">remark</th>
					<th data-options="field:'createTime',width:100,sortable:true">createTime</th>
			<th data-options="field:'c',width:200,align:'center',formatter:buildButton">操作</th>
		</tr>
    </thead>
</table>
<div id="dd">
<iframe id="student_add_iframe" src="/seed/student/toAdd" width="100%" height="100%"></iframe>
</div>
</body>
</html>