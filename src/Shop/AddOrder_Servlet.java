package Shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddOrder_Servlet")
public class AddOrder_Servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	 /**
     * @return 
	 * @see HttpServlet#HttpServlet()
     */
    public AddOrder_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    response.setContentType("text/html;charset=UTF-8;");
	    PrintWriter writer = response.getWriter();
	    //writer.write("<h1>" + "我是大猪头" + "</h1>");
	    boolean isSucess = false;
	    HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null){
			String name = user.getName();
			List<Cart> order_list = Shop_sql.cart_list(name);
			if(order_list!=null){
				isSucess = Shop_sql.addOrder( order_list );
			}		
		}
		if(isSucess){
			//writer.write("<h1>" + "下单成功" + "</h1>");
			//request.getRequestDispatcher("AddOrder.jsp");
			//response.setContentType("text/html;charset=UTF-8");
			//response.setHeader("Location", "/AddOrder.jsp");
			
		      response.setContentType("text/html;charset=UTF-8");
		      String site = new String("/CoffeeShop/AddOrder.jsp");
		      response.setStatus(response.SC_MOVED_TEMPORARILY);
		      response.setHeader("Location", site); 
		      
		}
		else{
			writer.write("<h1>" + "下单失败" + "</h1>");
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
