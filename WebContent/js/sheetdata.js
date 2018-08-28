var url;
var flag  ;   //判断新增和修改方法 
var id;


function saveSheet(){
	var uid = $("#uid").val();
	var name = $("#name").val();
	var type = $("#type").val();
	var tele = $("#tele").val();
	var end_day = $("#end_day").val();
	var start_day = $("#start_day").val();
	var reason = $("#reason").val();
	var progress = $("#progress").val();
	if(id==undefined)
		id=0;
	$.ajax({

		type : "POST",

		url :(flag=='add'?"sheet/sheetSave":"sheet/sheetUpt"),


		data : "&"+"id="+id+"&"+"uid=" + uid + "&"+"name=" + name +"&"+"type=" + type + "&"+"tele=" + tele
		+ "&"+"start_day=" + start_day + "&"+"end_day=" + end_day + "&"+"reason=" + reason
		+ "&"+"progress=" + progress,
		dataType : "json",

		success : function(data) {
			if(data.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				$("#sheet_dlg").dialog("close");
				$('#sheet_dg').datagrid("reload");
			}
		}

	});
}

function deleteSheet(){
	var selectedRows=$("#sheet_dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].flowId);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("http://localhost:8080/flow-main/sheet/sheetDel",{ids:ids},function(result){
				if(result.success=="true"){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
					$("#sheet_dg").datagrid("reload");
				}else{
					$.messager.alert('系统提示',"删除失败");
				}

			},"json");
		} 
	});
}

function searchSheet(){

	var id = $("#sh_uid").val();
	var name = $("#sh_name").val();
	var reason = $("#sh_reason").val();
	var start_day = $("#sh_start").val();
	var end_day = $("#sh_end").val();
	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/sheet/sheetSearch",


		data : "&id=" + id + "&name=" + name
		+ "&reason=" + reason + "&start_day=" + start_day
		+ "&end_day=" + end_day,
		dataType : "json",

		success : function(data) {

			$('#sheet_dg').datagrid("loadData", data);
		}
	})
}	

function openSheetAddDialog(){
	flag = 'add';
	$("#sheet_dlg").dialog("open").dialog("setTitle","添加假条");
	$("#sheet_fm").form("clear");
	$("#sheet_dg").datagrid("reload");
}

function openSheetModifyDialog(){
	flag = "upt";
	var selectedRows=$("#sheet_dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	id = row.id;
	$("#sheet_dlg").dialog("open").dialog("setTitle","编辑假条");
	$("#sheet_fm").form("load",row);
}

function resetValue(){
	$("#sheet_dg").datagrid("reload");
}

function closeSheetDialog(){
	$("#sheet_dlg").dialog("close");
}