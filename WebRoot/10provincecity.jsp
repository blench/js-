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
	    <select id="provinceID" style="width:111px">
	    	<option>请选择省份</option>
	    	<option>湖北</option>
	    	<option>广东</option>
	    </select>
	    
	    <select id="cityID" style="width:111px">
	    	<option>请选择城市</option>
	    </select>
	    
	    <hr/>
	   
	   <!-- 引入外部js文件 -->
	   <script type="text/javascript" src="js/ajax.js"> </script>
	   <script type="text/javascript">
	   	document.getElementById("provinceID").onchange = function()
	   	{
	   		//清除下拉列框之前的内容，第一项除外
	   		var cityElement = document.getElementById("cityID");
	   		cityElement.options.length = 1;
	   		//获取选中省份的名字
	   		var index = this.selectedIndex;
	   		var optionElement = this[index];
	   		var province = optionElement.innerHTML;
	   		
	   		//去掉提示"请选择省份"
	   		if("请选择省份" != province)
	   		{
	   			//NO1)
	   			var ajax = createAjax();
	   			//NO2)
	   		
	   			var method = "POST";
	   			var url = "${pageContext.request.contextPath}/ProvinceCityServlet?time="+new Date().getTime();
	   			ajax.open(method,url);
	   			
	   			//设置请求头
	   			ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	   			//NO3)
	   			var content = "province="+province;
	   			ajax.send(content);
	   		
	   			//NO4)
	   			ajax.onreadystatechange = function()
	   			{
	   				if(ajax.readyState == 4)
	   				{
	   					if(ajax.status == 200)
	   					{	
	   						//NO5)从ajax异步对象中获取服务器XML数据
	   						var xmlDocument = ajax.responseXML;
	   						//N06)按照DOM规则，解析xml数据
	   						var cityElementArray = xmlDocument.getElementsByTagName("city");
	   						var size = cityElementArray.length;
	   						for(var i=0;i<size;i++)
	   						{
	   							//innerHTML只能用在html标签中
	   							var city = cityElementArray[i].innerHTML;
	   							//<option></option>
	   							var optionElement = document.createElement("option");
	   							//<option>深圳</option>
	   							optionElement.innerHTML = city;
	   							//<select><option>广东</option></select>
	   							
	   							//appendeChild()不会去除之前的内容
	   							cityElement.appendChild(optionElement);
	   						}
	   	
	   					}
	   				}
	   			}
	   		}
	   	}
	   </script>
	  	
  </body>
</html>
