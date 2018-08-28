<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.dfrz.bean.po.UserPO" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>欢迎使用请假管理系统</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/layui.css">
</head>
<body class="layui-layout-body">
	<% UserPO user = (UserPO)request.getSession().getAttribute("user"); %>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">请假管理系统</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img">
						${user.name} <inpute type="hidden" name="rid" id="rid"
							value="${user.rid}"></a>
					<dl class="layui-nav-child">
						<dd>
							<a
								href="<%=request.getContextPath() %>/jsp/user/password_change.jsp "
								target="center">修改密码</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="<%=request.getContextPath()%>/jsp/user/user_info.jsp"
						target="center">用户信息</a> <!-- <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl> --></li>
					<li class="layui-nav-item"><a>请假管理</a>
						<dl class="layui-nav-child" id="LeaveMenu">
							<%if("1".equals(user.getRid())){ %>
							<dd>
								<a
									href="<%=request.getContextPath() %>/jsp/sheet/LeaveApply1.jsp"
									target="center">申请请假</a>
							</dd>
							<dd>
								<a
									href="<%=request.getContextPath()%>/jsp/sheet/LeaveSchedule.jsp"
									target="center">请假情况查询</a>
							</dd>
							<dd>
								<a
									href="<%=request.getContextPath()%>/jsp/sheet/sheetHistory.jsp"
									target="center">请假历史</a>
							</dd>
							<%}else{ %>
							<dd>
								<a
									href="<%=request.getContextPath() %>/jsp/sheet/LeaveApproval.jsp"
									target="center">请假审核</a>
							</dd>
							<%} %>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px; height: 100%;">
				<iframe id="center" name="center" style="overflow: visible;"
					scrolling="auto" frameborder="no" width="100%" height="100%"
					src="<%=request.getContextPath() %>/jsp/sheet/LeaveApply1.jsp"></iframe>
				<dd>
					<a href="<%=request.getContextPath()%>/jsp/sheet/LeaveSchedule.jsp"
						target="center">请假情况查询</a>
				</dd>
				<dd>
					<a href="<%=request.getContextPath()%>/jsp/sheet/sheetHistory(3).jsp"
						target="center">请假历史</a>
				</dd>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域
		</div>
	</div>

<script src="<%=request.getContextPath() %>/js/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
	var element = layui.element;
  
});

// window.onload=function(){ 
// 	alert(123);
// 	var rid = document.getElementById("rid").value;
// 	var LeaveMenu = document.getElementById("#LeaveMenu");
// 	if(rid==1){
<%-- 		LeaveMenu.innerHTML='<dd><a href="<%=request.getContextPath() %>/jsp/sheet/LeaveApply1.jsp" target="center">申请请假</a></dd>' --%>
<%--     	+'<dd><a href="<%=request.getContextPath()%>/jsp/sheet/LeaveSchedule.jsp" target="center">请假情况查询</a></dd>' --%>
<%--     	+'<dd><a href="<%=request.getContextPath()%>/jsp/sheet/sheetHistory.jsp" target="center">请假历史</a></dd>' --%>
// 	}else
<%-- 		LeaveMenu.innerHTML='<dd><a href="<%=request.getContextPath() %>/jsp/sheet/LeaveApproval.jsp" target="center">请假审核</a></dd>' --%>
// 	}
</script>
</body>
</html>