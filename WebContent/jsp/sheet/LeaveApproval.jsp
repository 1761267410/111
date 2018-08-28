<%@page import="sun.security.jgss.LoginConfigImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../../css/bootstrap-table.css">
<link rel="stylesheet" type="text/css"
    href="../../css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
    href="../../css/bootstrap-select.css.map">
 <link rel="stylesheet" type="text/css"
    href="../../css/toastr.css">
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jslib/easyui/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/bootstrap-table.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/js/bootstrap-select.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/js/toastr.min.js"></script>	
<%-- <script type="text/javascript"
    src="<%=request.getContextPath() %>/js/toastr.js.map"></script> --%>
<script type="text/javascript">
     toastr.options.positionClass = 'toast-top-center'; 
     toastr.options.hideDuration = 300;
     toastr.options.timeOut = 500; 
     $(function(){
    	  //1.初始化Table
    	    var oTable = new TableInit();
    	    oTable.Init();
    	 //2.初始化Button的点击事件
    	    var oButtonInit = new ButtonInit();
    	    oButtonInit.Init();
    	    
    	        
  })
  var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
    	 var columns = [{
             checkbox: true,
             align: 'center' // 居中显示
         },{
             field: 'id',
             title: '假条编号',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         },{
             field: 'name',
             title: '请假人姓名',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         },  {
             field: 'day',
             title: '请假时长',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         }, {
             field: 'start_day',
             title: '开始时间',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         }, {
             field: 'end_day',
             title: '结束时间',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         },{
             field: 'progress',
             title: '进度',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
             formatter: function (value, row, index) {
                 if (value == '0') {
                     return "待审批";
                 } else if (value == '1'){
                     return "同意";
                 } else {
                	    return "驳回";
                 }
             }
         },];
    	 $("#sheets").bootstrapTable({
             method: "post",
             contentType : "application/x-www-form-urlencoded",
             url: "<%=request.getContextPath()%>/sheet/sheetLists?time=" + new Date().getTime() ,
             striped: true,
             pagination: true,
             toolbar: '#toolbar',                //工具按钮用哪个容器
             columns: columns,
             queryParams: oTableInit.queryParams,//传递参数（*）
             sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
         pageNumber:1,                       //初始化加载第一页，默认第一页
         pageSize: 10,                       //每页的记录行数（*）
         pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
         /* search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 */
         strictSearch: true,
         showColumns: true,                  //是否显示所有的列
         showRefresh: true,                  //是否显示刷新按钮
         minimumCountColumns: 2,             //最少允许的列数
         clickToSelect: true,                //是否启用点击选中行
         height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
         uniqueId: "id",                     //每一行的唯一标识，一般为主键列
         showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
         cardView: false,                    //是否显示详细视图
         detailView: false,                   //是否显示父子表
   });  
    }
  //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样
            name: $("#name").val(),
            start_day: $("#start_day").val()
        };
        return temp;
    };
    return oTableInit;
 }
 var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};
 function searchInfo(){
	 $('#sheets').bootstrapTable('refresh');
}
 function seeDetail(){
	 var selects = $('#sheets').bootstrapTable('getSelections');
	 if(selects != null && !selects.isEmpty){
		 var id  = selects[0].id;
         var name = selects[0].name;
         var type = selects[0].type;
         var start_day = selects[0].start_day;
         var end_day = selects[0].end_day;
         var day = selects[0].day;
         var reason = selects[0].reason;
         var progress = selects[0].progress;
         var flowId = selects[0].flowId;
         var uid = selects[0].uid;
     }
	 $('#myModal').modal('show');
	 $('#myModal').on('shown.bs.modal', function (e) {
		   $('#nameTxt').val(name);
		   if (type == 0) {  
		        document.getElementById('leave').checked = true;  
		    } else {  
		        document.getElementById('sickLeave').checked = true;  
		    }  
		   $('#reason').val(reason);
		   $('#start_dayTxt').val(start_day);
		   $('#end_dayTxt').val(end_day);
		   if (progress == 0 ) {
			   $('#progress').selectpicker('val', '0').trigger("change");
		   } else if ( progress == 1 ) {
			   $('#progress').selectpicker('val', '1').trigger("change");
			  
			  
		   } else {
			   $('#progress').selectpicker('val', '2').trigger("change");
		   }
           $('#id').val(id);
           $('#flowId').val(flowId);
           $('#uid').val(uid);
		   $('#day').val(day);
          /*  alert($('#id').val());  */
		})
	  $('#myModal').on('hidden.bs.modal', function (e) {
          /*  $('#nameTxt').val(" ");
                document.getElementById('事假').checked = false;  
                document.getElementById('病假').checked = false;   */
            $('#id').val(" ");
		  selects.splice(0,1);
       
           
        })
 }
 function submitProgress(){
	 var data = {id:$('#id').val(),progress:$("#progress").val(),flowId:$("#flowId").val(),day:$("#day").val(),uid:$("#uid").val(),
		start_day:$("#start_dayTxt").val(),end_day:$("#end_dayTxt").val(),name:$("#nameTxt").val()		 
	 };
	 $.ajax({
		  type: "POST",
		  url: "<%=request.getContextPath()%>/sheet/sheetUpdate?date=" + new Date().getDate(),
		  dataType: "json",
		  data: data ,
		  success: function(resultJson) {
			  if (resultJson == 1){
				  toastr.success('提交成功');
				  $('#myModal').modal('hide');
				  $('#sheets').bootstrapTable('refresh');
				  
			  } else {
				  toastr.error('提交失败');
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
	                toastr.success('该请假已被拉入黑名单');
	                $('#myModal').modal('hide');
					  $('#sheets').bootstrapTable('refresh');
	            } else {
	                toastr.error('操作失败');
	            }
			}
		})
	}
 </script>
</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">查询条件</div>
			<div class="panel-body">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-1"
							for="name">请假人姓名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="name">
						</div>
						<label class="control-label col-sm-1" for="start_day">开始时间</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="start_day">
						</div>
						<div class="col-sm-4" style="text-align: left;">
							<button type="button" style="margin-left: 50px" id="btn_query"
							onclick="searchInfo()"	class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">详细信息</h4>
          </div>
          <div class="modal-body">
                请假人:<input type="text" class="form-control" id="nameTxt" readonly="readonly" ><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;<br/>
                请假类型:&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <input type="radio" name="type" id="leave" value="0" readonly="readonly" />事假&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;    
                        <input type="radio" name="type" id="sickLeave" value="1" readonly="readonly"/>病假<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
                起始时间:&nbsp;&nbsp;<input type="text" class="form-control" id="start_dayTxt" readonly="readonly" >  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
                结束时间:&nbsp;&nbsp;<input type="text" class="form-control" id="end_dayTxt" readonly="readonly" ><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
                请假原因:&nbsp;&nbsp;&nbsp;&nbsp;<textarea   id="reason" class="form-control" readonly="readonly"></textarea><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
                审批进度:&nbsp;&nbsp;&nbsp;&nbsp;<select id="progress" class="selectpicker" data-live-search="false" >
                        <option  value='0'>待审批</option>
                        <option  value='1'>同意</option>
                        <option  value='2'>驳回</option>
                </select><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>  
                <input type="hidden" id="id" ></input>
                <input type="hidden" id="flowId"></input>
                <input type="hidden" id="day"></input>
                <input type="hidden" id="uid"></input>
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button class="btn btn-default	" id="submit" type="button" onclick="removeSheet()">拉黑</button>
            <button class="btn btn-primary" id="submit" type="button" onclick="submitProgress()">提交</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div>
		<div id="toolbar" class="btn-group">
			<button id="btn_details" type="button" class="btn btn-info"   onclick="seeDetail()"  >
				<span  aria-hidden="true"></span>详情
			</button>
			<button id="btn_edit" type="button" class="btn btn-success">
				<span  aria-hidden="true"></span>同意
			</button>
			<button id="btn_delete" type="button" class="btn btn-danger">
				<span aria-hidden="true"></span>驳回
			</button>
		</div>
		
		<table id="sheets">
		</table>
</body>
</html>