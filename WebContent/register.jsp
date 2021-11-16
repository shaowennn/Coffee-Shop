<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册</title>
<style type="text/css">
*{margin:0; padding:0;}
a{
	text-decoration: none;
	color: black;
}
.register{
    border-radius:10px;
	margin-top:80px;
	border: solid;
	border-bottom-color:#3C3C3C;
	width: 300px;
	float: left;
	padding-top: 2%;
	background-color: white;
}
.reg-header{
	height: 75px;
	border: solid;
	border-color:#F0F8FF;
	background-color:#F0F8FF;
	padding-top: 20px;
}
.reg-middle{
	background:url("image/main_bg.png");
	height:550px;
}
.reg-footer{
	background-color:#F0F8FF;
	height: 50px;
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
.reg-button{
	margin-left: 90px;
	float: left;
	margin-bottom: 2%;
}
.errorMSG{
	margin-left: 20%;
	height: 20px;
	float: left;
	width: 70%;
}
#tip{
	float: left;
}
.textbox{
	float: left;
	width: 80%;
	margin-left: 5%;
}
</style>
</head>
<body>
<script type="text/javascript">
function check_name() {
	username = document.getElementsByName("username")[0].value;
	if(username == ""){
		document.getElementsByClassName("errorMSG")[0].innerHTML = "<center><b>用户名不能为空!!</b></center>";
	}else{
		document.getElementsByClassName("errorMSG")[0].innerHTML = "";
		if(getResult()){
			return true;
		}else{
			return false
		}
	}
}
function check_email() {
	email = document.getElementsByName("phone")[0].value;
	if(email == ""){
		document.getElementsByClassName("errorMSG")[1].innerHTML = "<center><b>邮箱不能为空!!</b></center>";
	}else{
		var myreg=/^(([^()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(myreg.test(email)){
			document.getElementsByClassName("errorMSG")[1].innerHTML = "<center><b>邮箱号正确!!</b></center>";
		}else{
			document.getElementsByClassName("errorMSG")[1].innerHTML = "<center><b>邮箱号错误!!</b></center>";
		}
	}
}
function check_phone() {
	phone = document.getElementsByName("email")[0].value;
	if(phone == ""){
		document.getElementsByClassName("errorMSG")[2].innerHTML = "<center><b>手机号不能为空!!</b></center>";
	}else{
		var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
		if(myreg.test(phone)){
			document.getElementsByClassName("errorMSG")[2].innerHTML = "<center><b>手机号正确!!</b></center>";
		}else{
			document.getElementsByClassName("errorMSG")[2].innerHTML = "<center><b>手机号错误!!</b></center>";
		}
	}
}
function check_psw(){
	password = document.getElementsByName("password")[0].value;
	if(password==""){
		document.getElementsByClassName("errorMSG")[3].innerHTML = "<center><b>密码不能为空!!</b></center>";
	}else{
		if(check_confirm()){
			document.getElementsByClassName("errorMSG")[3].innerHTML = "<center><b>两次密码不一样!!</b></center>";
		}
		document.getElementsByClassName("errorMSG")[3].innerHTML = "";
	}
}
function check_confirm(){
	password = document.getElementsByName("password")[0].value;
	confirm = document.getElementsByName("confirm")[0].value;
	if(password != confirm){
		document.getElementsByClassName("errorMSG")[4].innerHTML = "<center><b>两次密码不一样!!</b></center>";
		return true;
	}else{
		document.getElementsByClassName("errorMSG")[4].innerHTML = "";
		return false;
	}
}
function check(){
	username = document.getElementsByName("username")[0].value;
	password = document.getElementsByName("password")[0].value;
	confirm = document.getElementsByName("confirm")[0].value;
	if(username=="" || password==""){
		document.getElementsByClassName("errorMSG")[2].innerHTML = "<center><b>账号和密码不能为空!!</b></center>";
		return false;
	}else{
		if(password != confirm){
			document.getElementsByClassName("errorMSG")[2].innerHTML = "<center><b>两次密码不一样!!</b></center>";
			return false;
		}
	}
	return true;
}
function ifExist(){
	var xmlHttp;
	try{
		 // 适用于IE7+, Firefox, Chrome, Opera, Safari
		 xmlHttp = new XMLHttpRequest();
	}catch(e){
		try{
			//Internet Explorer
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				// 适用于IE6, IE5
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){
				xmlHttp = false;
			}
		}
	}
	return xmlHttp;
}
function getResult() {
	var flag = true;
	var name = document.getElementsByName("username")[0].value;
	
	//1.创建对象
	var http_request = ifExist();
	
	//2.发送请求
	http_request.open("POST","Test_Servlet",true);//true表示异步提交
	
	//注册状态改变监听，获取服务器传送过来的数据
	http_request.onreadystatechange=function(){
		if(http_request.readyState == 4){
			if(http_request.status == 200){
				var data=http_request.responseText;//获取CheckUserNameServlet中response中存储的值
				if(data == 1){
					document.getElementById("tip").innerHTML = "<font color='red'> X </font>";
					flag=false;
				}else{
					document.getElementById("tip").innerHTML="<font color='green'>√</font>"
					flag=true;
				}
			}
		}
	}
	
	//如果是post方式带数据，那么这里要添加头，说明提交的数据类型是一个经过url编码的form表单数据
	http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
	
	//带数据过去，在send方法里填写表单数据
	http_request.send("name="+name);
	
	return flag;
}

</script>

<jsp:include page="header.jsp"></jsp:include>

<div class="reg-middle">

    <div class="title" style="color:white; margin-top:150px;" >
		<center><h1>你好</h1></center>
		<center><h3>欢迎来到小豆花的咖啡店</h3></center>
	</div>

	<!-- onsubmit="return check()" -->
	<div class="register">
		<form name="userinfo" action="<%=request.getContextPath()%>/Register_servlet" method="post" onsubmit="return check()">
		<div id="name">
			<center>
				<div class="textbox">
					用&nbsp;&nbsp;户&nbsp;&nbsp;名:<input type='text' name='username' onblur="check_name()">
				</div>
				<div id="tip"></div>
			</center>
		</div>
		<div class="errorMSG"></div>
		<div class="textbox"><center>
				邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:<input type='text' name='phone' onblur="check_email()"></center>
		</div>
		<div class="errorMSG"></div>
		<div class="textbox"><center>
			手&nbsp;&nbsp;机&nbsp;&nbsp;号:<input type='text' name='email' onblur="check_phone()"></center>
		</div>
		<div class="errorMSG"></div>
		<div class="textbox">
			<center>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type='password' name='password' onblur="check_psw()"></center>
		</div>
		<div class="errorMSG"></div>
		<div class="textbox">
			<center>确认密码:<input type="password" name='confirm' onblur="check_confirm()"></center>
		</div>
		<div class="errorMSG"></div>
		<div class="reg-button">
			<input type="submit" value='注册'>
			&emsp;
			<input type="button" value='已有账号' onclick="location.href='<%=request.getContextPath()%>/login.jsp'">
		</div>
		<br>
		<div class="errorMSG">
			<% 
				if(request.getAttribute("errorMsg")!= null){
					out.print("<center>"+request.getAttribute("errorMsg")+"</center>");	
				}
			%>
		</div>
		</form>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>