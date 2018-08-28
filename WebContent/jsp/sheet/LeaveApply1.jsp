<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>申请请假</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/layui.css" media="all">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/modules/laydate/default/laydate.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/toastr.css">
<script src="<%=request.getContextPath() %>/js/layui.js" charset="utf-8"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/toastr.min.js" charset="utf-8"></script>
<script>


layui.use(['form', 'layedit', 'laydate'], function(){
	var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //开始时间
  laydate.render({
    elem: '#start_day'
  });
  laydate.render({
    elem: '#end_day'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
});

function getDate(date){
	 var dates = date.split("-");
	 var dateReturn = '';
	 
	 for(var i=0; i<dates.length; i++){
	  dateReturn+=dates[i];
	 }
	 return dateReturn;
	}

//监听提交
function submitFrom(){
	 var end_day = $("#end_day").val();
	 var start_day = $("#start_day").val();
	 var now_day = new Date();
	 if(start_day==''||end_day==""){
		 toastr.error("日期不能为空");
		 return false;
	 }
	 
	 if((getDate(start_day)-getDate(end_day)>0)){
		 toastr.error("结束时间不能小于开始时间");
	     return false;
	 }
	  var dataJson ={start_day:start_day,end_day:end_day,type:$("#type").val(),reason:$("#reason").val()}
	  var data = JSON.stringify(dataJson);
	  $.post("http://localhost:8080/flow-main/sheet/sheetApply?date="+new Date().getDate(),dataJson,
			  function(resultJson){  
			if (resultJson == 1){
                toastr.success('提交成功');
            } else {
                toastr.error('提交失败');
            }
		},'json'); 
      }

</script>

</head>
<body>
	<div class="layui-form">
		<div class="layui-inline">
			<label class="layui-form-label">开始日期</label>
			<div class="layui-input-inline">
				<input type="text" name="start_day" id="start_day" lay-verify="date"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">结束日期</label>
			<div class="layui-input-inline">
				<input type="text" name="end_day" id="end_day" lay-verify="date"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">请假类型</label>
			<div class="layui-input-block">
				<input type="radio" name="type" value="事假" title="事假" checked=""
					id="type"> <input type="radio" name="type" value="病假"
					title="病假" id="type">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">请假原因</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入请假原因" class="layui-textarea" id="reason"
					name="reason" lay-verify="required"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="submitFrom()">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
		</div>
</body>
</html>