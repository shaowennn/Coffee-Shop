package Shop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login_servlet
 */
@WebServlet("/Login_servlet")
public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String yanzheng = request.getParameter("yanzheng");
		
		//验证用户输入的验证码和系统生成的验证码是否一致
		System.out.println("用户输入的验证码是:"+yanzheng);
		HttpSession session1 = request.getSession();
		String code = (String) session1.getAttribute("code");
		System.out.println("系统生成的验证码是:"+code);
		
		if( yanzheng.equals(code) ){
			User user = Shop_sql.login(username, password);
			if(user!=null){
				session1.setAttribute("user", user);
				System.out.println("user正确");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}else{
				request.setAttribute("errorMsg", "用户名或密码错误");
				System.out.println("user为空");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("errorMsg", "验证码错误");
			System.out.println("验证码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
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
