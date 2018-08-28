<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>主页面</title>
	<base href="http://localhost:8080/flow-main/">
	<%@ include file="common/js.jsp"%>
</head>
	<body class="easyui-layout">
		<div data-options="region:'north',title:'',split:false,href:'jsp/common/logo.jsp'"
			style="height: 80px;overflow: hidden;"></div>
		<div data-options="region:'south',title:'',split:false,href:'jsp/common/copyright.jsp'"
			style="height: 60px;"></div>
		<div data-options="region:'west',title:'主菜单',split:true"
			style="width: 200px;" >
<!-- 			导入菜单leftMenu.jsp -->
			 <%@ include file="leftMenu.jsp" %>       
		</div>
		
		<div data-options="region:'center',title:'操作功能区'" style="padding: 0px; background: #eee;">
			<div id="centerTab" class="easyui-tabs" fit="true" border="0"> 
			</div>
		</div>
	</body>
</html>