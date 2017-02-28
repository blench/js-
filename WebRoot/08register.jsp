<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通过使用GET,POST方式来使用ajax验证用户名是否重复</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
	用户名：
	    <input type="text" id="username" maxlength="4"/> <span id="rsID"></span>
	    <hr/>
	   
	   <!-- ajax对象 -->
	   <script type="text/javascript">
	   
	   	function createAjax()
	   	{
	   		var ajax =null;
	   		try{
	   			ajax = new ActiveXObject("microsoft.xmlhttp");
	   		}catch(e1)
	   		{
	   			try{
	   				ajax = new XMLHttpRequest();
	   			}catch(e2)
	   			{
	   				alert("你的浏览器不支持AJAX异步对象");
	   			}
	   		}
	   		return ajax;
	   	}
	   </script>
	   
	   <script type="text/javascript">
	   	 document.getElementById("username").onblur = function()
	   	 {
	   		 
	   		 var username = this.value;
	   		 if(username.length == 0)
	   			{
	   			 document.getElementById("rsID").innerHTML="用户名不能为空";
	   			}
	   		 else
	   			{
	   				//对汉字进行编码
	   				username = encodeURI(username);
	   				//1)首先创建Ajax对象
	   				var ajax = createAjax();
	   				//2)打开连接
	   				var method = "GET";
	   				var url = "${pageContext.request.contextPath}/AjaxUserServlet?username="+username+"&time="+new Date().getTime();
	   				ajax.open(method,url);
	   				
	   				//3)真正发送数据
	   				ajax.send(null);
	   				
	   				//4)Ajax对象不断监听服务器响应的状态
	   				ajax.onreadystatechange = function()
	   				{
	   					
	   					if(ajax.readyState == 4)
	   					{
	   					//5)响应码是200的话，从ajax对象中取出数据
	   						if(ajax.status == 200)
	   						{
	   							var rsText = ajax.responseText;
	   							document.getElementById("rsID").innerHTML=rsText;
	   							
	   						}
	   					}
	   				}
	   			}
	   	 }
	   </script>
  </body>
</html>
