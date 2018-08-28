<%@page import="net.dfrz.bean.po.UserPO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>	
</head>
<body>
	<div>
		<form method="post" action="<%=request.getContextPath()%>/sheet/sheetApply?date=" + new Date().getDate()">
			<table>
				<tr>
					<td>开始时间:<input type="date"  id="start_day" name="start_day"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 结束时间:&nbsp;&nbsp;
						<input type="date"  id="end_day" name="end_day"/></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="leave" value="0"
						readonly="readonly" />事假&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input
						type="radio" name="type" id="sickLeave" value="1"
						readonly="readonly" />病假 <br /></td>
				</tr>
				<tr>
					<td>请假原因<textarea id="reason" name="reason" rows="5" cols="20"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="提交"/>
						<input type="reset" value="重置"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>