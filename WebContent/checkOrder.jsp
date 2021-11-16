<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>我的订单页</title>
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
<h1>这是我的订单</h1>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>