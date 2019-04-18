<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>recharge</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/recharge/getAll',
	    loadMsg:'请稍后...',
	    idField:'id',
	    remoteSort:false,
	    singleSelect : ${empty singleSelect?'false':singleSelect},
	    onLoadSuccess:function(){
	    	var s=$("[name='recharge_fid']",window.parent.document);
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
		parent.insert("recharge",s);
	}else{
		parent.clear("recharge");
	}
}
function searchPage(){
	var date=$("#date").val();
	$('#dg').datagrid('load', {
		 date:date
	});
}
</script>
</head>
<body>
<input type="text" id="date" placeholder="date" >
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<table id="dg" class="easyui-datagrid" style="width:100%;height:auto">
    <thead>
		<tr>
			<th data-options="field:'id',width:50,sortable:true" >ID</th>
					<th data-options="field:'times',width:100,sortable:true">times</th>
					<th data-options="field:'date',width:100,sortable:true">date</th>
					<th data-options="field:'remark',width:100,sortable:true">remark</th>
		</tr>
    </thead>
</table>
</body>
</html>