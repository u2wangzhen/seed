<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>classaccount edit</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/validate_repeat.js"></script>
<script type="text/javascript">
	$(function() {
		$('#name').validatebox({
			required : true,
			validType : 'repeat[64,"classaccount","name"]',
			invalidMessage : '不超过64个字,不能重复'
		});

		$('#selectWindow').panel('resize', {
			width : $(document).width() * 0.7
		});
		$('body').layout('resize');

		openSub('recharge');
	});

	function ok() {
		$.messager.progress();
		$('#classaccount_form').form('submit', {
			onSubmit : function() {
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
					$('#classaccount_form').form('clear');
				}
				$.messager.progress('close');
			}
		});
	}
	function openSelect(key) {
		if(key=='lesson'){
			var str=$("#student").html();
			if(str==''){
				$.messager.alert("操作提示","请先选择学生！");
				return;
			}
			var student_fid=$("[name='student_fid']").val();
			$('#selectWindow').html(
					'<iframe id="select_iframe" src="/seed/' + key
							+ '/toSelect?student_fid='+student_fid+'" width="100%" height="100%"></iframe>');
		}else{
			$('#selectWindow').html(
					'<iframe id="select_iframe" src="/seed/' + key
							+ '/toSelect?singleSelect=true" width="100%" height="100%"></iframe>');
		}
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
	function openSub(key) {
		var id = $("#id").val();
		$('#selectWindow').html(
				'<iframe id="select_iframe" src="/seed/' + key
						+ '?classaccount_fid=' + id
						+ '" width="100%" height="100%"></iframe>');
		$('#selectWindow').panel('setTitle', '课时充值');
	}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<form id="classaccount_form" action="/seed/classaccount/update"
			method="post">
			<input type="hidden" id="id" name="id" value="${id}">
			<table>
				<tr>
					<th>名称:</th>
					<td><input type="text" id="name" name="name" value="${name}"
						maxlength="64"></td>
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
						onclick="openSelect('student');"></a></td>
				</tr>
				<tr>
					<th>课程:</th>
					<td><div id="lesson" class="selectOther">
							<c:forEach items="${lesson}" var="obj">
								<div>
									<input type="hidden" name="lesson_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('lesson');"></a></td>
				</tr>
				<!-- <tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-add',plain:true"
						onclick="openSub('recharge');">课时充值</a></th>
				</tr> -->
				<tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="ok();">保存</a>
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