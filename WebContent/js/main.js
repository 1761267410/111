$(function(){
	//加载左侧的树形菜单
	loadLeftMenu();


	//增加树形菜单的点击事件
	loadTreeMenuClick();

});

var loadTreeMenuClick = function(){
	$('#leftTreeMenu').tree({
		onClick: function(node){
			//alert(node.text);  // 在用户点击的时候提示
			loadCenterTab(node.text,'jsp/center.jsp');
		}
	});
};
var loadLeftMenu = function(){

};
var loadCenterTab = function(title,url){
	var tab=$('#centerTab').tabs('exists',title);
	if(tab) {  
		$("#centerTab").tabs("select", title);  
		var selTab = $('#centerTab').tabs('getSelected');
		$('#centerTab').tabs('update', {
		    tab: selTab,
		    options: {
		        title: title,
		        href: url  
		    }
		});
	} else { 
		$('#centerTab').tabs('add',{    
			title:title,    
			//content:'我是tab',    
			href:url,
			closable:true,    
			tools:[{    
				iconCls:'icon-mini-refresh',    
				handler:function(){    
					alert('refresh');    
				}    
			}]    
		});  
	}
};

