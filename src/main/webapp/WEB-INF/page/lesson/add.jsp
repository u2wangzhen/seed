<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>lesson add</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#dd').dialog({
	    title: 'student select',
	    width: 800,
	    height: 600,
	    closed: true,
	    cache: false,
	    maximizable:true,
	    modal: true,
	    onClose:function(){
	    	$('#dg').datagrid('reload'); 
	    }
	});
});
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
function add(){
	$('#dd').dialog('open');
}
function insert(s){
	var str="";
	for(var i=0;i<s.length;i++){
		str+=build(s[i]);
	}
	$("#students").html(str);
}
function build(obj){
	var str='<div id="'+obj.id+'"><input type="hidden" name="student_fid"  value="'+obj.id+'">'+obj.name+'</div>';
	return str;
}
</script>
</head>
<body>
<form id="lesson_form" action="/seed/lesson/add" method="post">
<table>
<tr>
<th>name:</th>
<td><input type="text" name="name"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>subject:</th>
<td><input type="text" name="subject"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>grade:</th>
<td><input type="text" name="grade"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>createTime:</th>
<td><input type="text" name="createTime"  class="easyui-textbox" value=""></td>
</tr>

<tr>
<th>students:</th>
<td><div id="students"></div>
<button type="button" onclick="add();">添加</button>
</td>
</tr>
<tr><th colspan="2"><button type="button" onclick="ok();">提交</button></th></tr>
</table>
</form>
<div id="dd">
<iframe id="student_select_iframe" src="/seed/student/toSelect" width="100%" height="100%"></iframe>
</div>
</body>
</html>