<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>角色信息</title>
</head>
<body>
<table id="role_dg" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="http://localhost:8080/flow-main/role/roleList" fit="true" toolbar="#role_tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="role_id" width="100" align="center">角色编号</th>
				<th field="role_name" width="150" align="center">角色名</th>
				<th field="role_remark" width="150" align="center">角色备注</th>
			</tr>
		</thead>
</table>
<form method="post" >
	<div id="role_tb">
		<br/>
		<div>&nbsp;角色编号：&nbsp;<input type="text" name="roleId" id="role_id" size="10"/>
		&nbsp;角色名：&nbsp;<input type="text" name="roleName" id="role_name" size="10"/>	    
		</div>
		<div>
			<a href="javascript:searchRole()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:openRoleAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openRoleModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteRole()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
		</div>
</div>
</form>
<div id="role_dlg" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px" 
	closed="true" buttons="#dlg-buttons-role">
		<form id="role_fm" method="post">
			<table cellspacing="5px;">
				<tr>
		    		<td align="right" width="20%">角色编码：</td>
		    		<td width="80%"><input type="text" name="roleid" id="roleid" style="width:300px;"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right">角色名称：</td>
		    		<td><input type="text" name="rolename" id="rolename" style="width:300px;"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right">角色备注：</td>
		    		<td><input type="text" name="roleremark" id="roleremark" style="width:300px;"/></td>
		    	</tr> 
		    	<tr>
		    		<td align="right">角色菜单权限：</td>
		    		<td>
		    			<div id="tree_div" style="height: 250px;overflow-y: scroll;"></div>
		    		</td>
		    	</tr> 
		    	<tr style="display: none;">
		    		<td align="right">隐藏域：</td>
		    		<td>
		    			<input type="text" name="check_menu_id" id="check_menu_id"/>
		    		</td>
		    	</tr>    	    	
			</table>
		</form>
		<div id="dlg-buttons-role">
		<a href="javascript:saveRole()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeRoleDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</div>
<script type="text/javascript" src="js/roledata.js"></script>
</body>
</html>