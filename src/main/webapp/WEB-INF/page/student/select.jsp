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
		url:'/seed/student/getAll',
	    loadMsg:'请稍后...',
	    toolbar: '#tb',
	    idField:'id',
	    remoteSort:false,
	    onLoadSuccess:function(){
	    	var s=$("[name='student_fid']",window.parent.document);
	    	if(s!=null&&s.length>0){
	    		for(var i=0;i<s.length;i++){
	    			alert(s[i].value);
	    			$('#dg').datagrid("selectRecord",s[i].value);
	    		}

	    	}
	    }
	});
	
});

function getSelections(){
	var s=$('#dg').datagrid("getSelections");
	if(s!=null&&s.length>0){
		parent.insert(s);
	}
}
function searchPage(){
	var sex=$("#sex").val();
	var name=$("#name").val();

	$('#dg').datagrid('load', {
		 sex:sex,name:name
	    
	});
}
</script>
</head>
<body>
<input type="text" class="easyui-textbox" id="sex" >
<input type="text" class="easyui-textbox" id="name" >
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<div id="tb">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="getSelections();"></a>
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
		</tr>
    </thead>
</table>

</body>
</html>