var url;

function roleformatter(value,row,index){
	if(value==0)
		return '系统管理员';
	else if(value==1)
		return '学生';
	else if(value==2)
		return '班主任';
	else if(value==3)
		return '系主任'
}

function sexformatter(value,row,index){
	if(value==0)
		return '女';
	else
		return '男';
}

function saveUser(){

	var uid = $("#uid").val();
	var name = $("#name").val();
	var password = $("#password").val();
	var tele = $("#tele").val();
	var sex = $("#sex").val();
	var birthday = $("#birthday").val();
	var email = $("#email").val();
	var other = $("#other").val();
	var classid = $("#classid").val();
	var depid = $("#depid").val();
	var rid = $("#rid").val();
	
	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/user/userSave",

		data : "&"+"uid=" + uid + "&"+"name=" + name +"&"+"password=" + password + "&"+"tele=" + tele
		+ "&"+"sex=" + sex + "&"+"birthday=" + birthday + "&"+"other=" + other
		+ "&"+"email=" + email+"&"+"rid=" + rid+ "&"+"classid=" + classid
		+ "&"+"depid=" + depid,
		dataType : "json",

		success : function(data) {
			if(data.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功");
				$("#user_dlg").dialog("close");
				$('#user_dg').datagrid("reload");
			}
		}

	})  

}

function deleteUser(){
	var selectedRows=$("#user_dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].uid);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("http://localhost:8080/flow-main/user/userDel",{ids:ids},function(result){
				$.messager.alert("系统提示","您已成功删除<font color=red>"+selectedRows.length+"</font>条数据！");
				$('#user_dg').datagrid("reload");
				var jsonData = JSON.parse(result);
				if(jsonData.success==true){
					$.messager.alert("系统提示","您已成功删除<font color=red>"+result.selectedRows.length+"</font>条数据！");
				}else{
					$.messager.alert('系统提示',JsonData.errorMsg);
				}
			},"json");
		} else {  
			return ;  
		}  
	});

}

function searchUser(){

	var userId = $("#userId").val();
	var userName = $("#userName").val();
	var roleid = $("#roleid").val();
	var s_birthday = $("#s_birthday").val();
	var e_birthday = $("#e_birthday").val();
	$.ajax({

		type : "POST",

		url : "http://localhost:8080/flow-main/user/userSearch",


		data : "&"+"userId=" + userId + "&"+"userName=" + userName
		+ "&"+"roleid=" + roleid + "&"+"s_birthday=" + s_birthday
		+ "&"+"e_birthday=" + e_birthday,
		dataType : "json",

		success : function(data) {
			$('#user_dg').datagrid("loadData", data);
		}
	})
}

function openUserAddDialog(){
	$("#user_dlg").dialog("open").dialog("setTitle","添加用户信息");
	$("#user_fm").form("clear");
	$("#user_dg").datagrid("reload");
}

function openUserModifyDialog(){
	var selectedRows=$("#user_dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}

	var row=selectedRows[0];
	$("#user_dlg").dialog("open").dialog("setTitle","编辑用户信息");
	$("#user_fm").form("load",row);

}

function resetValue(){
	$("#user_dg").datagrid("reload");
}

function closeUserDialog(){
	$("#user_dlg").dialog("close");
	$('#user_dg').datagrid("reload");
}
