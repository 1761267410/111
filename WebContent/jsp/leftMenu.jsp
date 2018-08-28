<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>leftMenu</title>
</head>
<body>
	<div id="menu" class="easyui-accordion" data-options="fit:true">     
                <div title="用户管理" data-options="iconCls:'icon-save'">     
                    <ul>  
                        <li><a onclick="loadCenterTab('详细信息','jsp/user/userData.jsp')">用户信息</a>  
                    </ul>  
                </div>     
                <div title="请假管理" data-options="iconCls:'icon-reload'">  
                    <ul>                        
                    	 <li><a onclick="loadCenterTab('请假表信息','jsp/sheet/sheetData.jsp')">详细信息</a>                        
                        <li><a onclick="loadCenterTab('请假流信息','jsp/flow/currentFlow.jsp')">请假信息</a>  
                        <!-- <ul id="leftTreeMenu" class="easyui-tree" data-options="url:'data/treeMenu.json'"></ul>   -->
                    </ul>  
                </div>
                <div title="角色资源管理" data-options="iconCls:'icon-undo'">     
                    <ul>  
                        <li><a onclick="loadCenterTab('角色表信息','jsp/role/roleData.jsp')">角色信息</a>  
                    </ul>  
                </div>
                <div title="班级信息管理" data-options="iconCls:'icon-print'">     
                    <ul>  
                        <li><a onclick="loadCenterTab('班级表信息','jsp/class/classData.jsp')">班级信息</a>  
                    </ul>  
                </div>     
				<div title="系院信息管理" data-options="iconCls:'icon-print'">     
                    <ul>  
                        <li><a onclick="loadCenterTab('系院表信息','jsp/dep/depData.jsp')">系院信息</a>  
                    </ul>  
                </div>  
            </div>
            
</body>
</html>