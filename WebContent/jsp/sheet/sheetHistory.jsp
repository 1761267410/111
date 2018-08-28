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
<link rel="stylesheet" type="text/css" href="../../css/toastr.css">
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery.js"></script>
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
         }, {
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
             title: '请假结果',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
             formatter:function(value){
            	 if(value=="0")
            		 return "正在审核";
            	 if(value=="1")
            		 return "请假成功";
            	if(value=="2")
            		return "请假失败";
             }
         },{
             field: 'flowId',
             title: '对应流程',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
             hidden: 'true'
         },];
         $("#sheets").bootstrapTable({
             method: "post",
             contentType : "application/x-www-form-urlencoded",
             url: "<%=request.getContextPath()%>/sheet/getSheetHistory?time=" + new Date().getTime() ,
             striped: true,
             pagination: true,
             toolbar: '#toolbar',                //工具按钮用哪个容器
             columns: columns,
            /*  queryParams: oTableInit.queryParams, *///传递参数（*）
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

var TableInit1 = function () {
    var oTableInit1 = new Object();
    //初始化Table
    oTableInit1.Init = function (data) {
    

         var columns1 = [{
             checkbox: true,
             align: 'center' // 居中显示
         }, {
             field: 'fnId',
             title: '流程节点编号',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         },{
             field: 'nodeName',
             title: '节点名称',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         },  {
             field: 'statusName',
             title: '审理状态',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
             formatter : function (value, row, index) {
                 if (row['statusName'] == 1) {
                     return '已受理';
                 }
                 if (row['statusName'] === 0) {
                     return '未受理';
                 }
                 return value;
             }
         }, {
             field: 'nodeSort',
             title: '节点排序',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
            /*  formatter : function (value, row, index) {
                 if (row['statusName'] == 1) {
                     return '已受理';
                 }
                 if (row['statusName'] === 0) {
                     return '未受理';
                 }
                 return value;
             } */
         }, {
             field: 'creator',
             title: '创建者',
             align: 'center', // 左右居中
             valign: 'middle' // 上下居中
         },{
             field: 'created_time',
             title: '创建时间',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
         },{
             field: 'currentUser',
             title: '当前用户ID',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
         },{
             field: 'nextUser',
             title: '流向用户ID',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
         },{
             field: 'previousUser',
             title: '回退用户ID',
             align: 'center', // 左右居中
             valign: 'middle', // 上下居中
         },];
         $("#sheets1").bootstrapTable({
             method: "post",
             contentType : "application/x-www-form-urlencoded",
             url: "<%=request.getContextPath()%>/node/shownode?date=" + new Date().getDate() ,
             striped: true,
             pagination: true,
            /*  toolbar: '#toolbar', */                //工具按钮用哪个容器
             columns: columns1,
       queryParams: data, //传递参数（*）
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
         uniqueId: "fnId",                     //每一行的唯一标识，一般为主键列
         showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
         cardView: false,                    //是否显示详细视图
         detailView: false,                   //是否显示父子表
   });
          oTableInit1.queryParams = function (params) {
               //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样
        	  var selects = $('#sheets1').bootstrapTable('getSelections');
              if(selects != null && !selects.isEmpty){
                  var flowId = selects[0].flowId ;
                  var data = {flowId: flowId};
              }
              
            	        return data;
             }; 
       
    }
    return oTableInit1;
}
 function searchInfo(){
     $('#sheets').bootstrapTable('refresh');
}
 function seeDetail(){
     var selects = $('#sheets').bootstrapTable('getSelections');
     if(selects != null && !selects.isEmpty){
         var flowId = selects[0].flowId ;
     }
     var data = {flowId: flowId};
   <%--   $.ajax({
         type: "POST",
         url: "<%=request.getContextPath()%>/node/shownode?date=" + new Date().getDate(),
         dataType: "json",
         data: data ,
         success: function(flownodes) {
        		var fnId = ele.fnId ;
        		var nodeName = ele.nodeName;
        		var statusName = ele.statusNames;
        		var nodeSort = ele.nodeSort;
        		var creator = ele.creator;
        		var created_time = ele.created_time;
        		var modifier = ele.modifier;
        		var modified_time = ele.modified_time;
        		var currentUser = ele.currentUser;
        		var nextUser = ele.nextUser;
        		var previousUser = ele.previousUser; --%>
        		/* $('#myModal').on('shown.bs.modal', function (e) {
        	           $('#fnIdTxt').val(fnId);
        	           $('#nodeNameTxt').val(nodeName);
        	           if (statusName == 1) {  
        	                document.getElementById('yes').checked = true;  
        	            } else {  
        	                document.getElementById('no').checked = true;  
        	            }  
        	           $('#nodeSortTxt').val(nodeSort);
        	           $('#creatorTxt').val(creator);
        	           $('#created_timeTxt').val(created_time);
        	           $('#modifierTxt').val(modifier);
        	           $('#modified_timeTxt').val(modified_time);
        	           $('#currentUserTxt').val(currentUser);
        	           $('#nextUserTxt').val(nextUser);
        	           $('#previousUserTxt').val(previousUser);
        	          /*  alert($('#id').val());  */
        	        
   /*       }) */
     /* } */
     $('#myModal').modal('show');
        		$('#myModal').on('shown.bs.modal', function (e) {
        	         //1.初始化Table
        			   
        	           var oTable1 = new TableInit1();
        	           oTable1.Init(data);
        	                      /*  alert($('#id').val());  */
        	                    }) 
       
       
     
     
 }
 function submitProgress(){
	 $('#myModal').modal('hide');
     $('#sheets').bootstrapTable('refresh');
 } 
 <%-- function agree() {
     var selects = $('#sheets').bootstrapTable('getSelections');
     if(selects != null && !selects.isEmpty){
         var id  = selects[0].id;
     }
     var data = {id:id,progress:1};
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
     
 } --%>
 <%-- function  disagree() {
     var selects = $('#sheets').bootstrapTable('getSelections');
     if(selects != null && !selects.isEmpty){
         var id  = selects[0].id;
     }
     var data = {id:id,progress:2};
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
} --%>
 </script>
</head>
<body>
	<!-- <div class="panel-body" style="padding-bottom: 0px;">
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
                            onclick="searchInfo()"  class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div> -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">详细信息</h4>
				</div>
				<div class="modal-body">
					<table id="sheets1">
					</table>

				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					<button class="btn btn-primary" id="submit" type="button"
						onclick="submitProgress()">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<div id="toolbar" class="btn-group">
		<button id="btn_details" type="button" class="btn btn-info"
			onclick="seeDetail()">
			<span aria-hidden="true"></span>详情
		</button>
		<!--             <button id="btn_edit" type="button" class="btn btn-success"  onclick="agree()">
                <span  aria-hidden="true"></span>同意
            </button>
            <button id="btn_delete" type="button" class="btn btn-danger" onclick="disagree()">
                <span aria-hidden="true"></span>驳回
            </button> -->
	</div>

	<table id="sheets">
	</table>
</body>
</html>