var showSub = showSub();
var editing ; //判断用户是否处于编辑状态   
var flag  ;   //判断新增和修改方法 
$('#dg').datagrid({
	fitColumns : true,
	height : 'auto',
	onAfterEdit:function(index , record){  
		var row = $('#dg').datagrid('getSelected');	
		$.post(flag=='add'?'flows/addflow':'flows/uptflow',record , function(result){  
			$('#dg').datagrid('reload');  
			var JsonData = JSON.parse(result);
			if(JsonData.success==true)
				$.messager.show({  
					title:'提示信息',  
					msg:'操作成功!'  
				});
			else
				$.messager.show({
					title:"错误信息",
					msg:JsonData.errorMsg
				});
		},'text'); 
	}, 
});

function FindData() {
	var flowId = $("#flowId").val();
	var creater = $("#creater").val();
	var creater_time = $("#creater_time").val();
	$.ajax({

		type : "GET",

		url : "http://localhost:8080/flow-main/flows/bycondition",

		data : "&flowId=" + flowId + "&creater=" + creater
		+ "&creater_time=" + creater_time,
		dataType : "json",

		success : function(data) {

			$('#dg').datagrid("loadData", data);
		}
	})
}


function newflow() {
	if(editing == undefined){  
		flag = 'add';  
		//1 先取消所有的选中状态  
		$('#dg').datagrid('unselectAll');  
		//2追加一行  
		$('#dg').datagrid('appendRow',{description:''});  
		//3获取当前页的行号  
		editing = $('#dg').datagrid('getRows').length -1;  
		//4选中并开启编辑状态  
		$('#dg').datagrid('selectRow',editing);  
		$('#dg').datagrid('beginEdit', editing);

	}  
}
function editflow() {
	var arr = $('#dg').datagrid('getSelections'); 
	if(arr.length != 1){ 
		$.messager.show({ 
			title:'提示信息', 
			msg:'只能选择一条记录进行修改!'  
		}); 
	} else { 
		if(editing == undefined){ 
			flag = 'edit'; 

			//根据行记录对象获取该行的索引位置 
			editing = $("#dg").datagrid('getRowIndex' , arr[0]); 
			//开启编辑状态 
			$("#dg").datagrid('beginEdit',editing); 
		} 
	} 

}                             

function saveflow() {
	//保存之前进行数据的校验 , 然后结束编辑并师傅编辑状态字段   
	if($('#dg').datagrid('validateRow',editing)){  
		$('#dg').datagrid('endEdit', editing);  
		editing = undefined;
		$('#ddv'+index).datagrid('reload');
	} 
}

function cancelflow(){
//	回滚数据   
	$('#dg').datagrid('rejectChanges');  
	editing = undefined;  	
}


function destroyflow() {
	var arr = $('#dg').datagrid('getSelections');  
	if(arr.length <= 0 ){  
		$.messager.show({  
			title:'提示信息',  
			msg:'请选择进行删除操作!'  
		});                                           
	} else {  
		$.messager.confirm('提示信息' , '确认删除?' , function(r){  
			if(r){  
				var ids = '';  
				for(var i = 0 ; i < arr.length ; i++){  
					ids += arr[i].flowId + ',';  
				}  
				ids = ids.substring(0,ids.length-1);
				$.post('http://localhost:8080/flow-main/flows/delflow' , {ids:ids},function(result){  
					$('#dg').datagrid('reload');
					var JsonData = JSON.parse(result);
					if(JsonData.success==true)
						$.messager.show({  
							title:'提示信息',  
							msg:'操作成功!'  
						});
					else
						$.messager.show({
							title:"错误信息",
							msg:JsonData.errorMsg
						});
				});  

			} else {  
				return ;  
			}  
		});  
	}  
}


function showSub(){
	var editing ; //判断用户是否处于编辑状态   
	var flag  ;   //判断新增和修改方法  
	$('#dg')
	.datagrid(
			{	
				view : detailview,
				detailFormatter : function(index, row) {
					return '<form id="moduleform" method="post"><div style="padding:2px;"><table id="ddv'+index+'"+ class="ddv" style="width:100%;"></table></div></form>';
				},
				onExpandRow : function(index, row) {
					var ddv = $(this).datagrid('getRowDetail', index)
					.find('table.ddv');
					$('#dg').datagrid('selectRow',index); 
					ddv.datagrid({
						url : 'http://localhost:8080/flow-main/node/shownode?flowId='
							+ row.flowId,
							singleSelect : false,
							rownumbers : true,
							fitColumns: false,
							loadMsg : '请稍后。。。',
							height : 'auto',
							toolbar:[  
							         {  
							        	 text:'新增节点',  
							        	 iconCls:'icon-add' ,   
							        	 handler:function(){  
							        		 var arr = $('#dg').datagrid('getSelections'); 
							        		 if(arr.length != 1){ 
							        			 $.messager.show({ 
							        				 title:'提示信息', 
							        				 msg:'不能同时选中两个流程表!'  
							        			 });
							        		 }else{ 
							        			 if(editing == undefined){  
							        				 flag = 'add';  
							        				 //1 先取消所有的选中状态  
							        				 $('#ddv'+index).datagrid('unselectAll');  
							        				 //2追加一行  
							        				 $('#ddv'+index).datagrid('appendRow',{description:''});  
							        				 //3获取当前页的行号  
							        				 editing = $('#ddv'+index).datagrid('getRows').length -1;  
							        				 //4选中并开启编辑状态  
							        				 $('#ddv'+index).datagrid('selectRow',editing);  
							        				 $('#ddv'+index).datagrid('beginEdit', editing);
							        			 }
							        		 }  
							        	 }  
							         } ,{ 
							        	 text:'修改节点', 
							        	 iconCls:'icon-edit' ,  
							        	 handler:function(){ 
							        		 var arr = $('#ddv'+index).datagrid('getSelections'); 
							        		 if(arr.length != 1){ 
							        			 $.messager.show({ 
							        				 title:'提示信息', 
							        				 msg:'只能选择一条记录进行修改!'  
							        			 }); 
							        		 } else { 
							        			 if(editing == undefined){ 
							        				 flag = 'edit'; 

							        				 //根据行记录对象获取该行的索引位置 
							        				 editing = $('#ddv'+index).datagrid('getRowIndex' , arr[0]); 
							        				 //开启编辑状态 
							        				 $('#ddv'+index).datagrid('beginEdit',editing); 
							        			 } 
							        		 } 

							        	 }                                        
							         } ,{  
							        	 text:'删除节点',  
							        	 iconCls:'icon-remove' ,   
							        	 handler:function(){  
							        		 var arr = $('#ddv'+index).datagrid('getSelections');  
							        		 if(arr.length <= 0 ){  
							        			 $.messager.show({  
							        				 title:'提示信息',  
							        				 msg:'请选择进行删除操作!'  
							        			 });                                           
							        		 } else {  
							        			 $.messager.confirm('提示信息' , '确认删除?' , function(r){  
							        				 if(r){  
							        					 var ids = '';  
							        					 for(var i = 0 ; i < arr.length ; i++){  
							        						 ids += arr[i].fnId + ',';  
							        					 }  
							        					 ids = ids.substring(0,ids.length-1);
							        					 $.post('http://localhost:8080/flow-main/node/delnode' , {ids:ids},function(result){  
							        						 $('#ddv'+index).datagrid('reload');
							        						 var JsonData = JSON.parse(result);
							        						 if(JsonData.success==true)
							        							 $.messager.show({  
							        								 title:'提示信息',  
							        								 msg:'操作成功!'  
							        							 });
							        						 else
							        							 $.messager.show({
							        								 title:"错误信息",
							        								 msg:JsonData.errorMsg
							        							 });
							        					 });  

							        				 } else {  
							        					 return ;  
							        				 }  
							        			 });  
							        		 }  
							        	 }  
							         },{  
							        	 text:'保存课程',  
							        	 iconCls:'icon-save' ,   
							        	 handler:function(){  
							        		 //保存之前进行数据的校验 , 然后结束编辑并师傅编辑状态字段   
							        		 if($('#ddv'+index).datagrid('validateRow',editing)){  
							        			 $('#ddv'+index).datagrid('endEdit', editing);  
							        			 editing = undefined;  
							        		 }  
							        	 }  
							         },{  
							        	 text:'取消操作',  
							        	 iconCls:'icon-cancel' ,   
							        	 handler:function(){  
							        		 //回滚数据   
							        		 $('#ddv'+index).datagrid('rejectChanges');  
							        		 editing = undefined;  
							        	 }  
							         }     
							         ] ,  
							         onAfterEdit:function(index , record){  
							        	 var row = $('#dg').datagrid('getSelected');	
							        	 var json = {};
							        	 //合并JSON数据
							        	 json = eval('('+((JSON.stringify({"flowId":row.flowId})+JSON.stringify(record))).replace(/}{/,',')+')');
							        	 $.post(flag=='add'?'node/addnode':'node/uptnode',json , function(result){  
							        		 $('#ddv'+index).datagrid('reload');  
							        		 var JsonData = JSON.parse(result);
							        		 if(JsonData.success==true)
							        			 $.messager.show({  
							        				 title:'提示信息',  
							        				 msg:'操作成功!'  
							        			 });
							        		 else
							        			 $.messager.show({
							        				 title:"错误信息",
							        				 msg:JsonData.errorMsg
							        			 });
							        	 },'text');  
							         },
							         frozenColumns:[[{
							        	 field:'ck',
							        	 checkbox:true
							         },{
							        	 field : 'fnId',
							        	 title : '节点ID',
							        	 hidden : 'true'
							         }, {
							        	 field : 'nodeName',
							        	 title : '节点名',
							        	 width : 100,
							        	 editor :"text"
							         }			           
							         ]],
							         columns : [[
							                     {
							                    	 field : 'nodeSort',
							                    	 title : '节点排序',
							                    	 editor:{  
							                    		 type:'numberspinner' ,   
							                    		 options:{  
							                    			 validType:'Integer',
							                    			 required:true ,   
							                    			 missingMessage:'节点序号必填'
							                    		 }  
							                    	 }  
							                     }, {
							                    	 field : 'creator',
							                    	 title : '创建者',
							                    	 width : 75,
							                    	 editor:'text' 
							                     }, {
							                    	 field : 'created_time',
							                    	 title : '创建时间',
							                    	 width : 100,
							                    	 editor:{  
							                    		 type:'datebox',
							                    		 options:{  
							                    			 required:true ,   
							                    			 missingMessage:'需填写创建时间'
							                    		 }
							                    	 }
							                     },{
							                    	 field : 'currentUser',
							                    	 title : '当前用户',
							                    	 editor:'text'
							                     },{
							                    	 field : 'nextUser',
							                    	 title : '节点流向',
							                    	 editor:'text' 
							                     },{
							                    	 field : 'previousUser',
							                    	 title : '节点流入',
							                    	 editor:'text'
							                     } ] ],
							                     onResize : function() {
							                    	 $('#dg')
							                    	 .datagrid(
							                    			 'fixDetailRowHeight',
							                    			 index);
							                     },
							                     onLoadSuccess : function() {
							                    	 setTimeout(function() {
							                    		 $('#dg').datagrid(
							                    				 'fixDetailRowHeight',
							                    				 index);
							                    	 }, 0);
							                     }
					});
					$('#dg').datagrid('fixDetailRowHeight', index);
				}
			});
}

function myformatter(date){
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	return y+'/'+(m<10?('0'+m):m)+'/'+(d<10?('0'+d):d);
}