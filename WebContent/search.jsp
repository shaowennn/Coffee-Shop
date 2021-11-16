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

<div class="container" style="padding: 20px;">
	<div class="row">
	
			<%
				@SuppressWarnings("unchecked")
				List<Product> list = (List<Product>)request.getAttribute("list");
				if(list==null){
					out.println("null");
				}else{
					for(Product p:list){
						int id = p.getId();
			%>		
			
			<div class="col-sm-6 col-md-3">
		        <div class="thumbnail" style="padding:15px;box-shadow:0px 0px 5px 3px #ccc;">
		            <img src=<%=p.getImg_src()%>  
		            	class="img-rounded img-responsive center-block" 
		                height="100px" width="250px"
		                style="border-radius:15px;background-color: transparent;box-shadow:0px 0px 5px 3px #ccc;"
		                alt="我是咖啡的配图">
		            <div class="caption">
		                <h4><%=p.getName()%></h4> 
		                <a style="display:none;">编号：<%=p.getId() %></a>
		                <div class="btn-group">
		                <h4>¥ <%=p.getPrice()%></h4>
	                    <button class="btn btn-warning" role="button" onclick="location.href='<%=request.getContextPath() %>/Product_info_Servlet?id=<%=id%>'">选我</button>
	                    </div>
		            </div>
		        </div>
	    	</div>
			
			<%
					}
				}
			%>
			
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>