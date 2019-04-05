<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>seeds</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/material/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
function addTab(key,name){
	$("#main_tab").tabs('add',{
		title:name,
	    content:'<iframe id="'+key+'_frame" src="/seed/'+key+'" style="width: 100%;height: 100%;"></iframe>',
	    closable:true,
	    tools:[{
			iconCls:'icon-reload',
			handler:function(){
				$("#"+key+"_frame").attr('src', $("#"+key+"_frame").attr('src'));
			}
	    }]
	});
}
var data = [{
    text: '应用',
    iconCls: 'icon-sum',
    state: 'open',
    children: [{
        text: '<div onclick="addTab(\'student\',\'学生\');">学生</div>'
    },{
        text: '<div onclick="addTab(\'lesson\',\'课\');">课</div>'
    },{
        text: 'Option3',
        children: [{
            text: 'Option31'
        },{
            text: 'Option32'
        }]
    }]
},{
    text: '系统',
    iconCls: 'icon-more',
    state: 'open',
    children: [{
        text: '<div onclick="addTab(\'sysconf\',\'模板注册\');">模板注册</div>'
    },{
        text: '<div onclick="addTab(\'user\',\'用户管理\');">用户管理</div>'
    },{
        text: '<div onclick="addTab(\'maker\',\'生成器\');">生成器</div>'
    }]
}];
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:true,title:'Seeds'" style="width:150px;padding:10px;">
	
	
		<div id="sm" class="easyui-sidemenu" data-options="data:data"></div>
	
	</div>
	
	<div data-options="region:'center'">
	<div id="main_tab" class="easyui-tabs" style="height:100%">
		<div title="home" style="padding:10px">
		${root }
		 <iframe id="home_frame" src="/seed/main/home" style="width: 100%;height: 100%;"></iframe>
		</div>
	</div>
	</div>
</body>
</html>