package cn.itcast.js.province;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProvinceCityServlet extends HttpServlet {
	
	private static PreparedStatement pst = null;
	private static Connection con = null;
	private static ResultSet rs = null;
	String sql = "";
	//首先要指定ArrayList初始化
	private List<String> list = new ArrayList<String>();
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//十分重要，清除之前存在的数据
		list.clear();
		String province = request.getParameter("province");
		//System.out.println(province);
//		String city = "";
		
		//从数据库中查询获得
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Employee","sa","qwer1234");
			//从两个表中去查找
			sql = "select c.cName from t_city c,t_province p where p.pName =? and c.pName = p.pName";
			pst = con.prepareStatement(sql);
			//下标从1开始,设置占位符必须在con.prepareStatement(sql);语句之后
			pst.setString(1, province);
			rs = pst.executeQuery();
			while(rs.next())
			{
				//System.out.println(rs.getString(1));
				list.add(rs.getString("cName"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con != null)
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(pst != null)
				try{
					pst.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
		/**if("广东".equals(province))
		{
			
			//city="<city>广州</city>"+"<city>深圳</city>"+"<city>惠州</city>";
		}else if("湖北".equals(province))
		{
			city = "<city>武汉</city>"+"<city>黄冈</city>"+"<city>宜昌</city>";
		}*/
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.write("<?xml version='1.0' encoding='UTF-8'?>");
		pw.write("<root>");
		
		for(int i=0;i<list.size();i++)
		{
			pw.write("<city>"+list.get(i)+"</city>");
		}
		
		
		
//		pw.write(city);
		pw.write("</root>");
		pw.flush();
		pw.close();	
	}
//需求实现从数据库中读取数据并添加到xml文件中
}
