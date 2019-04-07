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
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function ok() {
		$('#lesson_form').form('submit', {

			success : function(data) {
				var data = eval('(' + data + ')'); // change the JSON string to javascript object
				if (data.success) {
					alert(data.message);
					$('#lesson_form').form('clear');
				}
			}

		});
	}
	function openSelect(key) {
		$('#select').html(
				'<iframe id="select_iframe" src="/seed/' + key
						+ '/toSelect" width="100%" height="100%"></iframe>');
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
			<input type="hidden" name="id" value="${id}">

			<table>
				<tr>
					<th>name:</th>
					<td><input type="text" name="name" class="easyui-textbox"
						value="${name}"></td>
				
					<th>subject:</th>
					<td><input type="text" name="subject" class="easyui-textbox"
						value="${subject}"></td>
				</tr>

				<tr>
					<th>grade:</th>
					<td><input type="text" name="grade" class="easyui-textbox"
						value="${grade}"></td>
				
					<th>createTime:</th>
					<td><input type="text" name="createTime"
						class="easyui-textbox" value="${createTime}"></td>
				</tr>
				<tr>
					<th>student:</th>
					<td><div id="student">
							<c:forEach items="${student}" var="obj">
								<div>
									<input type="hidden" name="student_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="openSelect('student');"></a>
						</td>
				
					<th>teacher:</th>
					<td><div id="teacher">
							<c:forEach items="${teacher}" var="obj">
								<div>
									<input type="hidden" name="teacher_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="openSelect('teacher');"></a></td>
				</tr>
				<tr>
					<th colspan="2"><button type="button" onclick="ok();">提交</button></th>
				</tr>
			</table>
		</form>
		<iframe id="price_iframe" src="/seed/price?lesson_fid=${id }" width="100%" height="300"></iframe>
	</div>
	<div id="select" data-options="region:'east',split:true,title:'选择'"
		style="width: 600px; padding: 10px;"></div>
</body>
</html>