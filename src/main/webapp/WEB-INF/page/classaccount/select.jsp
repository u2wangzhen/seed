<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>classaccount</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/classaccount/getAll',
	    loadMsg:'请稍后...',
	    idField:'id',
	    remoteSort:false,
	    singleSelect : ${empty singleSelect?'false':singleSelect},
	    onLoadSuccess:function(){
	    	var s=$("[name='classaccount_fid']",window.parent.document);
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
		parent.insert("classaccount",s);
	}else{
		parent.clear("classaccount");
	}
}
function searchPage(){
	var name=$("#name").val();
	$('#dg').datagrid('load', {
		 name:name
	});
}
function viewFruit(value,row,index){
	var str="";
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
<input type="text" id="name" placeholder="name" >
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<table id="dg" class="easyui-datagrid" style="width:100%;height:auto">
    <thead>
		<tr>
			<th data-options="field:'id',width:50,sortable:true" >ID</th>
					<th data-options="field:'name',width:100,sortable:true">name</th>
					<th data-options="field:'student_s',width:100,sortable:true,formatter:viewFruit">student</th>
					<th data-options="field:'lesson_s',width:100,sortable:true,formatter:viewFruit">lesson</th>
		</tr>
    </thead>
</table>
</body>
</html>