<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>用户信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/layui.css" media="all">
<link rel="stylesheet"
	href="../../css/modules/laydate/default/laydate.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/toastr.css">
<script src="<%=request.getContextPath() %>/js/jquery.js"
	charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/js/layui.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="../../css/toastr.css">
<script src="<%=request.getContextPath() %>/js/lay/modules/laydate.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/toastr.min.js" charset="utf-8"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
   form = layui.form;
   layer = layui.layer;
   layedit = layui.layedit;
   laydate = layui.laydate;
  
  //开始时间
  laydate.render({
    elem: '#birthday'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  
})

function subInfo(){
	 var dataJson = {uid:$("#uid").val(),tele:$("#tele").val(),sex:$("#sex").val(),name:$("#name").val(),birthday:$("#birthday").val(),email:$("#email").val()}
     $.ajax({
         type: "POST",
         url: "<%=request.getContextPath()%>/user/uptUserDetail?date=" + new Date().getDate(),
         dataType: "json",
         data: dataJson,
         success: function(resultJson) {
       	  if (resultJson == 1){
				  toastr.success('提交成功');
				  
			  } else {
				  toastr.error('提交失败');
			  }
         }
       })  
}
</script>

</head>
<body>
	<div class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" lay-verify="required" autocomplete="off"
					class="layui-input" id="name" name="name" value="${user.name}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<input type="radio" name="sex" id="sex" value="男" title="男"${(user.sex == '男')?'checked' : ''}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="sex" id="sex" value="女" title="女"${(user.sex == '女')?'checked' : ''}>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">验证手机</label>
				<div class="layui-input-inline">
					<input type="tel" name="tele" lay-verify="required|phone"
						autocomplete="off" class="layui-input" id="tele"
						value="${user.tele }">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">验证邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="email" lay-verify="email"
						autocomplete="off" class="layui-input" id="email"
						value="${user.email }">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-inline">
					<input type="text" name="birthday" id="birthday" lay-verify="date"
						placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input"
						value="${user.birthday }">
				</div>
			</div>
		</div>
		<input type="hidden" id="uid" name="uid" value="${user.uid}">
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="subInfo()">立即提交</button>
			</div>
		</div>
	</div>
</body>
</html>