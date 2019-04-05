<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>lesson edit</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
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
function insert(s){
	var str="";
	for(var i=0;i<s.length;i++){
		str+=build(s[i]);
	}
	$("#students").html(str);
}
function clear(){
	$("#students").html("");
}
function build(obj){
	var str='<div><input type="hidden" name="student_fid"  value="'+obj.id+'">'+obj.name+'</div>';
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
<td><input type="text" name="name"  class="easyui-textbox" value="${name}"></td>
</tr>

<tr>
<th>subject:</th>
<td><input type="text" name="subject"  class="easyui-textbox" value="${subject}"></td>
</tr>

<tr>
<th>grade:</th>
<td><input type="text" name="grade"  class="easyui-textbox" value="${grade}"></td>
</tr>

<tr>
<th>createTime:</th>
<td><input type="text" name="createTime"  class="easyui-textbox" value="${createTime}"></td>
</tr>
<tr>
<th>student:</th>
<td><div id="students">
<c:forEach items="${student}" var="stu">
<div><input type="hidden" name="student_fid" value="${stu.id}"/>${stu.jsonObj.name }</div>
</c:forEach>
</div></td>
</tr>
<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
</div>
<div data-options="region:'east',split:true,title:'选择学生'" style="width:600px;padding:10px;">
<iframe id="student_select_iframe" src="/seed/student/toSelect" width="100%" height="100%"></iframe>
</div>
</body>
</html>