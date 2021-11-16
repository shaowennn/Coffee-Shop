<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Shop.Product, Shop.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品信息</title>
<style type="text/css">
*{margin:0; padding:0;}
a{
	text-decoration: none;
	color: black;
}
li{
	float: left;
	list-style: none;
	padding-left: 20px;
}
.up{
	background-color:#FFFFFF;
	width: 90%; 
	height: 350px;
	float: left;
	margin-left: 5%;
}
.picture{
	border: groove; 
	width: 40%; 
	height: 306px; 
	float: left;
	margin-left: 5%;
	margin-top: 5%;
}
.navigation{
	width: 100%;
	height: 30px;
	background-color:#FFFFFF;
}
.info{
	border: groove; 
	width: 40%; 
	height: 306px; 
	float: left; 
	margin-left: 5%;
	margin-top: 5%;
}
.info-middle{
	float: left;
	width: 100%;
	margin-top: 1%;
}
.details{
	background-color:#FFFFFF;
	border: groove; 
	width: 90%; 
	height: 300px;
	margin-top: 1%;
	margin-bottom: 2%;
	float: left;
	margin-left: 5%;
}
.info-footer{
	background-color:#FFFFFF;
	height: 50px;
	width: 100%;
    float: left;
	bottom: 0px;
}
.info-header{
    height: 75px;
	border: solid;
	border-color:#FFFFFF;
	background-color:#FFFFFF;
	padding-top: 20px;
}
.main{
	margin-top: 5%;
	margin-left: 20%;
	
}
.main a:hover{
	border: none;
}
.text{
	height: 35px;
	width: 35px;
	float: left;
	padding-top:10px;
	margin-left: 5%;
	vertical-align: middle;
	font-weight: bold;
}
.cart{
	height: 50px;
	border: solid;
	width: 85px;
	float: left;
	margin-left: 5%;
}
.addToCart{
	height: 35px;
	border: solid;
	width: 90px;
	float: left;
	padding-top:10px;
	padding-left: 7px;
	margin-left: 5%;
	vertical-align: middle;
	border-radius:20px;
	cursor: pointer;
}
.addToCart input{
	border: none;
	background:#FFFFFF;
	font-weight: bold;
	font-size: medium;
}
.number{
	float: left;
}
#num{
	width: 40px;
	height: 40px;
	text-align: center;
	vertical-align: top;
	font-size: 20px;
	height: 45px;
	border: none;
	background:#FFFFFF;
}
.btn2{
	float: left;
	display: inline;
	cursor: pointer;
}
.control2{
	width: 40px;
	height: 20px;
	text-align: center;
	float: left;
	font-size: 20px;
	height: 20px;
	border: none;
} 
.NoLogin{
	margin-top: 12%;
	margin-left: 40%;
}
.NoLogin a:hover {
	border: none;
}
.errorMsg{
	color: red;
	width: 80%;
	float: left;
	margin-top: 5%;	
	margin-left: 5%;
}
</style>
</head>
<body>
<script type="text/javascript">
function btn_add() {
	var num = document.getElementById("num");
	a = parseInt(num.value);
	a = a+1;
	num.value = a;
}
function btn_sub() {
	var num = document.getElementById("num");
	a = parseInt(num.value);
	if(a>1){
		a = a-1;
		num.value = a;
	}
}
</script>
<jsp:include page="header.jsp"></jsp:include>

<div class="info-middle">
	
	<div class="up">
		<%
			Product product = (Product) session.getAttribute("product");
		%>
		<div class="picture">
			<center><img src=<%=product.getImg_src() %> alt="" height="300px;"></center>
		</div>
		<div class="info">
			<center><h2>商品信息</h2></center>
			<center>
				<table border="groove" width="90%" cellspacing="0" cellpadding="0">
					<tr height="30px"><td>编号:<%=product.getId() %></td></tr>
					<tr height="30px"><td>名称:<%=product.getName() %></td></tr>
					<tr height="30px"><td>价格:<%=product.getPrice() %>元</td></tr>
					<tr height="30px"><td>介绍:<%=product.getDetail() %></td></tr>
				</table>
			</center>
			
			
			<%
				User user = (User) session.getAttribute("user");
				if(user!=null){
			%>
			<div class="main">
				<div class="text">
					数量
				</div>
				<form action="<%=request.getContextPath()%>/Cart_Servlet" method="post">
					<div class="cart">
						<div class="number">
							<input type="text" value="1" id="num" name="amount" >
							<input type="hidden" value="<%=product.getId() %>" name="id">
							<input type="hidden" value="<%=user.getName() %>" name="username">
						</div>
						<div class="btn2">
							<a class="control2"  onclick="btn_add()">+</a><br>
							<a class="control2"  onclick="btn_sub()">-</a>
						</div>
					</div>
					
					<div class="addToCart">
						<input type="submit" value="加入购物车" style="font-size:14px;">
					</div>
				</form>
			</div>
			
			<div class="errorMsg">
				<%
						if(request.getAttribute("fail")!= null){
							out.print("<center>不知名错误</center>");	
						}
				%>
			</div>
			
			<% 
				}else{
					
			%>
			
			<div class="NoLogin">
				<h2><a href="<%=request.getContextPath()%>/login.jsp">请先登录</a></h2>
			</div>
				
			<%
				}
			%>
		</div>
	</div>
	
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>