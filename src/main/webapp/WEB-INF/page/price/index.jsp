<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>price</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	var lesson_fid=$("#lesson_fid").val();
	$('#dg').datagrid({
		url:'/seed/price/getAll?lesson_fid='+lesson_fid,
	   // pagination:true,
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    remoteSort:false
	});
	$('#dd').dialog({
	    title: 'price add',
	    width: 400,
	    height: 300,
	    closed: true,
	    cache: false,
	    modal: true,
	    onClose:function(){
	    	$('#dg').datagrid('reload'); 
	    }
	});
});
function openAdd(){
	var lesson_fid=$("#lesson_fid").val();
	$("#price_add_iframe").attr("src","/seed/price/toAdd?lesson_fid="+lesson_fid);
	$('#dd').dialog('open');
}
function openEdit(id){
	$("#price_add_iframe").attr("src","/seed/price/toEdit?id="+id);
	$('#dd').dialog({title:'price edit'});
	$('#dd').dialog('open');
}
function buildButton(value,row,index){
	var str='<a href="javascript:void(0);" onclick="openEdit(\''+row.id+'\');">编辑</a>';
	str+='&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''+row.id+'\');">删除</a>'
	return str;
}
function deleteOne(id){
	$.post('/seed/price/delete',{'id':id},function(data){
		alert(data.message);
		if (data.success) {
			$('#dg').datagrid('reload'); 
		}
	});
}
function searchPage(){
	var lesson_fid=$("#lesson_fid").val();
	$('#dg').datagrid('load', {lesson_fid:lesson_fid});
}
</script>
</head>
<body>
<input type="hidden" id="lesson_fid" value="${lesson_fid}">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<div id="tb">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openAdd();"></a>
</div>
<table id="dg" class="easyui-datagrid" style="width:100%;height:100%">
    <thead>
		<tr>
			<th data-options="field:'id',width:100,sortable:true" >ID</th>
					<th data-options="field:'price',width:100,sortable:true">price</th>
					<th data-options="field:'remark',width:100,sortable:true">remark</th>
			<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
		</tr>
    </thead>
</table>
<div id="dd">
<iframe id="price_add_iframe" src="/seed/price/toAdd" width="100%" height="100%"></iframe>
</div>
</body>
</html>