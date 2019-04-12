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
        text: '<div onclick="addTab(\'teacher\',\'老师\');">老师</div>'
    },{
        text: '<div onclick="addTab(\'lesson\',\'课\');">课</div>'
    },{
        text: 'demo',
        children: [{
            text: '<div onclick="addTab(\'demo1\',\'demo1\');">demo1</div>'
        },{
            text: '<div onclick="addTab(\'demo2\',\'demo2\');">demo2</div>'
        },{
            text: '<div onclick="addTab(\'demo3\',\'demo3\');">demo3</div>'
        },{
            text: '<div onclick="addTab(\'demo4\',\'demo4\');">demo4</div>'
        },{
            text: '<div onclick="addTab(\'demo5\',\'demo5\');">demo5</div>'
        }]
    }]
},{
    text: '系统',
    iconCls: 'icon-more',
    state: 'open',
    children: [{
        text: '<div onclick="addTab(\'account\',\'账号\');">账号</div>'
    },{
        text: '<div onclick="addTab(\'role\',\'角色\');">角色</div>'
    },{
        text: '<div onclick="addTab(\'menu\',\'目录\');">目录</div>'
    },{
        text: '<div onclick="addTab(\'model\',\'模块\');">模块</div>'
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
		 <iframe id="home_frame" src="/seed/main/home" style="width: 100%;height: 100%;"></iframe>
		</div>
	</div>
	</div>
</body>
</html>