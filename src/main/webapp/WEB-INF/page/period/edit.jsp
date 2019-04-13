<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>period edit</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
		$('#pdate').validatebox({
		    required: false,
		    validType: 'length[0,16]',
		    invalidMessage:'不超过16个字'
		});
		$('#phour').validatebox({
		    required: false,
		    validType: 'length[0,4]',
		    invalidMessage:'不超过4个字'
		});
		$('#startTime').validatebox({
		    required: false,
		    validType: 'length[0,24]',
		    invalidMessage:'不超过24个字'
		});
		$('#endTime').validatebox({
		    required: false,
		    validType: 'length[0,24]',
		    invalidMessage:'不超过24个字'
		});
		$('#remark').validatebox({
		    required: false,
		    validType: 'length[0,255]',
		    invalidMessage:'不超过255个字'
		});
		
		$('#selectWindow').panel('resize',{
			width: $(document).width()*0.7
		});
		$('body').layout('resize');
		
});

function ok() {
	$.messager.progress();
	$('#period_form').form('submit', {
		onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
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
		$('#selectWindow').html('<iframe id="select_iframe" src="/seed/'+key+'/toSelect" width="100%" height="100%"></iframe>');
		$('#selectWindow').panel('setTitle','select '+key);
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
<form id="period_form" action="/seed/period/update" method="post">
<input type="hidden" id="id" name="id" value="${id}">
<table>
<tr>
<th>pdate:</th>
<td><input type="text" id="pdate" name="pdate" value="${pdate}" maxlength="16"></td>
</tr>
<tr>
<th>phour:</th>
<td><input type="text" id="phour" name="phour" value="${phour}" maxlength="4"></td>
</tr>
<tr>
<th>startTime:</th>
<td><input type="text" id="startTime" name="startTime" value="${startTime}" maxlength="24"></td>
</tr>
<tr>
<th>endTime:</th>
<td><input type="text" id="endTime" name="endTime" value="${endTime}" maxlength="24"></td>
</tr>
<tr>
<th>remark:</th>
<td><input type="text" id="remark" name="remark" value="${remark}" maxlength="255"></td>
</tr>

<tr>
					<th>lesson:</th>
					<td><div id="lesson" class="selectOther">
							<c:forEach items="${lesson}" var="obj">
								<div>
									<input type="hidden" name="lesson_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('lesson');"></a></td>
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
<th colspan="2">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
</th>
</tr>
</table>
</div>
<div id="selectWindow" data-options="region:'east',split:true,title:' '" style="width: 600px; padding: 10px;"></div>
</form>
</body>
</html>