<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
	       显示当前时间：<span id="nowTime"></span>
	    <input type="button" id="buttonId" value="获取当前时间"/>
	   <!-- ajax对象 -->
	   <script type="text/javascript">
	   //创建ajax对象
	   	function createAjax()
	   	{
	   		var ajax = null;
	   		//如果是IE5-IE12
	   		try{
	   		 ajax = new ActiveXObject("microsoft.xmlhttp");	
	   		}catch(e1)
	   		{
	   			ajax = new XMLHttpRequest();
	   		}
	   		
	   		return ajax;
	   		
	   	}
	   </script>
	   
	   <script type="text/javascript">
	   /**
	   
	   时间监听有问题document.getElementById("buttonId").onclick= fucntion()
	   {
		   
	   }不是click
	   */
	  	document.getElementById("buttonId").onclick = function()
	   		{
		   	//1.创建Ajax对象
		   	var ajax = createAjax();
		   	//2.准备发送请求
		   	var method = "GET";
		   	var url = "${pageContext.request.contextPath}/AjaxTimeServlet";
		   	ajax.open(method,url);
		   	//3.真正发送的数据到服务器，如果请求体没有数据，就发送为空
		   	ajax.send(null);
		   	//4.ajax对象不断监听服务器响应的状态0-1-2-3-4
		   	ajax.onreadystatechange = function()
		   	{
		   		if(ajax.readyState == 4)
		   		{
		   			//5如果响应码是200的话，从Ajax响应对象中获得HTML数据
		   			if(ajax.status == 200)
		   			{
		   				var nowStr = ajax.responseText;
		   				//6,将值赋给span标签
		   				document.getElementById("nowTime").innerHTML=nowStr;
		   			}
		   		}
		   	}
		}
	   </script>
	
  </body>
</html>
