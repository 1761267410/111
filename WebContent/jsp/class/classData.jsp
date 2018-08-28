<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>班级信息</title>
</head>
<body>
<table id="class_dg" title="班级信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="http://localhost:8080/flow-main/class/classList" fit="true" toolbar="#class_tb1">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="classid" width="100" align="center">班级编号</th>
				<th field="classname" width="100" align="center">班级名称</th>
				<th field="depid" width="100" align="center">系院编号</th>
				<th field="classother" width="200" align="center">班级备注</th>
			</tr>
		</thead>
	</table>
	<div id="class_tb1">
		<br/>
		<div>&nbsp;班级编号：&nbsp;<input type="text" name="class_id" id="class_id" size="10"/>
		&nbsp;班级名称：&nbsp;<input type="text" name="class_name" id="class_name" size="10"/>
		</div>
		<div>
			<a href="javascript:searchClass()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:openClassAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openClassModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteClass()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
		</div>
	</div>
	<div id="class_dlg" class="easyui-dialog" style="width: 520px;height: 320px;padding: 10px 20px"
		closed="true" buttons="#class_dlg-buttons">
		<form id="class_fm" method="post">
		<br/><br/>
			<table cellspacing="5px;" border="0">
				<tr>
		    		<td align="right" width="40%">班级编码：</td>
		    		<td width="60%" align="center"><input type="text" name="classid" id="classid" style="width:200px;"
		    		class="easyui-validatebox" 
					data-options="required:true,missingMessage:'必填项',validType:'IDValidator[\'#classid\']'"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right">班级名称：</td>
		    		<td align="center"><input type="text" name="classname" id="classname" style="width:200px;"
		    		class="easyui-validatebox" 
		    		class="easyui-validatebox" data-options="required:true,missingMessage:'必填项'"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right">系院名称：</td>
		    		<td align="center"><input class="easyui-combobox" id="depid" name="depid" style="width:206px;"data-options="panelHeight:'auto',
					editable:false,valueField:'depid',textField:'depname',url:'http://localhost:8080/flow-main/dep/depList2'"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right">班级备注：</td>
		    		<td align="center"><input type="text" name="classother" id="classother" style="width:200px;"/></td>
		    	</tr> 
			</table>
		</form>
	</div>
	<div id="class_dlg-buttons">
		<a href="javascript:saveClass()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeClassDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
<script type="text/javascript" src="js/classdata.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>