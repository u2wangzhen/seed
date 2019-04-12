<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		url:'/seed/demo4/getAll',
	    loadMsg:'请稍后...',
	    idField:'id',
	    remoteSort:false,
	    onLoadSuccess:function(){
	    	var s=$("[name='demo4_fid']",window.parent.document);
	    	if(s!=null&&s.length>0){
	    		for(var i=0;i<s.length;i++){
	    			$('#dg').datagrid("selectRecord",s[i].value);
	    		}

	    	}
	    },
	    onSelect:function(){
	    	getSelections();
	    },
		onUnselect:function(){
	    	getSelections();
	    }
	});
	
});

function getSelections(){
	var s=$('#dg').datagrid("getSelections");
	if(s!=null&&s.length>0){
		parent.insert("demo4",s);
	}else{
		parent.clear("demo4");
	}
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
<input type="text" id="name" placeholder="name" >
<input type="text" id="age" placeholder="age" >
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<table id="dg" class="easyui-datagrid" style="width:100%;height:auto">
    <thead>
		<tr>
			<th data-options="field:'id',width:50,sortable:true" >ID</th>
					<th data-options="field:'name',width:100,sortable:true">name</th>
					<th data-options="field:'age',width:100,sortable:true">age</th>
		</tr>
    </thead>
</table>
</body>
</html>