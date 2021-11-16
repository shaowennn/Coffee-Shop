package Shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test_Servlet
 */
@WebServlet("/Test_Servlet")
public class Test_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取ajax发送过来的name值
		String r_name = request.getParameter("name");
		String a = request.getParameter("a");
		 try {
			 System.out.println(a);
			 //检验是否存在该用户名
			 boolean isExist=Shop_sql.checkUser(r_name);
			 System.out.println("isExist:"+isExist);
			 //通知页面，到底有没有
			 if(isExist){
				 response.getWriter().println(1);//存在用户名
			 }else{
				 response.getWriter().println(2);//不存在该用户
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
