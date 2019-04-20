<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>sys</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/laydate/laydate.js"></script>
<script type="text/javascript">
$(function() {
	 laydate.render({
		  elem: '#rl2'
		  ,type: 'month'
		  ,position: 'static'
		  ,change: function(value, date){ //监听日期被切换
			  
			  $.messager.prompt('身份验证', '请输入密码:', function(pw){
					if (pw){
						$.ajax({url:'/seed/main/identity?pw='+pw,async:false,success:function(d){
							if(d){
								$("#salary_iframe").attr("src", "/seed/total/toSalaryTotal?month="+value);
								$('#dd').dialog('open');
							}
						}});
						
					}
				});
			  $('.messager-input').attr('type','password');
		  }
	 		,showBottom: false
		}); 
	 $('#dd').dialog({
			title : '薪资收入统计',
			width : $(document).width() - 10,
			height : $(document).height() - 10,
			closed : true,
			maximizable : true,
			maximizabd : true,
			cache : false,
			modal : true
		});
	
});
</script>
</head>
<body>
<!-- <div>
<div style="width: 30%;height: 100%;background-color: #fafafa;float:left;border:1px solid #ccc"> -->
<div id="rl2" style="float:left;margin:5px"></div>
<div id="dd">
		<iframe id="salary_iframe" src="" width="100%" height="100%"></iframe>
	</div>
<!-- </div>
<div style="width: 70%;height: 100%;background-color: #fafafa;float:left;border:1px solid #ccc">afasdfasdf</div>
</div> -->
</body>
</html>
