package cn.itcast.js.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxUserServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		byte [] buf = username.getBytes("ISO8859-1");
		username = new String(buf,"UTF-8");
		String tip = "<font color='green'>可以注册</font>";
		if("杰克".equals(username))
		{
			tip = "<font color='red'>该用户已注册</font>";
		}
		System.out.println(username);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
	
		pw.write(tip);
		pw.flush();
		pw.close();
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String tip = "images/MsgSent.gif";
		if("杰克".equals(username))
		{
			tip = "images/MsgError.gif";
		}
		System.out.println(username);
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();
	
		pw.write(tip);
		pw.flush();
		pw.close();
	}
}
