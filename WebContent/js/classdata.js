var url;

function saveClass(){
	var classid = $("#classid").val();
	var classname = $("#classname").val();
	var classother = $("#classother").val();
	var depid = $("#depid").val();
	
	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/class/classSave",

		data : "&"+"classid=" + classid +"&"+"classname=" + classname + "&"+"classother=" + classother
				+ "&"+"depid=" + depid,
		
		dataType : "json",

		success : function(data) {
			if(data.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				$("#class_dlg").dialog("close");
				$('#class_dg').datagrid("reload");
			}
		}
		
	});
}

function deleteClass(){
	var selectedRows=$("#class_dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].classid);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("http://localhost:8080/flow-main/class/classDel",{ids:ids},function(result){
				$.messager.alert("系统提示","您已成功删除<font color=red>"+selectedRows.length+"</font>条数据！");
				$("#class_dg").datagrid("reload");
				var json = JSON.parse(result);
				$.messager.alert('系统提示',json);
				if(json.success=="true"){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+selectedRows.length+"</font>条数据！");
					$("#class_dg").datagrid("reload");
				}else{
					$.messager.alert('系统提示',"删除失败");
				}
				
			},"json");
		} 
	});
}

function searchClass(){
		
	var class_id = $("#class_id").val();
	var class_name = $("#class_name").val();

	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/class/classSearch",

		data : "&class_id=" + class_id + "&class_name=" + class_name,
		
		dataType : "json",

		success : function(data) {
				$('#class_dg').datagrid("loadData", data);
		}
	})
}	

function openClassAddDialog(){
	$("#class_dlg").dialog("open").dialog("setTitle","添加班级");
	$("#class_fm").form("clear");
	$("#class_dg").datagrid("reload");
}

function openClassModifyDialog(){
	var selectedRows=$("#class_dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#class_dlg").dialog("open").dialog("setTitle","编辑班级");
	$("#class_fm").form("load",row);
}

function resetValue(){
	$("#class_dg").datagrid("reload");
}

function closeClassDialog(){
	$("#class_dlg").dialog("close");
}