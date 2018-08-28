var url;

function saveDep(){
	var depid = $("#depid").val();
	var depname = $("#depname").val();
	var depother = $("#depother").val();
	
	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/dep/depSave",

		data : "&"+"depid=" + depid +"&"+"depname=" + depname + "&"+"depother=" + depother,
		
		dataType : "json",

		success : function(data) {
			if(data.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				$("#dep_dlg").dialog("close");
				$('#dep_dg').datagrid("reload");
			}
		}
		
	});
}

function deleteDep(){
	var selectedRows=$("#dep_dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].depid);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("http://localhost:8080/flow-main/dep/depDel",{ids:ids},function(result){
				$.messager.alert("系统提示","您已成功删除<font color=red>"+selectedRows.length+"</font>条数据！");
				$("#dep_dg").datagrid("reload");
				var json = JSON.parse(result);
				if(json.success=="true"){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
					$("#dep_dg").datagrid("reload");
				}else{
					$.messager.alert('系统提示',"删除失败");
				}
				
			},"json");
		} 
	});
}

function searchDep(){
		
	var dep_id = $("#dep_id").val();
	var dep_name = $("#dep_name").val();

	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/dep/depSearch",

		data : "&dep_id=" + dep_id + "&dep_name=" + dep_name,
		
		dataType : "json",

		success : function(data) {
				$('#dep_dg').datagrid("loadData", data);
		}
	})
}	

function openDepAddDialog(){
	$("#dep_dlg").dialog("open").dialog("setTitle","添加系院");
	$("#dep_fm").form("clear");
	$("#dep_dg").datagrid("reload");
}

function openDepModifyDialog(){
	var selectedRows=$("#dep_dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dep_dlg").dialog("open").dialog("setTitle","编辑系院");
	$("#dep_fm").form("load",row);
}

function resetValue(){
	$("#dep_dg").datagrid("reload");
}

function closeDepDialog(){
	$("#dep_dlg").dialog("close");
}