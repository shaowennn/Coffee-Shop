<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Shop.Product, java.util.List"%>
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
		<table class="table table-striped" border="groove" width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" colspan="5">
					<h2>所有商品信息</h2>
				</td>
			</tr>
			<tr align="center">
				<td><b>图片</b></td>
				<td><b>编号</b></td>
				<td><b>名称</b></td>
				<td><b>价格</b></td>
				<td><b>详情</b></td>
			</tr>
			<%
				@SuppressWarnings("unchecked")
				List<Product> list = (List<Product>)request.getAttribute("list");
				if(list==null){
					out.println("null");
				}else{
					for(Product p:list){
						int id = p.getId();
			%>		
			<tr class="info_list" align="center" onclick="location.href='<%=request.getContextPath() %>/Product_info_Servlet?id=<%=id%>'">
				<td><img src=<%=p.getImg_src() %> alt="" height=100px></td>
				<td><%=p.getId() %></td>
				<td><%=p.getName() %></td>
				<td><%=p.getPrice() %></td>
				<td><%=p.getDetail() %></td>
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