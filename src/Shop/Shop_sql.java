package Shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Shop_sql {

	private static Connection conn = null;
	public static Statement st = null;

	private static Connection getConnection() {
		if (conn != null) {
			return conn;
		}

		String driver_MySQL = "com.mysql.jdbc.Driver";
		String ip = "localhost";
		String url_ques = "jdbc:mysql://" + ip + ":3306/shop";
		String account_MySQL = "root";
		String password_MySQL = "1001";

		try {
			Class.forName(driver_MySQL);
			conn = DriverManager.getConnection(url_ques, account_MySQL, password_MySQL);
			System.out.println("Connection:成功创建数据库连接");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection:创建数据库连接失败");
		}
		return conn;
	}

	/*
	 * 判断用户名是否存在 参数:用户名username 实现方法:rs.next为false时用户名找不到 返回值:成功返回true,不成功时false
	 */
	public static Boolean checkUser(String username) {

		String sql = "select * from user_info where username='" + username + "'";
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("checkUser:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
//				System.out.println("checkUser:用户名存在");
				return true;
			}
			System.out.println("checkUser:用户名不存在");
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("checkUser函数出现问题");
		}
		return false;
	}

	/*
	 * 判断商品编号是否存在 参数:商品编号id 实现方法:rs.next为false时商品名称找不到 返回值:成功返回true,不成功时false
	 */
	public static Boolean checkProductId(int id) {

		String sql = "select * from product_info where id='" + id + "'";
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("checkProductId:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
//				System.out.println("checkProductId:商品名称存在");
				return true;
			}
			System.out.println("checkProductId:商品名称不存在");
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("checkProductId函数出现问题");
		}
		return false;
	}

	/*
	 * 判断商品是否在某个用户的购物车中 参数:用户名username, 商品编号id 实现方法:rs.next为false时商品不在购物车中
	 * 返回值:成功返回true,不成功时false
	 */
	public static Boolean checkCart(String username, int id) {

		String sql = "select * from cart where product_id='" + id + "' and username='" + username + "'";
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("此商品在购物车中:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
//				System.out.println("checkCart:此商品在购物车中");
				return false;
			}
			System.out.println("checkCart:此商品不在购物车中");
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("checkCart函数出现问题");
		}
		return false;
	}

	/*
	 * 查找购物车中商品的数量 参数:用户名username, 商品编号id 实现方法:rs.next为false时商品不在购物车中 返回值:商品数量
	 */
	public static int checkCartAmount(String username, int id) {
		int amount = 0;
		String sql = "select * from cart where product_id='" + id + "' and username='" + username + "'";
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("此商品在购物车中:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			if (checkUser(username) && checkProductId(id)) {
				if (rs.next()) {
					amount = rs.getInt("amount");
				}
			} else {
				System.out.println("checkCartAmount:此商品或用户不存在");
			}
			return amount;
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("checkCartAmount函数出现问题");
		}
		return amount;
	}

	/*
	 * 登录操作 参数:用户名username, 用户密码psw 实现方法:通过给定用户名查找此用户的密码,将查找到的密码与输入的密码比对
	 * 返回值:成功返回user对象,不成功时user = null
	 */
	public static User login(String username, String psw) {

		User user = null;
		String pwd;

		String sql = "select * from user_info where username='" + username + "'";
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("login:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				pwd = rs.getString("psw");
				if (pwd.equals(psw)) {
					user = new User(username, psw);
				}
			}
			System.out.println("login:成功登录");
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("login函数出现问题");
		}
		return user;

	}

	/*
	 * 注册操作 参数:用户名username, 用户密码psw 实现方法:通过给定用户名与密码在数据库添加记录 返回值:返回一个User类对象
	 */
	public static User register(String username, String psw, String email, String phone) {

		User user = null;

		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("register:创建操作语句成功");
			if (!checkUser(username)) {
				String sql = "insert into user_info value('" + username + "','" + psw + "','" + email + "','" + phone + "')";
				st.executeUpdate(sql); // 执行sql
				user = new User(username, psw);
				System.out.println("register:成功注册");
			}
			System.out.println("register:用户已存在");
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("register函数出现问题");
		}
		return user;
	}

	/*
	 * 查询全部商品信息操作 参数:无 实现方法:创建一个product类的list集合,通过数据库操作查找到商品信息,
	 * 将此商品信息构造一个product类,通过add()将product加入至product集合中。
	 * 返回值:返回一个product类集合all_product
	 */
	public static List<Product> product_list() {

		List<Product> all_product = new ArrayList<Product>();

		Product product = null;
		int id;
		String name;
		int price;
		String detail;
		String img_src;

		String sql = "select * from product_info";
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("product_list:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				id = rs.getInt("id");
				name = rs.getString("name");
				price = rs.getInt("price");
				detail = rs.getString("details");
				img_src = rs.getString("img");
				product = new Product(id, name, price, detail, img_src);
				all_product.add(product);
			}
//			System.out.println("product_list:操作成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("product_list:函数出现问题");
		}
		return all_product;

	}

	/*
	 * 查找具体id商品信息操作 参数:商品编号id 实现方法:通过给定id在数据库寻找对应商品的全部信息 返回值:返回一个product类对象
	 */
	public static Product find_product(int id) {

		Product product = null;
		String name;
		int price;
		String detail;
		String img_src;

		String sql = "select * from product_info where id=" + id;
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("product_list:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				name = rs.getString("name");
				price = rs.getInt("price");
				detail = rs.getString("details");
				img_src = rs.getString("img");
				product = new Product(id, name, price, detail, img_src);
			}
//			System.out.println("find_product:操作成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("find_product函数出现问题");
		}
		return product;
	}

	/*
	 * 添加商品至购物车 参数:用户名称username，商品编号product_id，数目amount
	 * 实现方法:通过给定username和product_id判断用户名和商品id是否存在，存在则写入username,product_id,
	 * amount至数据库 返回值:成功返回true，不成功返回false
	 */
	public static Boolean addToCart(String username, int product_id, int amount) {
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("addToCart:创建操作语句成功");

			String sql = "insert into cart value('" + username + "'," + product_id + "," + amount + ")";

			if (checkUser(username) && checkProductId(product_id)) {
				if (checkCart(username, product_id)) {
					st.executeUpdate(sql); // 执行sql
//					System.out.println("addToCart:成功加入购物车");
					return true;
				} else {
					System.out.println("addToCart:购物车中已有此商品");
					int modifyamount = checkCartAmount(username, product_id) + amount;
					ModifyAmount(username, product_id, modifyamount);
					return true;
				}
			} else {
				System.out.println("addToCart:没有此商品编号或用户名");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("addToCart函数出现问题");
		}
		return false;
	}

	/*
	 * 删除某个用户购物车中的物品 参数:用户名username,商品编号product_id
	 * 实现方法:通过给定username和product_id在数据库删除对应商品的信息 返回值:成功返回true，不成功返回false
	 */
	public static boolean delToCart(String username, int product_id) {
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("delToCart:创建操作语句成功");

			String sql = "delete from cart where username='" + username + "' and product_id=" + product_id;
			if (checkUser(username) && checkProductId(product_id)) {
				if (!checkCart(username, product_id)) {
					st.executeUpdate(sql); // 执行sql
//					System.out.println("delToCart:成功删除");
					return true;
				} else {
					System.out.println("delToCart:此商品不在购物车中");
					return false;
				}
			}
			System.out.println("delToCart:没有此商品编号");
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("delToCart函数出现问题");
		}
		return false;
	}

	/*
	 * 修改某个用户购物车中具体商品的数量操作 参数:用户名称username，商品编号product_id
	 * 实现方法:通过给定用户名username和商品编号product_id在数据库修改对应商品的数量 返回值:成功返回true，不成功返回false
	 */
	public static Boolean ModifyAmount(String username, int product_id, int amount) {
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("ModifyAmount:创建操作语句成功");

			String sql = "update cart set amount=" + amount + " where product_id=" + product_id + " and username='"
					+ username + "'";

			if (checkUser(username) && checkProductId(product_id)) {
				if (!checkCart(username, product_id)) {
					st.executeUpdate(sql); // 执行sql
					System.out.println("ModifyAmount:成功修改");
					return true;
				} else {
					System.out.println("ModifyAmount:此商品不在购物车中");
					return false;
				}
			}
			System.out.println("ModifyAmount:没有此商品编号");
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("ModifyAmount函数出现问题");
		}
		return false;
	}

	/*
	 * 查询全部购物车信息操作 参数:用户名username 实现方法:创建一个cart类的list集合,通过数据库操作查找对应用户的购物车信息
	 * 将此商品信息构造一个cart类,通过add()将cart加入至cart集合中。 返回值:返回一个cart类集合all_cart
	 */
	public static List<Cart> cart_list(String username) {

		List<Cart> all_cart = new ArrayList<Cart>();

		Cart cart = null;
		int product_id;
		int amount;

		String sql = "select * from cart where username='" + username + "'";
		try { // 数据库常规操作
			st = getConnection().createStatement();
//			System.out.println("cart_list:创建操作语句成功");
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				product_id = rs.getInt("product_id");
				amount = rs.getInt("amount");
				cart = new Cart(username, product_id, amount);
				all_cart.add(cart);
//				System.out.println("cart_list:操作成功");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("cart_list:函数出现问题");
		}
		return all_cart;

	}

	/*
	 * 查询全部订单信息操作 参数:用户名username
	 * 实现方法:创建一个order类的list集合,通过数据库操作查找对应用户的订单信息
	 * 将此商品信息构造一个order类,通过add()将order加入至order集合中。 
	 * 返回值:返回一个order类集合order_list
	 */
	public static List<Order> order_list(String username){
		List<Order> order_list = new ArrayList<Order>(); 
		Order order = null; 
		String sql ="select * from `order` where username = '" + username + "'"; 
		//String sql ="select `order`.id,`product_info`.`name`,`order`.amount,`product_info`.price,`product_info`.price*`order`.amount as `total` from `order`,`product_info`where `order`.pro_id = `product_info`.id and `order`.username = '" + username + "';";
		try{ 
			st =getConnection().createStatement(); 
//			System.out.println("order_list:创建操作语句成功"); 
			ResultSet rs = st.executeQuery(sql); 
			while(rs.next()){ 
				int pro_id = rs.getInt("pro_id"); 
				int amount= rs.getInt("amount");
				String status = rs.getString("status"); 
				order = new Order(username, pro_id, amount,status); 
				order_list.add(order);
//				System.out.println("order_list:操作成功"); 
			  }
		}catch (Exception e) { 
			// TODO Auto-generated catch block 
//			e.printStackTrace();
			System.out.println("order_list:函数出现问题"); 
		}
		return order_list;
	}
	 
	/*
	 * 添加订单信息操作 参数:一组订单集合
	 * 实现方法:通过for循环添加订单集合中的全部订单至数据库
	 * 将此商品信息构造一个order类,通过add()将order加入至order集合中。 
	 * 返回值:成功返回true,失败返回false
	 */
	public static boolean addOrder(List<Cart> order_list){
		String sql = ""; 
		try{ 
			st =getConnection().createStatement(); 
			System.out.println("addOrder:创建操作语句成功"); 
			for(Cart i:order_list) {
				sql = "INSERT INTO `order` (`username`, `pro_id`, `amount`, `status`) VALUES ('"+i.getUsername()+
						"', '"+i.getProduct_id()+"', '"+i.getAmount()+"', 'ok')"; 
				System.out.println("SQL:"+sql);
				st.executeUpdate(sql);
			}
			return true;
		}catch (Exception e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace();
			System.out.println("addOrder:函数出现问题"); 
		}
		return false;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// test product_list()
//		List<Product> l = product_list();
//		for (Product i:l){
//			System.out.println(i.getId());
//		}

		// test find_product(id)
//		Product a = find_product(1);
//		System.out.println(a.getId());

		// test addToCart(username,id,amount)
//		if(addToCart("a",3,2)) {
//			System.out.println("success");
//		}

		// test delToCart(username, id)
//		if(delToCart("a",1)) {
//			System.out.println("success");
//		}

		// test cart_list(username)
//		List<Cart> cart = cart_list("a");
//		for (Cart i:cart){
//			System.out.println("商品编号:  "+i.getProduct_id());
//			System.out.println("商品数量:  "+i.getAmount());
//			System.out.println();
//		}

		// test ModifyAmount(username,id,amount)
//		if(ModifyAmount("a",2,9)) {
//			System.out.println("success");
//		}

		// test checkCart(username,id)
//		if(!checkCart("a",2)) {
//			System.out.println("success");
//		}

		// test checkCartAmount(username,id)
//		if(checkCartAmount("a",2)!=0) {
//			System.out.println(checkCartAmount("a",5));
//		}
		
		
		// test order_list(username)
		List<Order> a = order_list("a");
		for (Order i:a){
			System.out.println("商品编号:  "+i.getProduct_id());
			System.out.println("商品数量:  "+i.getAmount());
			System.out.println();
		}
		
		// test order_list(addOrder(List<Order>))
//		List<Order> a = new ArrayList<Order>();
//		a.add(new Order(6,"jj", 1, 1, "ok"));
//		a.add(new Order(6,"jj", 2, 1, "ok"));
//		a.add(new Order(6,"jj", 3, 1, "ok"));
//		a.add(new Order(6,"jj", 4, 1, "ok"));
//		a.add(new Order(6,"jj", 5, 1, "ok"));
//		if(addOrder(a)) {
//			System.out.println("success");
//		}

	}

}
