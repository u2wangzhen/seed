<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>lesson edit</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/seed/js/validate_repeat.js"></script>
<!-- <style type="text/css">
.selectOther div{float:left;padding:5px;background:#fafafa;border:1px solid #ccc}
</style> -->
<script type="text/javascript">
	$(function() {

		$('#subject').validatebox({
			required : false,
			validType : 'length[0,4]',
			invalidMessage : '不超过4个字'
		});

		$('#name').validatebox({
			required : true,
			validType : 'repeat[4,"lesson","name"]',
			invalidMessage : '不能重复,且不能超过4个字'
		});
		
		openSub('price');
	});
	function ok() {
		$('#lesson_form').form('submit', {
			success : function(data) {
				var data = eval('(' + data + ')'); // change the JSON string to javascript object
				if (data.success) {
					$.messager.alert("操作提示", data.message);
					$('#lesson_form').form('clear');
				}
			}
		});
	}
	function openSub(key) {
		var id = $("#id").val();
		$('#select').html(
				'<iframe id="select_iframe" src="/seed/'+key+'?lesson_fid=' + id
						+ '" width="100%" height="100%"></iframe>');
		$('#select').panel('setTitle','edit '+key);
	}
	function openSelect(key) {
		$('#select').html(
				'<iframe id="select_iframe" src="/seed/' + key
						+ '/toSelect" width="100%" height="100%"></iframe>');
			$('#select').panel('setTitle','select '+key);
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
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<form id="lesson_form" action="/seed/lesson/update" method="post">
			<input type="hidden" id="id" name="id" value="${id}">

			<table>
				<tr>
					<th>name:</th>
					<td><input type="text" id="name" name="name" value="${name}"></td>
				</tr>

				<tr>
					<th>subject:</th>
					<td><input type="text" id="subject" name="subject" value="${subject}"></td>
				</tr>

				<tr>
					<th>grade:</th>
					<td><input type="text" id="grade" name="grade" value="${grade}"></td>
				</tr>

				<tr>
					<th>createTime:</th>
					<td><input type="text" id="createTime" name="createTime" value="${createTime}"></td>
				</tr>
				<tr>
					<th>student:</th>
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
					<th>teacher:</th>
					<td><div id="teacher" class="selectOther">
							<c:forEach items="${teacher}" var="obj">
								<div>
									<input type="hidden" name="teacher_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div>
						<div>
							<a href="javascript:void(0);" class="easyui-linkbutton"
								data-options="iconCls:'icon-search',plain:true"
								onclick="openSelect('teacher');"></a>
						</div></td>
				</tr>
				<tr>

					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-add',plain:true" onclick="openSub('price');">open price</a></th>
				</tr>
				<tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</></th>
				</tr>
			</table>
		</form>

	</div>
	<div id="select" data-options="region:'east',split:true,title:' '"
		style="width: 600px; padding: 10px;">
	</div>
</body>
</html>