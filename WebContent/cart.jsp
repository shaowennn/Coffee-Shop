<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">
*{margin:0; padding:0;}
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
	font-weight: bold;
	border-radius:20px;
	cursor: pointer;
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
	background: #FDDB8A;
}
.btn{
	float: left;
	display: inline;
	cursor: pointer;
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
function add_to_cart() {
	alert("成功");
}
</script>

<div class="main">
	<div class="text">
		数量
	</div>
	<div class="cart">
		<div class="number">
			<input type="text" value="1" id="num" >
		</div>
		<div class="btn">
			<a class="control"  onclick="btn_add()">+</a><br>
			<a class="control"  onclick="btn_sub()">-</a>
		</div>
	</div>
	<div class="addToCart" onclick="add_to_cart()">
		<a href="Mycart.jsp">加入购物车</a>
	</div>
</div>
