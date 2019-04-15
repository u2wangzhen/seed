<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>period edit</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function() {
		laydate.render({
			elem : '#pdate' //指定元素
		});

		laydate.render({
			elem : '#startTime' //指定元素
			,
			type : 'time',
			change: function(value, date, endDate){
			    $("#startTime").val(value);
			    setEndTime();
			  }
		});

		laydate.render({
			elem : '#endTime' //指定元素
			,
			type : 'time'
		});
		$('#pdate').validatebox({
			required : true,
			validType : 'length[0,16]',
			invalidMessage : '不超过16个字'
		});
		$('#phour').validatebox({
			required : true,
			validType : 'length[0,4]',
			invalidMessage : '不超过4个字'
		});
		$('#startTime').validatebox({
			required : true,
			validType : 'length[0,24]',
			invalidMessage : '不超过24个字'
		});
		$('#endTime').validatebox({
			required : true,
			validType : 'length[0,24]',
			invalidMessage : '不超过24个字'
		});
		$('#remark').validatebox({
			required : false,
			validType : 'length[0,255]',
			invalidMessage : '不超过255个字'
		});

		$('#selectWindow').panel('resize', {
			width : $(document).width() * 0.7
		});
		$('body').layout('resize');

	});

	function ok() {
		$.messager.progress();
		$('#period_form').form('submit', {
			onSubmit : function() {
				var str=$("#lesson").html();
				if(str==''){
					$.messager.progress('close');
					$.messager.alert("操作提示","请先选择课程！");
					return false;
				}
				str=$("#student").html();
				if(str==''){
					$.messager.progress('close');
					$.messager.alert("操作提示","请先选择学生！");
					return false;
				}
				var isValid = $(this).form('validate');
				if (!isValid) {
					$.messager.progress('close');
				}
				return isValid;
			},
			success : function(data) {
				var data = eval('(' + data + ')');
				if (data.success) {
					$.messager.alert("操作提示", data.message);
					$('#period_form').form('clear');
				}
				$.messager.progress('close');
			}
		});
	}
	function openSelect(key) {
		if(key=='student'){
			var str=$("#lesson").html();
			if(str==''){
				$.messager.alert("操作提示","请先选择课程！");
				return;
			}
			var lesson_fid=$("[name='lesson_fid']").val();
			$('#selectWindow').html(
					'<iframe id="select_iframe" src="/seed/' + key
							+ '/toSelect?lesson_fid='+lesson_fid+'" width="100%" height="100%"></iframe>');
		}else{
			$('#selectWindow').html(
					'<iframe id="select_iframe" src="/seed/' + key
							+ '/toSelect" width="100%" height="100%"></iframe>');
		}
		$('#selectWindow').panel('setTitle', 'select ' + key);
	}
	function insert(key, s) {
		var str = "";
		for (var i = 0; i < s.length; i++) {
			str += build(key, s[i]);
		}
		$("#" + key).html(str);
	}
	function clear(key) {
		$("#" + key).html("");
	}
	function build(key, obj) {
		var str = '<div><input type="hidden" name="'+key+'_fid"  value="'+obj.id+'">'
				+ obj.name + '</div>';
		return str;
	}
	function setEndTime(){
		var s=$("#startTime").val();
		var h=$("#phour").val();
		if(s!=null&&s!=''&&h!=null&&h!=''){
			if(h.indexOf('.5')<0){
				var s1=s.substring(0,s.indexOf(':'));
				var s2=s.substring(s.indexOf(':'));
				var hh=parseInt(h)+parseInt(s1);
				var str=hh+s2;
				$("#endTime").val(str);
			}else{
				var hh=s.substring(0,s.indexOf(':'));
				var mm=s.substring(s.indexOf(':')+1).substring(0,s.indexOf(':'));
				var mmm=parseInt(mm)+30;
				var i=0;
				if(mmm>=60){
					mmm=mmm-60;
					i++;
				}
				var hhh=parseInt(hh)+parseInt(h)+i;
				var str=hhh+":"+mmm+":00";
				$("#endTime").val(str);
			}
		}
	}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<form id="period_form" action="/seed/period/update" method="post">
			<input type="hidden" id="id" name="id" value="${id}">
			<table>
				<tr>
					<th>课程:</th>
					<td><div id="lesson" class="selectOther">
							<c:forEach items="${lesson}" var="obj">
								<div>
									<input type="hidden" name="lesson_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('lesson');">选择课程</a></td>
				</tr>
				<tr>
					<th>学生:</th>
					<td><div id="student" class="selectOther">
							<c:forEach items="${student}" var="obj">
								<div>
									<input type="hidden" name="student_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('student');">选择学生</a></td>
				</tr>
				<tr>
					<th>日期:</th>
					<td><input type="text" id="pdate" name="pdate"
						value="${pdate}" maxlength="16" size="8"></td>
				</tr>
				<tr>
					<th>开始时间:</th>
					<td><input type="text" id="startTime" name="startTime"
						value="${startTime}" maxlength="24" size="8"></td>
				</tr>
				
				<tr>
					<th>课时（h）:</th>
					<td>
						<select id="phour" name="phour" onchange="setEndTime();">
							<option value="${phour}">${phour}</option>
							<option value="2">2</option>
							<option value="1.5">1.5</option>
							<option value="1">1</option>
							<option value="0.5">0.5</option>
						</select>
						</td>
				</tr>
				
				<tr>
					<th>结束时间:</th>
					<td><input type="text" id="endTime" name="endTime"
						value="${endTime}" maxlength="24" size="8"></td>
				</tr>
				<tr>
					<th>备注:</th>
					<td><textarea rows="3" cols="25" id="remark" name="remark">${remark}</textarea>
					</td>
				</tr>


				<tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
					</th>
				</tr>
			</table>
	</div>
	<div id="selectWindow"
		data-options="region:'east',split:true,title:' '"
		style="width: 600px; padding: 10px;"></div>
	</form>
</body>
</html>