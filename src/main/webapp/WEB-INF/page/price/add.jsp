<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>price add</title>
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/seed/js/ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/seed/css/select_div.css">
<script type="text/javascript" src="/seed/js/ui/jquery.min.js"></script>
<script type="text/javascript" src="/seed/js/ui/jquery.easyui.min.js"></script>
<script type="text/javascript">

$(function(){
		$('#price').validatebox({
		    required: false,
		    validType: 'length[0,16]',
		    invalidMessage:'不超过16个字'
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
	$('#price_form').form('submit', {
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
				$('#price_form').form('clear');
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
<form id="price_form" action="/seed/price/add" method="post">
<input type="hidden" name="lesson_fid" value="${lesson_fid}">
<table>
<tr>
<th>price:</th>
<td><input type="text" id="price" name="price" value="" maxlength="16" ></td>
</tr>
<tr>
<th>remark:</th>
<td><input type="text" id="remark" name="remark" value="" maxlength="255" ></td>
</tr>
<tr>
	<th>students:</th>
	<td>
		<div id="student" class="selectOther"></div>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="openSelect('student');"></a>
	</td>
</tr>
<tr>
<th colspan="2">
<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="ok();">save</a>
</th>
</tr>
</table>
</form>
</div>
<div id="selectWindow" data-options="region:'east',split:true,title:' '" style="width: 600px; padding: 10px;"></div>
</body>
</html>