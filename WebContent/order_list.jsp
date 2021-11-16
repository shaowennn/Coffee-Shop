<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Shop.Order, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品列表</title>
<style type="text/css">
*{margin:0; padding:0;}
a{
	text-decoration: none;
	color: black;
}
.info_list:hover{
	cursor:pointer;
	background-color: silver;
}
.list-footer{
	background-color: #FFcc66;
	height: 50px;
	width: 100%;
	float: left;
}
.list-header{
    height: 75px;
	border: solid;
	border-color: #FFcc66;
	background-color: #FFcc66;
	padding-top: 20px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="list-middle">
	<div id="product_list" style="width: 100%;">
		<table border="groove" width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" colspan="5">
					<h2>所有订单信息</h2>
				</td>
			</tr>
			<tr align="center">
				<td><b>下单用户</b></td>
				<td><b>商品编号</b></td>
				<td><b>商品数量</b></td>
				<td><b>订单状态</b></td>
			</tr>
			<%
				@SuppressWarnings("unchecked")
				List<Order> list = (List<Order>)request.getAttribute("list");
				if(list==null){
					out.println("null");
				}else{
					for(Order p:list){
						int id = p.getProduct_id();
			%>		
			<tr class="info_list" align="center" onclick="location.href='<%=request.getContextPath() %>/Product_info_Servlet?id=<%=id%>'">
				<td><%=p.getUsername() %></td>
				<td><%=p.getProduct_id() %></td>
				<td><%=p.getAmount() %></td>
				<td><%=p.getStatus() %></td>	
			</tr>
			<%
					}
				}
			%>
		</table>
	</div>
</div>
<div style="height: 50px;"></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>