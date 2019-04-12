<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>model</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	var menu_fid=$("#menu_fid").val();
	$('#dg').datagrid({
		url:'/seed/model/page?menu_fid='+menu_fid,
	    pagination:true,
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    remoteSort:false
	});
	$('#dd').dialog({
	    title: 'model add',
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
	var menu_fid=$("#menu_fid").val();
	$("#model_add_iframe").attr("src","/seed/model/toAdd?menu_fid="+menu_fid);
	$('#dd').dialog('open');
}
function openEdit(id){
	$("#model_add_iframe").attr("src","/seed/model/toEdit?id="+id);
	$('#dd').dialog({title:'model edit'});
	$('#dd').dialog('open');
}
function buildButton(value,row,index){
	var str='<a href="javascript:void(0);" onclick="openEdit(\''+row.id+'\');">编辑</a>';
	str+='&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deleteOne(\''+row.id+'\');">删除</a>'
	return str;
}
function deleteOne(id){
	$.post('/seed/model/delete',{'id':id},function(data){
		$.messager.alert("操作提示", data.message);
		if (data.success) {
			$('#dg').datagrid('reload'); 
		}
	});
}
function searchPage(){
var menu_fid=$("#menu_fid").val();
	var name=$("#name").val();

	$('#dg').datagrid('load', {
		menu_fid:menu_fid
		 ,name:name
	});



}
</script>
</head>
<body>
<input type="hidden" id="menu_fid" value="${menu_fid}">
<input type="text" id="name"  placeholder="name" >
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<div id="tb">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openAdd();"></a>
</div>
<table id="dg" class="easyui-datagrid" style="width:100%;height:auto">
    <thead>
		<tr>
			<th data-options="field:'id',width:50,sortable:true" >ID</th>
					<th data-options="field:'name',width:100,sortable:true">name</th>
					<th data-options="field:'path',width:100,sortable:true">path</th>
			<th data-options="field:'c',align:'center',formatter:buildButton">操作</th>
		</tr>
    </thead>
</table>
<div id="dd">
<iframe id="model_add_iframe" src="" width="100%" height="100%"></iframe>
</div>
</body>
</html>