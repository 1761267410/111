<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../../css/bootstrap-table.css">
<link rel="stylesheet" type="text/css"
	href="../../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="../../css/bootstrap-select.css.map">
<link rel="stylesheet" type="text/css" href="../../css/toastr.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jslib/easyui/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap-table.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap-select.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/js/layui.js" charset="utf-8"></script>

</head>
<body>
	<div id="myModal">
		<div class="modal-dialog">
			<div class="modal-content" id="sheetContent" style="display:none">
				<div class="modal-body">
					请假类型:&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input type="text" class="form-control"
						name="type" id="type" value="0" readonly="readonly" /><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
					起始时间:&nbsp;&nbsp;<input type="text" class="form-control"
						id="start_dayTxt" readonly="readonly">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
					结束时间:&nbsp;&nbsp;<input type="text" class="form-control"
						id="end_dayTxt" readonly="readonly"><br />
					时长:&nbsp;&nbsp;<input type="text" class="form-control" id="day"
						readonly="readonly"><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
					请假原因:&nbsp;&nbsp;&nbsp;&nbsp;
					<textarea id="reason" class="form-control" readonly="readonly"></textarea>
					<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> </select><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> <input
						type="hidden" id="id"></input> <input type="hidden" id="flowId"></input>
				</div>
				<div>
					<fieldset class="layui-elem-field layui-field-title"
						style="margin-top: 30px;"></fieldset>
					<ul class="layui-timeline" id="elem_ul">
					</ul>
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button"
					onclick="removeSheet()">撤销</button>
					<button class="btn btn-primary" id="submit" type="button"
						onclick="resendSheet()" style="display:none">重新请假</button>
				</div>
			</div>
			<div id="tipContent">
				<p>当前无请假</p>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var seeDetail  = seeDetail();

function resendSheet(){
	var data = {id:$("#id").val(),flowId:$("#flowId").val()}
	$.ajax({
		type:"POST",
		url:"<%=request.getContextPath()%>/sheet/resendSheet?date="+new Date().getDate(),
		dataType:"json",
		data:data,
		success:function(){
			if (resultJson == 1){
                toastr.success('重新申请成功');
                $("#tipContent").show();
			     $("#sheetContent").hide();
            } else {
                toastr.error('重新申请失败');
            }
		}
	})
}

function removeSheet(){
	var data = {id:$("#id").val()}
	$.ajax({
		type:"POST",
		url:"<%=request.getContextPath()%>/sheet/removeSheet?date"+new Date().getDate(),
		dataType:"json",
		data:data,
		success:function(resultJson){  
			if (resultJson == 1){
                toastr.success('撤销成功');
                $("#tipContent").show();
			     $("#sheetContent").hide();
            } else {
                toastr.error('撤销失败');
            }
		}
	})
}

function seeDetail(){
	$.ajax({ type: "POST",
		  url: "<%=request.getContextPath()%>/sheet/entrySheet?date="+ new Date().getDate(),
			dataType : "json",
			success : function(sheet) {
				 if(sheet != null && !sheet.isEmpty){
					     $("#tipContent").hide();
					     $("#sheetContent").show();
						 $("#type").val(sheet.type);
						 $("#start_dayTxt").val(sheet.start_day);
						 $("#end_dayTxt").val(sheet.end_day);
						 $("#day").val(sheet.day);
						 $("#reason").val(sheet.reason);
						 $("#id").val(sheet.id);
						 $("#flowId").val(sheet.flowId);
						 if(sheet.progress==2)
							 $("#submit").show();
			        $.ajax({
			  		  type: "POST",
			  		  url: "<%=request.getContextPath()%>/sheet/entryNodes?date="+ new Date().getDate(),
			  					dataType : "json",
			  					success : function(resultJson) {
			  						for (i = 0; i < resultJson.length; i++) {
			  							var elem_li = document.createElement('li');
			  							var statusName = resultJson[i].statusName;
			  							var status;
			  							switch (statusName) {
			  							case 0:
			  								status = "正在审核";
			  								break;
			  							case 1:
			  								status = "通过";
			  								break;
			  							case 2:
			  								status = "驳回";
			  								break;
			  							}
			  							elem_li
			  									.setAttribute("class",
			  											"layui-timeline-item");
			  							elem_li.innerHTML = '<div class="layui-timeline-content layui-text">'
			  									+ '<h3 class="layui-timeline-title">'
			  									+ resultJson[i].created_time
			  									+ '</h3>'
			  									+ '<p>'
			  									+ resultJson[i].nodeName
			  									+ '<br/>'
			  									+ "审理情况："
			  									+ status
			  									+ '<br/>'
			  									+ '</p>'
			  									+ '</div>'
			  							document.getElementById("elem_ul").appendChild(
			  									elem_li);
			  						}
			  					}
			  				})	
			} 
			}
		})
	
}
</script>
</html>
