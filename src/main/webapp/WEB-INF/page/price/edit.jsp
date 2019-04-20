<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>price edit</title>
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#price').numberbox({
			required : true,
		    min:0,
		    max:1000,
		    precision:0
		});
		$('#remark').validatebox({
			required : false,
			validType : 'length[0,255]',
			invalidMessage : '不超过255个字'
		});

		/* $('#selectWindow').panel('resize',{
			width: $(document).width()*0.7
		});
		$('body').layout('resize'); */

	});

	function ok() {
		$.messager.progress();
		$('#price_form').form('submit', {
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
					$.messager.alert("操作提示", data.message,'info',function(){
						window.parent.closeDialog();
					});
				}
				$.messager.progress('close');
			}
		});
	}
	function openSelect(key) {
		$('#selectWindow').html(
				'<iframe id="select_iframe" src="/seed/' + key
						+ '/toSelect" width="100%" height="100%"></iframe>');
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
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<form id="price_form" action="/seed/price/update" method="post">
			<input type="hidden" id="id" name="id" value="${id}">
			<c:forEach items="${lesson}" var="obj">
				<input type="hidden" name="lesson_fid" value="${obj.id}" />
			</c:forEach>
			<table>
				<tr>
					<th>学生:</th>
					<td><div id="student" class="selectOther">
							<c:forEach items="${student}" var="obj">
								<div>
									<input type="hidden" name="student_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div>
						<!--  <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('student');"></a> --></td>
				</tr>
				<tr>
					<th>价格:</th>
					<td><input type="text" id="price" name="price"
						value="${price}" maxlength="16" size="6"></td>
				</tr>
				<tr>
					<th>备注:</th>
					<td><textarea rows="3" cols="25" id="remark" name="remark">${remark}</textarea></td>
				</tr>

				
				<tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
					</th>
				</tr>
			</table>
	</div>
	<!-- <div id="selectWindow" data-options="region:'east',split:true,title:' '" style="width: 600px; padding: 10px;"></div>
 -->
	</form>
</body>
</html>