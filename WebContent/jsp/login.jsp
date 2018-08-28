<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>后台管理</title>
<link href="../css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jslib/easyui/jquery.js"></script>
<script type="text/javascript">
	var xmlhttp;
	function checkNameExist(){
		var name = document.getElementById("name").value;  
	    //传统的ajax校验  
	    //1.创建异步交互对象，  
	    var xhr = createXmlHttp();    
	    //2设置监听  
	    xhr.onreadystatechange = function(){  
	        if(xhr.readyState == 4){    
	                var result = xhr.responseText;
	                var checkResult = document.getElementById("checkResult");  
	            if (result == "error") {
	            	    checkResult.innerHTML = "<center><font color='red'>用户名不存在,请重新输入</font></center>"
	            }
	        }  
	    }  
	      
	    //3打开连接  
	    xhr.open("GET","<%=request.getContextPath()%>/loginController/checkNameExist?name=" + name + " &date= "+ new Date().getTime() , true);  
	    //4发送  
	    xhr.send();       
	    }     
	          
	    //创建XmlHttp对象  
	    function createXmlHttp(){  
	        var xmlHttp;  
	        try{  
	            xmlHttp= new XMLHttpRequest();  
	        }catch(e){  
	            try{  
	                xmlHttp=new ActiveXObject("Msxm12.XMLHTTP");  
	            }catch(e){  
	                try{  
	                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
	                }catch(e){}  
	            }             
	        }  
	          
	         return xmlHttp;      
	    
	}  
</script>
</head>

<body>
<div class="login_box">
      <div class="login_l_img"><img src="../img/login-img.png" /></div>
      <div class="login">
          <div class="login_logo"><a href="#"><img src="../img/login_logo.png" /></a></div>
          <div class="login_name">
               <p>学生请假管理系统</p>
          </div>
          <form method="post" action="<%= request.getContextPath() %>/loginController/login">
              <input id="name" name="name" type="text" value="用户名"  onfocus="this.value=''" onblur="if(this.value==''){this.value='用户名'}else{checkNameExist()}" >
              <span id="password_text"  onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();" >密码</span>
<input name="password" type="password" id="password" style="display:none;" onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};"/>
              <input value="登录" style="width:100%;" type="submit"><br/>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/>
              <span id="checkResult" ></span>
          </form>
      </div>
      <div class="copyright">某某有限公司 版权所有©2016-2018 技术支持电话：000-00000000</div>
</div>
<div style="text-align:center;">

</div>
</body>
</html>