<%@ page import="Shop.Shop_sql, Shop.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Shop.Cart, Shop.User, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>购物车</title>
<style type="text/css">
*{margin:0; padding:0;}
.statistics{
	margin-left: 2%;
	width: 90%;
}
.cart{
	border: solid;
	width: 80%;
	margin-left: 10%;
}
.op{
	cursor: pointer;
}
.op a:hover{
	border: none;
}
.name a:hover{
	border: dashed;
	
}
#table-head{
	border-bottom: none;
}
#choose-number{
	border: none;
	background: white;
	color: black;
	font-size: medium;
	width: 10px;
}
#choose-total{
	border: none;
	background: white;
	color: black;
	font-size: medium;
}
#total{
	 font-size: 20px;
	 float: right;
	 margin-right: 3%;
	 cursor: pointer;
}
.cart-amount{
	height: 55px;
	border: solid;
	width: 115px;
	float: left;
	margin-left: 10%;
}
.number{
	float: left;
}
.num{
	width: 40px;
	height: 40px;
	text-align: center;
	vertical-align: top;
	font-size: 20px;
	height: 45px;
	border: none;
	background: white;
}
.btn{
	float: left;
	display: inline;
	cursor: pointer;
}
.btn a:hover{
	border: none;
}
.control{
	width: 40px;
	height: 20px;
	text-align: center;
	float: left;
	font-size: 20px;
	height: 20px;
	border: none;
}
</style>
</head>
<body>
<script type="text/javascript">
function createHttp(){
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
function getResult(username, id, count) {
	var flag = true;
	var amount = document.getElementsByClassName("num")[count-1].value;
	
	//1.创建对象
	var http_request = createHttp();
	
	//2.发送请求
	http_request.open("POST","ModifyAmount_Servlet",true);//true表示异步提交
	
	//注册状态改变监听，获取服务器传送过来的数据
	http_request.onreadystatechange=function(){
		if(http_request.readyState == 4){
			if(http_request.status == 200){
				var result = http_request.responseText;//获取CheckUserNameServlet中response中存储的值
				if(result){ //result=true时，数据修改成功
					flag = true;
				}else{   //result=false时，数据修改失败
					alert("getResult:fail");
					flag = false;
				}
			}
		}
	}
	
	//如果是post方式带数据，那么这里要添加头，说明提交的数据类型是一个经过url编码的form表单数据
	http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
	
	//带数据过去，在send方法里填写表单数据
	data = "username=" + username + "&id=" + id + "&amount=" +amount
	http_request.send(data);
	
	return flag;
}
function buyAll(name){
	var choose = document.getElementsByClassName("choose");
	var id = document.getElementsByClassName("id");
	var data = "";
	//var arr_id = new Array();
	var count = 0;
	for(i=0;i<choose.length;i++){
		if(choose[i].checked){
			count++;
			//alert(id[i].value);
			//arr_id.push(id[i].value);
			data = data + id[i].value + ","
		}
	}
	
	if(count!=0){
		location.href="confirm_order.jsp?arr_id="+data+"&name="+name;
	}
	
}
</script>


<jsp:include page="header.jsp"></jsp:include>

<%
	User user = (User) session.getAttribute("user");
	if(user!=null){
		String name = user.getName();
		List<Cart> all_cart = Shop_sql.cart_list(user.getName());
%>

<div class="cart-middle">

	<div class="title">
		<center><h2>购物车</h2></center>
	</div>
	<div class="bar">
		<div >
			
		</div>
	</div>
	<div class="cart">
		<div class="statistics">
			<ul>
				<li>全部商品&nbsp;<%=all_cart.size() %>&nbsp;&nbsp;</li>
				<li>已选商品&nbsp;<input id="choose-number" type="text"size="0" value="0" disabled="disabled">&nbsp;&nbsp;</li>
				<li>合计&nbsp;<input id="choose-total" type="text" value="0" disabled="disabled"></li>
				<li id="total" onclick="buyAll('<%=name%>')">结算</li>
			</ul>
		</div>
		<table border="groove" id="table-head" width="100%" cellspacing="0" cellpadding="0">
			<tr align="center" >
				<td width="5%">全选&nbsp;<input id="all" type="checkbox"></td>
				<td width="20%">商品图片</td>
				<td width="20%">商品名称</td>
				<td width="10%">商品单价</td>
				<td width="20%">商品数量</td>
				<td >操作</td>
			</tr>
		</table>
		<%
			
			if(all_cart==null){
				out.println("null");
			}else{
				int count=0;
				for(Cart i:all_cart){
					count++;
					Product product = Shop_sql.find_product(i.getProduct_id());
		%>	
			<input type="hidden" value="<%=i.getProduct_id()%>" class="id">	
			<table border="groove" width="100%" cellspacing="0" cellpadding="0">
				<tr align="center" >
					<td width="5%"><input type="checkbox" class="choose"></td>
					<td width="20%"><img alt="" src="<%=product.getImg_src()%>" width="50%"></td>
					<td width="20%">
						<span class="op"><a href="<%=request.getContextPath() %>/Product_info_Servlet?id=<%=i.getProduct_id()%>">
							<%=product.getName()%>
						</a></span>
					</td>
					<td width="10%" class="price"><%=product.getPrice()%></td>
					<td width="20%" class="amount">
						
						<div class="cart-amount">
							<div class="number">
								<input type="text" value="<%=i.getAmount() %>" class="num" onchange="text_change(<%=count %>),getResult('<%=name%>', <%=i.getProduct_id()%>, <%=count %>)">
							</div>
							<div class="btn">
								<a class="control"  onclick="btn_add(<%=count %>),getResult('<%=name%>', <%=i.getProduct_id()%>, <%=count %>)">+</a><br>
								<a class="control"  onclick="btn_sub(<%=count %>),getResult('<%=name%>', <%=i.getProduct_id()%>, <%=count %>)">-</a>
							</div>
						</div>
					</td>
					<td>
						
						<span class="op"><a href="delCart_Servlet?username=<%=i.getUsername() %>&id=<%= i.getProduct_id()%>">删除</a></span><br>
						<%
							int id = i.getProduct_id();
						%>
						
						
					</td>
				</tr>
			</table>
			
			
		<%
				}
			}
		%>
		
	</div>
	
	<br>
	
	<blockquote class="pull-right">
	<span class="op"><a class="btn btn-danger" href="confirm_order.jsp?username=<%=name %>">立即购买</a></span>
	<small> << 点我马上喝咖啡 <cite title="Source Title">店长小豆花</cite></small>
	</blockquote>
	
	<br><br><br><br>

	<script>
		var arrch=document.getElementsByClassName("choose");
		var oall=document.getElementById("all");
		var selected_amount;
		var selected_total;
		var amount=document.getElementsByClassName("num");
		var price=document.getElementsByClassName("price");
		
		oall.onclick=function(){
			selected_total = 0;
			if (oall.checked) {
				for (i=0;i<arrch.length;i++) {
					arrch[i].checked=true;
					var price_per = parseInt(price[i].innerHTML);
					var amount_per = parseInt(amount[i].value); 
					var subtotal = price_per * amount_per;
					selected_total = selected_total + subtotal;
				}
				document.getElementById("choose-number").value=<%=all_cart.size()%>;
				document.getElementById("choose-total").value = selected_total;
			} else if(!oall.checked){
				for (i=0;i<arrch.length;i++) {
					arrch[i].checked=false;
				}
				document.getElementById("choose-number").value=0;
				document.getElementById("choose-total").value=0;
			}
		}
		
		for (i=0;i<arrch.length;i++) {
			//为全部多选框加监听器
			arrch[i].onclick=function(){
				oall.checked=true;
				selected_amount = 0;
				selected_total = 0;
				for (x=0;x<arrch.length;x++) {
					if(!arrch[x].checked){
						oall.checked=false;
					}else{
						selected_amount++;
						
						var price_per = parseInt(price[x].innerHTML);
						var amount_per = parseInt(amount[x].value); 
						var subtotal = price_per * amount_per;
						selected_total = selected_total + subtotal;
						
					}
				}
				document.getElementById("choose-number").value = selected_amount;
				document.getElementById("choose-total").value = selected_total;
			}
		}
		
		var num = document.getElementsByClassName("num");
		function btn_add(i) {
			/*
			 *	i = count = 是第几个商品 = 在classname中的索引
			 *  a = 商品数量
			 */
			
			 //修改商品数量
			a = parseInt(num[i-1].value);
			a = a+1;
			num[i-1].value = a;
			
			//点击按钮时自动选中这个商品
			if(!arrch[i-1].checked){
				arrch[i-1].checked=true;
			}
			
			//假设全选，遍历商品的多选框，如果出现没有选中的情况，取消全选
			oall.checked=true;
			
			//重置选中个数和合计金额
			selected_amount = 0;
			selected_total = 0; 
			for (x=0;x<arrch.length;x++) { //遍历多选框，查看选择情况
				if(!arrch[x].checked){
					oall.checked=false;
				}else{ //不改变全选状态的情况
					
					selected_amount++; //统计被选择商品的数量
					var price_per = parseInt(price[x].innerHTML);
					var amount_per = parseInt(amount[x].value); 
					var subtotal = price_per * amount_per;         //计算小结
					selected_total = selected_total + subtotal;    //计算合计
					
				}
			}
			
			//重写已选商品数量和商品合计
			document.getElementById("choose-number").value = selected_amount;
			document.getElementById("choose-total").value = selected_total;
		}
		function btn_sub(i) {
			/*
			 *	i = count = 是第几个商品 = 在classname中的索引
			 *  a = 商品数量
			 */
			
			//修改商品数量
			a = parseInt(num[i-1].value);
			if(a>1){
				a = a-1;
				num[i-1].value = a;
			}
			
			//点击按钮时自动选中这个商品
			if(!arrch[i-1].checked){
				arrch[i-1].checked=true;
			}
			
			//假设全选，遍历商品的多选框，如果出现没有选中的情况，取消全选
			oall.checked=true;
			
			//重置选中个数和合计金额
			selected_amount = 0;
			selected_total = 0;
			for (x=0;x<arrch.length;x++) {
				if(!arrch[x].checked){
					oall.checked=false;
				}else{ //不改变全选状态的情况
					
					selected_amount++; //统计被选择商品的数量
					var price_per = parseInt(price[x].innerHTML);
					var amount_per = parseInt(amount[x].value); 
					var subtotal = price_per * amount_per;       //计算小结
					selected_total = selected_total + subtotal;  //计算合计
					
				}
			}
			
			//重写已选商品数量和商品合计
			document.getElementById("choose-number").value = selected_amount;
			document.getElementById("choose-total").value = selected_total;
		}
		
		function text_change(i) {
			
			a = parseInt(num[i-1].value);
			
			if(parseInt(num[i-1].value)){ //可转换为数字
				//点击按钮时自动选中这个商品
				if(!arrch[i-1].checked){
					arrch[i-1].checked=true;
				}
				
				//假设全选，遍历商品的多选框，如果出现没有选中的情况，取消全选
				oall.checked=true;
				
				//重置选中个数和合计金额
				selected_amount = 0;
				selected_total = 0;
				for (x=0;x<arrch.length;x++) {
					if(!arrch[x].checked){
						oall.checked=false;
					}else{ //不改变全选状态的情况
						
						selected_amount++; //统计被选择商品的数量
						var price_per = parseInt(price[x].innerHTML);
						var amount_per = parseInt(amount[x].value); 
						var subtotal = price_per * amount_per;       //计算小结
						selected_total = selected_total + subtotal;  //计算合计
						
					}
				}
				
				//重写已选商品数量和商品合计
				document.getElementById("choose-number").value = selected_amount;
				document.getElementById("choose-total").value = selected_total;
			}else{     //不可转换为数字
				num[i-1].value = 1
			}
		}
	</script>
	
	<div style="height: 50px;"></div>
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

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>