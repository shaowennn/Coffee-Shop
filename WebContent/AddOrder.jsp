<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<title>下单成功页</title>
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
	width: 30%;
	text-align: center;
}
#submitOrder a{
	color: white;
}
</style>

</head>
<jsp:include page="header.jsp"></jsp:include>
<body>

<h1>下单成功</h1>

<p>您好，感谢您的订单，商家已收到并且进行配送！</p>
<p>我们将进行“货到付款”的方式配送</p>

<p>您可以在<a href="Order_list_Servlet" style="color:red">我的订单</a>当中查看您的历史订单，谢谢！</p>
<p>您也可以回到<a href="index.jsp" style="color:red">首页</a>继续浏览商品，祝您购物愉快</p>

<p>您的订单将会马上安排配送，请耐心等待！<p>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>