<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>请假信息</title>
</head>
<body>
<table id="sheet_dg" title="请假信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="http://localhost:8080/flow-main/sheet/sheetList" fit="true" toolbar="#sheet_tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="flowId" hidden="true"></th>
				<th field="id" width="100" align="center">表Id</th>
				<th field="uid" width="100" align="center">用户Id</th>
				<th field="name" width="50" align="center">姓名</th>
				<th field="type" width="100" align="center">请假类型</th>
				<th field="progress" width="100" align="center">审核进度</th>
				<th field="tele" width="100" align="center">电话</th>
				<th field="reason" width="200" align="center">原因</th>
				<th field="start_day" width="100" align="center">开始时间</th>
				<th field="end_day" width="100" align="center">结束时间</th>
				<th field="day" width="100" align="center">共/日</th>
				
			</tr>
		</thead>
	</table>
	
	<div id="sheet_tb">
	<br>
		<div>&nbsp;用户id：&nbsp;<input type="text" name="sh_uid" id="sh_uid" size="10"/>
		&nbsp;姓名：&nbsp;<input type="text" name="sh_name" id="sh_name" size="10"/>
		&nbsp;事由：&nbsp;<input type="text" name="sh_reason" id="sh_reason" size="10"/>
		&nbsp;请假时间：&nbsp;<input class="easyui-datebox" name="sh_start" id="sh_start" editable="false" size="10"/>
		-><input class="easyui-datebox" name="sh_end" id="sh_end" editable="false" size="10"/>
		</div>
		<div>
			<a href="javascript:searchSheet()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:openSheetAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openSheetModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteSheet()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
		</div>
	</div>
	<!-- 请假条 -->
	<div id="sheet_dlg" class="easyui-dialog" style="width: 620px;height: 400px;padding: 10px 20px"
		closed="true" buttons="#sheet_dlg-buttons">
		<form id="sheet_fm" name="sheet_fm" method="post">
			<table cellspacing="5px;" border="0">
				<center><h3>请假条</h3></center>
					<input type="hidden" name="id" id="id"/>
				<tr>
					<td>用户id：</td>
					<td><input type="text" name="uid" id="uid" class="easyui-validatebox" required="true"/></td>
					<td>姓名：</td>
					<td><input type="text" name="name" id="name" class="easyui-validatebox" required="true"/></td>
					<td></td>
				</tr>
				<tr>
					<td>请假类型：</td>
					<td><select class="easyui-combobox" id="type" name="type" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="病假">病假</option>
						<option value="事假">事假</option>
					</select></td>	
					
					<td>联系电话：</td>
					<td><input type="text" name="tele" id="tele" class="easyui-validatebox" data-options="validType:'Mobile'" required="true"/></td>		
					<td></td>
				</tr>
				<tr>
					<td>请假时间</td>
					<td><input class="easyui-datebox" name="start_day" id="start_day" required="true" editable="false" /></td>
					<td>到</td>
					<td><input class="easyui-datebox" name="end_day" id="end_day" required="true" editable="false" data-options="validType:'DateValidator[\'#start_day\']'"/></td>
				</tr>
				<tr>
					<td>审核进度：</td>
					<td><select class="easyui-combobox" id="progress" name="progress" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="0">等待审核</option>
					    <option value="1">通过审核</option>
						<option value="2">审核不通过</option>
					</select></td>
				</tr>
				<tr>
					<td valign="top">理由：</td>
					<td colspan="3"><textarea rows="4" cols="46" name="reason" id="reason"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="sheet_dlg-buttons">
		<a href="javascript:saveSheet()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeSheetDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
<script type="text/javascript" src="js/sheetdata.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>