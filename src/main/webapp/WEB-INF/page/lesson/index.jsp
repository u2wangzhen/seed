<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>lesson</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/lesson/page',
	    pagination:true,
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    remoteSort:false
	});
	$('#dd').dialog({
	    title: 'lesson add',
	    width: 400,
	    height: 600,
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
	$("#lesson_add_iframe").attr("src","/seed/lesson/toAdd");
	$('#dd').dialog('open');
}
function openEdit(id){
	$("#lesson_add_iframe").attr("src","/seed/lesson/toEdit?id="+id);
	$('#dd').dialog({title:'lesson edit'});
	$('#dd').dialog('open');
}
function buildButton(value,row,index){
	var str='<a href="javascript:void(0);" onclick="openEdit(\''+row.id+'\');">编辑</a>';
	str+='&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''+row.id+'\');">删除</a>'
	return str;
}
function deleteOne(id){
	$.post('/seed/lesson/delete',{'id':id},function(data){
		alert(data.message);
		if (data.success) {
			$('#dg').datagrid('reload'); 
		}
	});
}
function searchPage(){
	var subject=$("#subject").val();
	var grade=$("#grade").val();
	var name=$("#name").val();

	$('#dg').datagrid('load', {
		 subject:subject
	    
		 ,grade:grade
	    
		 ,name:name
	    
	});
}
function viewFruit(value,row,index){
	var str="";
	debugger;
	if(value!=null&&value.length>0){
		for(var i=0;i<value.length;i++){
			if(i!=0){
				str+=",";
			}
			str+=value[i].name;
		}
	}
		
	return str;
}
</script>
</head>
<body>
<input type="text" class="easyui-textbox" id="subject" >
<input type="text" class="easyui-textbox" id="grade" >
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
					<th data-options="field:'subject',width:100,sortable:true">subject</th>
					<th data-options="field:'grade',width:100,sortable:true">grade</th>
					<th data-options="field:'createTime',width:100,sortable:true">createTime</th>
					<th data-options="field:'student_s',width:100,sortable:true,formatter:viewFruit">学生</th>
 					<th data-options="field:'teacher_s',width:100,sortable:true,formatter:viewFruit">老师</th>
			<th data-options="field:'c',width:200,align:'center',formatter:buildButton">操作</th>
		</tr>
    </thead>
</table>
<div id="dd">
<iframe id="lesson_add_iframe" src="/seed/lesson/toAdd" width="100%" height="100%"></iframe>
</div>
</body>
</html>