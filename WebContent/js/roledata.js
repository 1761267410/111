var url;

function saveRole(){
	var role_id = $("#roleid").val();
	var role_name = $("#rolename").val();
	var role_remark = $("#roleremark").val();
/*	var tree_div = $("#tree_div").val();
	var check_menu_id = $("#check_menu_id").val();*/
	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/role/roleSave",

		data : "&"+"role_id=" + role_id +"&"+"role_name=" + role_name + "&"+"role_remark=" + role_remark,
				/*+"&"+"tree_div=" + tree_div + "&"+"check_menu_id=" + check_menu_id*/
					
		dataType : "json",

		success : function(data) {
			if(data.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				$("#role_dlg").dialog("close");
				$('#role_dg').datagrid("loadData");
			}
		}
		
	});
}

function deleteRole(){
	var selectedRows=$("#role_dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].role_id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.messager.show({
					title:"系统提示",
					msg:"删除成功",
					timeout:2000,
					showType:'slide'
				});
			$.post("http://localhost:8080/flow-main/role/roleDel",{ids:ids},function(result){
				var json = JSON.parse(result);
				$.messager.alert('系统提示',json);
				if(json.success=="true"){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
					$("#role_dg").datagrid("reload");
				}else{
					$.messager.alert('系统提示',"删除失败");
				}
				
			},"json");
		} 
	});
}

function searchRole(){
	var roleId = $("#roleId").val();
	var roleName = $("#roleName").val();	
	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/role/roleSearch",


		data : "&roleId=" + roleId + "&roleName=" + roleName,
		dataType : "json",

		success : function(data) {

				$('#role_dg').datagrid("loadData", data);
		}
	})
}	

function openRoleAddDialog(){
	$("#role_dlg").dialog("open").dialog("setTitle","添加角色");
	$("#role_fm").form("clear");
	$("#role_dg").datagrid("reload");
}

function openRoleModifyDialog(){
	var selectedRows=$("#role_dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#role_dlg").dialog("open").dialog("setTitle","编辑角色");
	$("#role_fm").form("load",row);
}

function resetValue(){
	$("#role_dg").datagrid("reload");
}

function closeRoleDialog(){
	$("#role_dlg").dialog("close");
}