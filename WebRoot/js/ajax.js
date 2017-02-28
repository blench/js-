
//外部js文件
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