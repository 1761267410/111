<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>请假信息</title>
</head>
<body>
<table id="dep_dg" title="系院信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="http://localhost:8080/flow-main/dep/depList" fit="true" toolbar="#dep_tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="depid" width="100" align="center">系院编号</th>
				<th field="depname" width="100" align="center">系院名称</th>
				<th field="depother" width="200" align="center">系院备注</th>
			</tr>
		</thead>
	</table>
	<div id="dep_tb">
		<br/>
		<div>&nbsp;系院编号：&nbsp;<input type="text" name="dep_id" id="dep_id" size="10"/>
		&nbsp;系院名称：&nbsp;<input type="text" name="dep_name" id="dep_name" size="10"/>
		</div>
		<div>
			<a href="javascript:searchDep()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:openDepAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openDepModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteDep()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
		</div>
	</div>
	<div id="dep_dlg" class="easyui-dialog" style="width: 520px;height: 320px;padding: 10px 20px"
		closed="true" buttons="#dep_dlg-buttons">
		<form id="dep_fm" method="post">
		<br/><br/>
			<table cellspacing="5px;" border="0">
				<tr>
		    		<td align="right" width="40%">系院编码：</td>
		    		<td width="60%" align="center"><input type="text" name="depid" id="depid" style="width:200px;"
		    		class="easyui-validatebox" 
		    		data-options="required:true,missingMessage:'必填项',validType:'IDValidator[\'#depid\']'"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right">系院名称：</td>
		    		<td align="center"><input type="text" name="depname" id="depname" style="width:200px;"
		    		class="easyui-validatebox" 
		    		data-options="required:true,missingMessage:'必填项'"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right">系院备注：</td>
		    		<td align="center"><input type="text" name="depother" id="depother" style="width:200px;"/></td>
		    	</tr> 
			</table>
		</form>
	</div>
	<div id="dep_dlg-buttons">
		<a href="javascript:saveDep()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDepDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	<script type="text/javascript" src="js/depdata.js"></script>
	<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>