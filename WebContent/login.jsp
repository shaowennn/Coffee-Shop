<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录</title>
<style type="text/css">
*{margin:0; padding:0;}
a{
	text-decoration: none;
	color: black;
}
.log-middle{
	background:url("image/main_bg.png");
	height:550px;
}
.login{
    border-radius:10px;
	margin-top:80px;
	border: solid;
	border-bottom-color::#3C3C3C;
	width: 300px;
	float: left;
	padding-top: 2%;
	background-color: white;
}
.log-header{
	height: 75px;
	border: solid;
	border-color:#F0F8FF;
	background-color:#F0F8FF;
	padding-top: 20px;
}
.log-button{
	margin-top:10px;
	margin-left: 90px;
}
.log-footer{
	background-color: #FFcc66;
	height: 100px;
	width: 100%;
	position: fixed;
	bottom: 0px;
}
.title{
	float: left;
	width: 50%;
	top: 200px;
	margin-top: 75px;
}
.errorMSG{
	margin-left: 20%;
	height: 20px;
}
</style>

</head>
<body>
<script type="text/javascript">
function check_name() {
	username = document.getElementsByName("username")[0].value;
	document.getElementsByClassName("errorMSG")[0].innerHTML = "";
	if(username==""){
		document.getElementsByClassName("errorMSG")[0].innerHTML = "<center><b>用户名不能为空!!</b></center>";
	}else{
		document.getElementsByClassName("errorMSG")[0].innerHTML = "";
	}
}
function check_psw(){
	
	password = document.getElementsByName("password")[0].value;
	if(password==""){
		document.getElementsByClassName("errorMSG")[1].innerHTML = "<center><b>密码不能为空!!</b></center>";
	}else{
		document.getElementsByClassName("errorMSG")[1].innerHTML = "";
	}
}
function check(){
	
	username = document.getElementsByName("username")[0].value;
	password = document.getElementsByName("password")[0].value;
	if(username=="" || password==""){
		document.getElementsByClassName("errorMSG")[1].innerHTML = "<center><b>账号和密码不能为空!!</b></center>";
		return false;
	}
	return true;
}
</script>

<jsp:include page="header.jsp"></jsp:include>



<div class="log-middle">

    <div class="title" style="color:white; margin-top:100px;">
		<center><h1>你好</h1></center>
		<center><h3>欢迎来到小豆花的咖啡店</h3></center>
	</div>

	<div class="login">
		<form action="<%=request.getContextPath()%>/Login_servlet" method="post" onsubmit="return check();">
			<center>用&nbsp;&nbsp;户&nbsp;&nbsp;名:<input type='text' name='username' onblur="check_name()"></center>
			<div class="errorMSG"></div>
			
			<center>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name='password' onblur="check_psw()"></center>
			<div class="errorMSG"></div>
			
			<center>验&nbsp;&nbsp;证&nbsp;&nbsp;码:<input style="margin-left:10px;" size='12' type='text' name='yanzheng' onblur=""><img src="/CoffeeShop/validateCodeServlet" /></center>
			
			
			<div class="log-button">
				<input type="submit" value='立即登录'>
				&emsp;
				<input type="button" value='没有账号' onclick="location.href='<%=request.getContextPath()%>/register.jsp'">
			</div>
			<br>
		
			<% 
				if(request.getAttribute("errorMsg")!= null){
					out.print("<center>"+request.getAttribute("errorMsg")+"</center>");	
				}
			%>
			
		</form>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>