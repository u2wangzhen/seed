<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>teacher</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#dg').datagrid({
		url:'/seed/teacher/getAll',
	    loadMsg:'请稍后...',
	    idField:'id',
	    remoteSort:false,
	    singleSelect:true,
	    onLoadSuccess:function(){
	    	var s=$("[name='teacher_fid']",window.parent.document);
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
		parent.insert("teacher",s);
	}else{
		parent.clear("teacher");
	}
}
function searchPage(){
	var subject=$("#subject").val();
	var sex=$("#sex").val();
	var name=$("#name").val();
	$('#dg').datagrid('load', {
		 subject:subject
		 ,sex:sex
		 ,name_l:name
	});
}
</script>
</head>
<body>
<input type="text" id="name" placeholder="姓名">
	性别：<select id="sex">
		<option value="">--</option>
		<option value="男">男</option>
		<option value="女">女</option>
	</select>
	科目：<select id="subject">
		<option value="">--</option>
		<option value="数学">数学</option>
		<option value="物理">物理</option>
		<option value="化学">化学</option>
		<option value="英语">英语</option>
		<option value="语文">语文</option>
		<option value="地理">地理</option>
		<option value="生物">生物</option>
		<option value="历史">历史</option>
		<option value="政治">政治</option>
	</select>
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchPage();"></a>
<table id="dg" class="easyui-datagrid" style="width:100%;height:auto">
    <thead>
		<tr>
			<th data-options="field:'id',width:50,sortable:true" >ID</th>
				<th data-options="field:'name',width:100,sortable:true">姓名</th>
				<th data-options="field:'sex',width:50,sortable:true">性别</th>
				<th data-options="field:'subject',width:50,sortable:true">科目</th>
				<th data-options="field:'birthday',width:100,sortable:true">生日</th>
				<th data-options="field:'remark',width:200,sortable:true">备注</th>
		</tr>
    </thead>
</table>
</body>
</html>