<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
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
$(function(){
	$("#home_frame").attr('src', "/seed/main/home");
});
function addTab(path,name){
	var obj=$("#main_tab").tabs('getTab',name);//path+'_tab'
	var p=path.substring(1);
	if(obj==null){
		$("#main_tab").tabs('add',{
			id:path+"_tab",
			title:name,
		    content:'<iframe id="'+p+'tabframe" src="/seed'+path+'" style="width: 100%;height: 100%;"></iframe>',
		    closable:true,
		    tools:[{
				iconCls:'icon-reload',
				handler:function(){
					$("#"+p+"tabframe").attr('src', $("#"+p+"tabframe").attr('src'));
				}
		    }]
		});
	}else{
		$("#main_tab").tabs('select',name);
		$("#"+p+"tabframe").attr('src', $("#"+p+"tabframe").attr('src'));
	}
	
}
var data=function(){
	var a=null;
	$.ajax({url:'/seed/main/getMenu',async:false,success:function(d){
		a=d;
	}});
	return a;
}();

</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:true,title:'用户：${sessionScope.user_name}'" style="width:150px;padding:10px;">
				
		<div id="sm" class="easyui-sidemenu" data-options="data:data" style="width:123px"></div>
		<div  style=" width:121px; height:30px;"><span style="display:block;width:54px; height:30px;line-height:30px;float:left;overflow:hidden;"></span>
		<a style="display:block; float:right;" href="/seed/toOut"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-back',plain:true">退出</a></div>
	</div>
	<div data-options="region:'center'">
	<div id="main_tab" class="easyui-tabs" style="height:100%">
		<div title="首页" style="padding:10px">
		 <iframe id="home_frame" src="" style="width: 100%;height: 100%;"></iframe>
		</div>
	</div>
	</div>
</body>
</html>