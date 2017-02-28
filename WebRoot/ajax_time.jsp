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
	    显示当前时间：
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
	   	 var btd = document.getElementById("buttonId");
	   	 btd.onclick=function()
	   	 {
			var ajax = createAjax();
			if(ajax != null)
			{
				alert("你的浏览器中有ajax对象");
			}else{
				alert("你的浏览器中没有ajax对象")
			}
	   	 }
	   </script>
  </body>
</html>
