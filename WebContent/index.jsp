<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Shop.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
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
.ind-middle{
width: 98%;
}
.ind-btn{
	float: right;
	margin-top: 3px;
}
.hot-product{
	margin-top: 2%;
	width: 100%;
	padding-left: 1%;
	padding-right: 1%;
}
.hot-pro-title{
	width: 80%;
	margin-top: 2%;
	padding-left: 1%;
	padding-bottom: 1%;
	padding-top: 1%;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="ind-middle">
	<div class="hot-product">
		<div class="hot-pro-title">
			<h2>热销商品</h2>
		</div>
		<marquee behavior="alternate" direction="left" width="100%" height="300px" scrollamount="5" bgcolor="#F0F8FF" align="middle" >
			<img src="image/1.png" width="300px" height="300px" />
			<img src="image/2.png"width="300px" height="300px" />
			<img src="image/3.jpg"width="300px" height="300px" />
			<img src="image/4.png"width="300px" height="300px" />
			<img src="image/5.jpg" width="300px" height="300px" />
			<img src="image/6.jpg" width="300px" height="300px" />
			<img src="image/7.jpg" width="300px" height="300px" />
			<img src="image/8.jpg" width="300px" height="300px" />
		</marquee>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>