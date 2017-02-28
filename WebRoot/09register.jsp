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
	    <input type="text" id="username" maxlength="4"/> 
	    <span id="rsID">
	    	<!-- 
	    	 -->
	    </span>
	    <hr/>
	   
	   <!-- 引入外部js文件 -->
	   <script type="text/javascript" src="js/ajax.js"> </script>
	   <script type="text/javascript">
	   	document.getElementById("username").onblur = function()
	   	{
	   		var username = this.value;
	   		//1)
	   		var ajax = createAjax();
	   		//2)
	   		method = "POST";
	   		url = "${pageContext.request.contextPath}/AjaxUserServlet?time="+new Date().getTime();
	   		ajax.open(method,url);
	   		//post方式提交要设置请求头自动将中文转换为UTF-8
	   		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
	   		//3)
	   		var content = "username="+username;
	   		
	   		ajax.send(content);
	   		
	   		//on ready state change
	   		ajax.onreadystatechange = function()
	   		{
	   				
	   			if(ajax.readyState == 4)
	   			{
	   				if(ajax.status == 200)
	   				{
	   					//5)
	   					var tip = ajax.responseText;
	   					//6)创建img标签
	   					var imgElement = document.createElement("img");
	   					//设置img标签的src/width/height
	   					imgElement.src = tip;
	   					imgElement.style.width = "12px";
	   					imgElement.style.height = "12px";
	   					
	   					//定位span标签
	   					var spanElement = document.getElementById("rsID");
	   					//清空span标签的内容，防止重复出现图片
	   					spanElement.innerHTML = "";
	   					//将img标签加入到span标签
	   					spanElement.appendChild(imgElement);
	   					
	   				}
	   			}
	   			
	   		}
	   	}
	   	
	   </script>
	  	
  </body>
</html>
