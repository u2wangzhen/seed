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
	var htm = "";
	var nowDate='';
	var nowMonth='';
	$(function() {
		htm = $("#dateTotal").html();
		laydate.render({
			elem : '#rl1',
			position : 'static',
			ready : function(d){
				nowDate=d.year+'-'+(d.month<10?'0'+d.month:d.month)+"-"+(d.date<10?'0'+d.date:d.date);
				buildDate(nowDate);
			},
			change : function(value, date) { //监听日期被切换
				buildDate(value);
			},
			showBottom : false
		});
		laydate.render({
			elem : '#rl2',
			type : 'month',
			position : 'static',
			ready : function(d){
				nowMonth=d.year+'-'+(d.month<10?'0'+d.month:d.month);
				buildMonth(nowMonth);
			},
			change : function(value, date) { //监听日期被切换
				buildMonth(value);
			},
			showBottom : false
		});
		
		
		
	});
	function buildDate(date) {
		$.get("/seed/total/toDateTotal?date=" + date, function(data) {
			if (data) {
				var str = '';
				if (data.times) {
					str = '<h1>' + (data.date==nowDate?"今天":data.date) + ",上了" + data.times + '次课，总计：' + data.hour + '小时。</h1>';
					str += '<h3>老师：';
					for ( var t in data.teachers) {
						str += data.teachers[t]+'&nbsp;&nbsp;';
					}
					str += '</h3>';
					str += '<h3>学生：';
					for ( var s in data.students) {
						str += data.students[s]+'&nbsp;&nbsp;';
					}
					str += '</h3>';
				}
				if(data.birthdays){
					str += '<h5>今天过生日学生：'
						for ( var s in data.birthdays) {
							str += data.birthdays[s]+'&nbsp;&nbsp;';
						}
						str += '</h5>';
				}
				
				if (str != '') {
					$("#dateTotal").html(str);
				} else {
					$("#dateTotal").html(htm);
				}
			}
		});
	}
	function buildMonth(date) {
		$.get("/seed/total/toMonthTotal?month=" + date, function(data) {
			if (data) {
				var str = '';
				if (data.times) {
					var mm=data.month==nowMonth?"本月":data.month;
					str = '<h1>' + mm + ",上了" + data.times + '次课，总计：'
							+ data.hour + '小时。</h1>';
				}
				if(data.birthdays){
					str += '<h5>本月过生日学生：'
						for ( var s in data.birthdays) {
							str += data.birthdays[s]+'&nbsp;&nbsp;';
						}
						str += '</h5>'
				}
				if(data.restClas){
					str += '<h2>当前欠课时情况：'
						for ( var s in data.restClas) {
							str += data.restClas[s]+'&nbsp;&nbsp;';
						}
						str += '</h2>'
				}
				if (str != '') {
					$("#monthTotal").html(str);
				} else {
					$("#monthTotal").html(htm);
				}
			}
		});
	}
</script>
</head>
<body>
	

	<div
		style="width: 100%; height: 100%; background-color: #fafafa; float: left; border: 1px solid #ccc">
		<div id="rl1" style="float: left; margin: 5px"></div>
		<div id="dateTotal">
			<h1>自律即自由</h1>
			<h3>未来不迎，当下不杂，过往不恋。</h3>
			<h2>人是某种应该被克服的东西！</h2>
			<h4>不要对自己怜悯，那是懦夫的行为！</h4>
			<h2>万物流变，无物常在！</h2>
		</div>
	</div>
	<div
		style="width: 100%; height: 100%; background-color: #fafafa; float: left; border: 1px solid #ccc">
		<div id="rl2" style="float: left; margin: 5px"></div>
		<div id="monthTotal">
			<h1>自律即自由</h1>
			<h3>未来不迎，当下不杂，过往不恋。</h3>
			<h2>人是某种应该被克服的东西！</h2>
			<h4>不要对自己怜悯，那是懦夫的行为！</h4>
			<h2>万物流变，无物常在！</h2>
		</div>
	</div>
</body>
</html>