<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Shop.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.loli.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.css">
<style type="text/css">
body{
	font-family:Open Sans;
	background-color:#fff;
}

*{margin:0; padding:0;}
a{
	text-decoration: none;
	color: black;
}
li{
	float: left;
	list-style: none;
}
#middle{
	width: 8%;
}
#short{
	width: 5%;
}
#long{
	width: 15%;
}
.header{
	max-width: 100%;

}
.navigation{
	border:solid white 1px;
	height: 50px;
	background-color:white;
	padding-right: 2%;
}

.username{
	float: left;
	padding-left: 6%;
	padding-right: 10%;
}
.user{
	float: right;
 	display: inline;
 	width: 20%;
}
.user input{
	border: none;
	font-size: large;
	font-weight: bold;
	cursor: pointer;
}
.ol-list{
	margin-top: 15px;
	margin-left: 15px;
}
</style>
</head>
<body>

<div class="header" >
	<img width="100%" src="./image/header.jpg">
</div>

<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation"> 
    <div class="container-fluid"> 
        <div class="navbar-header"> 
        <a class="navbar-brand" href="./index.jsp">首页</a> 
    </div> 
    <div>
		<ul class="nav navbar-nav">
			<li><a href="<%=request.getContextPath()%>/Product_list_Servlet">咖啡介绍</a></li>
			<li><a href="<%=request.getContextPath()%>/Search_Servlet">点单区</a></li>
			<li><a href="<%=request.getContextPath()%>/Mycart.jsp">购物车</a></li>
			<li><a href="<%=request.getContextPath()%>/Order_list_Servlet">已购订单</a></li>
		</ul>
		
		<ul class="nav navbar-nav navbar-right">
				<%
					User user = (User) session.getAttribute("user");
					if(user!=null){
				%>
				<li class="">
					<a>用户名:<%=user.getName()%></a>
				</li>
				<li class="">
					<a value="退出登录" onclick="location.href='<%=request.getContextPath()%>/exit.jsp'">退出登录</a>
				</li>
				<%
					}else{
				%>
				<li class="">
					<a href="<%=request.getContextPath()%>/login.jsp">登录</a>
				</li>
				<li class="">
					<a href="<%=request.getContextPath()%>/register.jsp">注册</a>
				</li>
				<%
					}
				%>
		</ul>
	</div>
</nav>

</div>
</body>
</html>