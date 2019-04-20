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
<script type="text/javascript">
	$(function() {
		$('#name').validatebox({
			required : true,
			validType : 'repeat[64,"lesson","name"]',
			invalidMessage : '不超过64个字,不能重复'
		});
		
		/* $('#tprice').validatebox({
			required : true,
			validType : 'digits',
			invalidMessage : '只能输入数字'
		}); */
		
		$('#tprice').numberbox({
			required : true,
		    min:0,
		    max:1000,
		    precision:0
		});
		$('#bprice').numberbox({
			required : true,
		    min:0,
		    max:1000,
		    precision:0
		});
		/* $('#bprice').validatebox({
			required : true,
			validType : 'digits',
			invalidMessage : '只能输入数字'
		}); */

		$('#selectWindow').panel('resize', {
			width : $(document).width() * 0.7
		});
		$('body').layout('resize');

		openSub('price');
	});

	function ok() {
		$.messager.progress();
		$('#lesson_form').form('submit', {
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
	function openSub(key) {
		var id = $("#id").val();
		$('#selectWindow').html(
				'<iframe id="select_iframe" src="/seed/' + key + '?lesson_fid='
						+ id + '" width="100%" height="100%"></iframe>');
		$('#selectWindow').panel('setTitle', 'edit ' + key);
	}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<form id="lesson_form" action="/seed/lesson/update" method="post">
			<input type="hidden" id="id" name="id" value="${id}">
			<table>
				<tr>
					<th>名称:</th>
					<td><input type="text" id="name" name="name" value="${name}"
						maxlength="64"></td>
				</tr>
				<tr>
					<th>科目:</th>
					<td>
						<select id="subject" name="subject">
							<option value="${subject}">${subject}</option>
							<option value="数学">数学</option>
							<option value="物理">物理</option>
							<option value="化学">化学</option>
							<option value="英语">英语</option>
							<option value="语文">语文</option>
							<option value="地理">地理</option>
							<option value="生物">生物</option>
							<option value="历史">历史</option>
							<option value="政治">政治</option>
						</select>
						</td>
				</tr>
				<tr>
					<th>年级:</th>
					<td><select id="grade" name="grade">
							<option value="${grade}">${grade}</option>
							<option value="高三">高三</option>
							<option value="高二">高二</option>
							<option value="高一">高一</option>
							<option value="初三">初三</option>
							<option value="初二">初二</option>
							<option value="初一">初一</option>
					</select></td>
				</tr>
				<tr>
					<th>老师价格:</th>
					<td><input type="text" id="tprice" name="tprice"
						value="${tprice}" maxlength="6" size="6"></td>
				</tr>
				<tr>
					<th>增量价格:</th>
					<td><input type="text" id="bprice" name="bprice"
						value="${bprice}" maxlength="6" size="6"></td>
				</tr>
				<tr>
					<th>创建时间:</th>
					<td><input type="hidden" id="createTime" name="createTime"
						value="${createTime}" maxlength="16">${createTime}</td>
				</tr>

				<tr>
					<th>老师:</th>
					<td><div id="teacher" class="selectOther">
							<c:forEach items="${teacher}" var="obj">
								<div>
									<input type="hidden" name="teacher_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <!-- <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('teacher');"></a> --></td>
				</tr>
				<tr>
					<th>学生:</th>
					<td><div id="student" class="selectOther">
							<c:forEach items="${student}" var="obj">
								<div>
									<input type="hidden" name="student_fid" value="${obj.id}" />${obj.jsonObj.name }</div>
							</c:forEach>
						</div> <!-- <a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="openSelect('student');"></a> --></td>
				</tr>
				<!-- <tr>
					<th colspan="2"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-add',plain:true"
						onclick="openSub('price');">编辑价格</a></th>
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