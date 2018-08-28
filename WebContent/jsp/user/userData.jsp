<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户信息</title>
</head>
<body>
<table id="user_dg" class="easyui-datagrid" fitColumns="true"
	pagination="true" rownumbers="true"
	url="http://localhost:8080/flow-main/user/userList" fit="true"
	toolbar="#user_tb">
	<thead>
		<tr>
			<th field="cb" checkbox="true"></th>
			<th field="uid" width="120" align="center">编号</th>
			<th field="name" width="100" align="center">姓名</th>
			<th field="password" width="100" align="center">密码</th>
			<th field="sex" width="50" align="center">性别</th>
			<th field="birthday" width="120" align="center">出生日期</th>
			<th field="tele" width="150" align="center">电话</th>
			<th field="email" width="150" align="center">邮箱地址</th>
			<th field="rid" width="100" align="center" formatter="roleformatter">角色名称</th>
			<th field="classid" width="100" align="center">班级编号</th>
			<th field="depid" width="100" align="center">系院编号</th>
			<!-- <th field="classid" width="100" align="center" hidden="true">班级ID</th>
				<th field="classname" width="100" align="center">班级名称</th> -->
			<th field="other" width="100" align="center">备注</th>
		</tr>
	</thead>
</table>
<form method="post">
	<div id="user_tb">	
		<br />
		<div>
			&nbsp;编号：&nbsp;<input type="text" name="userId" id="userId" size="10" />
			&nbsp;姓名：&nbsp;<input type="text" name="userName" id="userName"size="10" /> 
			&nbsp;角色名称：&nbsp;<input class="easyui-combobox" id="roleid" name="roleid"
					data-options="panelHeight:'auto',
					editable:false,valueField:'role_id',textField:'role_name',url:'http://localhost:8080/flow-main/role/roleList'
					" />
			&nbsp;出生日期：&nbsp;<input class="easyui-datebox" name="s_birthday"
				id="s_birthday" editable="false" size="10" /> -><input
				class="easyui-datebox" name="d_birthday" id="d_birthday"
				editable="false" size="10" />
		</div>
		<div>
			<a href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a> <a
				href="javascript:openUserAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteUser()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a> <a
				href="javascript:resetValue()" class="easyui-linkbutton"
				iconCls="icon-reload" plain="true">刷新</a>
		</div>

	</div>
</form>
<div id="user_dlg" class="easyui-dialog"
	style="width: 600px; height: 350px; padding: 10px 20px" closed="true"
	buttons="#dlg-buttons-user">
	<form id="user_fm" method="post">
		<table cellspacing="5px;">
			<tr>
				<td>编号：</td>
				<td><input type="text" name="uid" id="uid"
					class="easyui-validatebox" 
					data-options="required:true,missingMessage:'必填项',validType:'IDValidator[\'#uid\']'" /></td>
				<td>姓名：</td>
				<td><input type="text" name="name" id="name"
					class="easyui-validatebox" data-options="required:true,missingMessage:'必填项'" /></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="text" name="password" id="password"
					class="easyui-validatebox" 
					data-options="required:true,missingMessage:'必填项',validType:'PasswordValidator[\'#password\']'" /></td>
				<td>电话：</td>
				<td><input type="text" name="tele" id="tele"
					class="easyui-validatebox" 
					data-options="required:false,missingMessage:'必填项',validType:'Mobile[\'#tele\']'"  /></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><select class="easyui-combobox" id="sex" name="sex"
					editable="false" panelHeight="auto">
						<option>请选择。。</option>
						<option value="男">男</option>
						<option value="女">女</option>
				</select></td>
				<td>出生日期：</td>
				<td><input class="easyui-datebox" name="birthday" id="birthday"
					 editable="false" /></td>
			</tr>
			<tr>
				<td>角色名称：</td>
				<td><input class="easyui-combobox" id="rid" name="rid"
					data-options="panelHeight:'auto',
					editable:false,valueField:'role_id',textField:'role_name',url:'http://localhost:8080/flow-main/role/roleList'
					" /></td>
				<td>系院名称：</td>
				<td><input class="easyui-combobox" id="depid" name="depid"
					data-options="panelHeight:'auto',
					editable:false,valueField:'depid',textField:'depname',url:'http://localhost:8080/flow-main/dep/depList2',
					onSelect:function(rec){
						var url = 'http://localhost:8080/flow-main/class/changeClass?depid='+rec.depid;
						$('#classid').combobox('reload',url);
					}" /></td>
			</tr>
			<tr>
				<td>班级名称：</td>
				<td><input class="easyui-combobox" id="classid" name="classid"
					data-options="panelHeight:'auto',
					editable:false,valueField:'classid',textField:'classname'" /></td>
				<td>邮箱：</td>
				<td><input type="text" name="email" id="email"
					class="easyui-validatebox" 
					data-options="required:true,missingMessage:'必填项',validType:'Email[\'#email\']'"/></td>
			</tr>
			<tr>
				<td valign="top">备注：</td>
				<td colspan="4"><textarea rows="7" cols="57" name="other"
						id="other"></textarea></td>
			</tr>
		</table>
	</form>
	<div id="dlg-buttons-user">
		<a href="javascript:saveUser()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</div>
<script type="text/javascript" src="js/userdata.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>
