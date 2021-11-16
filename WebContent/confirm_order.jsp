<%@page import="Shop.Shop_sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Shop.Cart, Shop.Product, Shop.Shop_sql, Shop.User, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>结算页</title>
<style type="text/css">
*{margin:0; padding:0;}
#table-head{
	border-bottom: none;
	margin-left: 10%;
}
#buy-table{
	margin-left: 10%;
}
.buy-now{
	width: 25%;
	margin-top: 3%;
	margin-right: 3%;
	margin-left: 65%;
}
.order-info{
	border: groove red;
	text-align: right;
	color: red;
	padding: 10px;
	font-size: 15px;
	font-weight: bold;
}
#total{
	font-size: 20px;
}
.btn{
	margin-left: 10%;
}
#backToCart{
	display: inline-block;
	padding-left: 20%;
}
#backToCart a{
	color: blue;
}
#submitOrder{
	display: inline-block;
	background: red;
	padding: 3%;
	margin-left: 18.9%;
	text-align: center;
}
#submitOrder a{
	color: white;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="confirm_order-main">
	<div><center><h2>确认订单信息</h2></center></div>
	
	<%
		User a = (User) session.getAttribute("user");
		String username = a.getName();
		//String username = request.getParameter("name");
		//String data = request.getParameter("arr_id");
		String amount_list = "";
		int total = 0;
	%>
    <table border="groove" id="table-head" width="80%" cellspacing="0" cellpadding="0">
		<tr align="center" >
			<td width="20%">商品图片</td>
			<td width="20%">商品名称</td>
			<td width="20%">商品单价</td>
			<td width="20%">商品数量</td>
			<td width="20%">小计</td>
		</tr>
	</table>
	
	<div class="buy">	
		<table border="groove" id="buy-table" width="80%" cellspacing="0" cellpadding="0">
			<%
				if(username!=null){
					//String[] arr_id = data.split(",");
					List<Cart> cart_list = Shop_sql.cart_list(username);
					for(Cart i:cart_list) {
					//for(int i=0;i<arr_id.length;i++){
						int id = i.getProduct_id();
						Product product = Shop_sql.find_product(id);
						int amount = Shop_sql.checkCartAmount(username, product.getId());
						int price = product.getPrice();
						String img = product.getImg_src();
						String pro_name = product.getName();
						int subtotal = price * amount;
						total = total + subtotal;
						amount_list = amount_list + amount + ",";
			%>
			<tr align="center" >
				<td width="20%"><img src="<%=img %>" width="80"></td>
				<td width="20%"><%=pro_name %></td>
				<td width="20%"><%=price %></td>
				<td width="20%"><%=amount %></td>
				<td width="20%"><%=subtotal %></td>
			</tr>
			<%
				}
			%>
		</table>	
	</div>	
	
	<div class="confirm">
		<table border="groove" id="confirm-table" width="80%" cellspacing="0" cellpadding="0">	
			<%
				}else{
					String user = request.getParameter("username");
					int id = Integer.parseInt(request.getParameter("id"));
					//data = id+"";
					Product p = Shop_sql.find_product(id);
					String img = p.getImg_src();
					String pro_name = p.getName();
					int price = p.getPrice();
					int amount = Shop_sql.checkCartAmount(user, p.getId());
					total = price * amount;
					amount_list = amount+"";
			%>
			<tr align="center" >
				<td width="20%"><img src="<%=img %>" width="80"></td>
				<td width="20%"><%=pro_name %></td>
				<td width="20%"><%=price %></td>
				<td width="20%"><%=amount %></td> 
				<td width="20%"><%=total %></td> 
			</tr>
		</table>	
	</div>
			<%
				}
			%>

	<div class="buy-now">
		<div class="order-info">
			合计:<span id=total>￥<%=total %></span>
			<br>
			寄送至：xxx,xxx,xxx,xxx,xxxxxxxxxxxxxx<br>
			收件人：xxx<br>
			手机号码：xxx xxxx xxxx<br>
		</div>
		
		<div class="btn">
			<div id="backToCart">
				<a href="Mycart.jsp">返回购物车</a> 
			</div>
			<div id="submitOrder">
				<input type="hidden" value="aa" name="id">
				<!-- 组合所有订单的id和amount变成字符串传递 -->
				<a href="AddOrder_Servlet?username=<%=a.getName()%>&id_list=&amount_list=<%=amount_list%>"><b>提交订单</b></a>
				
			</div>
		</div>
	</div>
    <br><br><br>

	<div style="height: 50px;"></div>
	<jsp:include page="footer.jsp"></jsp:include>



</div>

</body>
</html>