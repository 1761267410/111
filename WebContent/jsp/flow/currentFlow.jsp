<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jslib/datagrid-detailview.js"></script>

<div id="class_tb">
	<div>
		<a href="javascript:editflow()" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a><a
			href="javascript:saveflow()" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存</a> <a
			href="javascript:cancelflow()" class="easyui-linkbutton"
			iconCls="icon-cancel" plain="true">撤销</a>
	</div>
	<div>
		<form method="post"
			action="http://localhost:8080/flow-main/flows/bycondition"
			enctype="multipart/form-data" class="pageForm required-validate"
			onsubmit="return iframeCallback(this, dialogAjaxDone);">

			&nbsp;ID：&nbsp;<input type="text" name="flowId" id="flowId" size="10" />
			&nbsp;创建者：&nbsp;<input type="text" name="creater" id="creater"
				size="10" /> &nbsp;创建时间&nbsp;<input class="easyui-datebox"
				name="creater_time" id="creater_time" editable="false" size="10" />
			<a href="javascript:FindData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'">查询</a>
		</form>
	</div>
</div>
<table id="dg" class="easyui-datagrid"
	url='http://localhost:8080/flow-main/flows/findAll' fitColumns="true"
	fit="true" pagination=true pagination=true title="流程查询"
	rownumbers="true" toolbar="#class_tb">
	<thead>
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'flowId',width:100" hidden="true">流程主键</th>
			<th data-options="field:'flowName',width:100" editor="text">流程名</th>
			<th data-options="field:'creater',width:100" editor="text">创建者</th>
			<th data-options="field:'currentUser',width:100" editor="text">流程位置</th>
			<th data-options="field:'creater_time',width:200" editor="datebox">创建时间</th>
			<th
				data-options="field:'flow_status',width:100,
				formatter:function(value,row,index){
					if(value==0)
						return '未启用';
					else
						return '启用';
						}"
				editor="numberbox">是否启用</th>
		</tr>
	</thead>
</table>
<script type="text/javascript" src="js/flow.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
