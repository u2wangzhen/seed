<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/material/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function() {
		laydate
				.render({
					elem : '#rl1',
					position : 'static',
					change : function(value, date) { //监听日期被切换
						//lay('#testView').html(value);
					}/* ,
							  mark: {
								    '2019-4-14': '5节课'} */
					,
					done : function(value, date) {
						if (value=='2019-04-14') { //点击2017年8月15日，弹出提示语
							alert("14节课");
						}
					},btns: [],showBottom: false
				});
		 laydate.render({
			  elem: '#rl2'
			  ,type: 'month'
			  ,position: 'static'
			  ,change: function(value, date){ //监听日期被切换
			    //lay('#testView').html(value);
			  }
		 		,showBottom: false
			}); 

	});
</script>
</head>
<body>
	<div style="width: 100%;height: 100%;background-color: #fafafa;float:left;border:1px solid #ccc">
	<div id="rl1" style="float:left;margin:5px"></div><div id="rl2" style="float:left;margin:5px"></div>
	<h1>自律即自由</h1>
	<h3>未来不迎，当下不杂，过往不恋。</h3>
	<h2>人是某种应该被克服的东西！</h2>
	<h4>不要对自己怜悯，那是懦夫的行为！</h4>
	<h2>万物流变，无物常在！</h2>
	<!-- <div id="p" class="easyui-panel" title="My Panel"
    style="width:350px;height:400px;padding:10px;background:#fafafa;"
    data-options="iconCls:'icon-save',closable:true,
    collapsible:true,minimizable:true,maximizable:true">
    <div id="rl1"></div>
</div> -->
	<!-- <div id="p" class="easyui-panel" title="My Panel"
    style="width:500px;height:150px;padding:10px;background:#fafafa;"
    data-options="iconCls:'icon-save',closable:true,
    collapsible:true,minimizable:true,maximizable:true">
    <div id="rl2"></div> -->
	</div>
</body>
</html>