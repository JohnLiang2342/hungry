<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<script src="js/jquery/2.0.0/jquery.min.js" charset="utf-8"></script>
<script src="css/layui/layui.js"></script>
<link rel="stylesheet" href="css/layui/css/layui.css">
</head>
<style type="text/css">
	body{
		background: #eeeeee;
	}
	div.big_div{
		width:1900px;
	}
	
	#div_nav_top{
	width:100%;
			
	}
	#div_nav_item{
		display: inline;
		margin-left: 5px;
	}
	#div_cart{
		width:1200px;
		
		
		margin:0 auto ;
		margin-top: 80px;
		
		/*border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;*/
		
		
	}

	.float{
		float: left;
	}


	#div_cart_item_box{
		margin-top:30px ;
	}
	.div_cart_item{
		
		width:800px;
		height:130px;
		
		margin:0 auto ;
		margin-top: 15px;
		margin-bottom: 15px;
		
		border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;
	}
	#div_total_count{
		width:900px;
		height:50px;
		
		margin:0 auto ;
		margin-top: 15px;
		
		border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;
		
		background: #d2d2d2;
	}
	
	div.input_area_box{
		width: 900px;
		margin:0 auto ;
		margin-top: 80px;
								
		/*border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;*/
	}
	
	div.input_area_title{			
		font-family: "微软雅黑";			
		font-size: 20px;
		margin-bottom: 50px;
	}
	
	div.input_area{
		width: 600px;
	}
	
	div.order_item_box{
		width: 900px;
		margin:0 auto ;
		margin-top: 60px;
								
		/*border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;*/
	}
	
	div.total_price_box{
		width: 900px;
		margin:0 auto ;
		margin-top: 50px;
	}
	
	div.submit_button_box{
		width: 900px;
		margin:0 auto ;
		margin-top: 85px;
		
		padding: 0 0 200px 0px;
	}
	
	div.order_food_item{
		margin-bottom: 10px;
	}
	
	
	.total_price{
		font-family: "微软雅黑";
		font-size: 20px;
		color: red;
	}
	.clearfloat{
		clear: both;height: 0;
	}
</style>
<script type="text/javascript">
	
	$(function(){
		layui.use(["layer","element"], function(){
 			var layer = layui.layer,
 				element = layui.element; 
		});
		
		
		$("#submit").click(function(){			
			if(checkSubmit()){
				var total_price = ${totalPrice};
				$.ajax({
					type:"post",
					data:{address:$("#address").val(),
						receiver:$("#receiver").val(),
						phone:$("#phone").val(),
						total_price:total_price,
						},
					url:"http://127.0.0.1:8080/creatOrder",
					success:function(msg){						
						if(msg>0){
							window.location.href = "pay?oid="+msg;
						}
					}
				});					
			}											
		});
		
		function checkSubmit(){
			var address = $("#address").val();
			var receiver = $("#receiver").val();
			var phone = $("#phone").val()
			var regexPhone = "1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}";
			
			if(address == "" || address == null){
	    		layer.alert("收货地址不能为空");
	    		return false;
	    	}else if(receiver == "" || receiver == null){
	    		layer.alert("收货人姓名不能为空");
	    		return false;
	    	}else if(phone == "" || phone == null){
	    		layer.alert("收货人电话不能为空");
	    		return false;
	    	}else if(phone.match(regexPhone)==null){
    			layer.alert("手机格式不正确");
				return false;
	    	}else{
	    		return true;
	    	}  		
		}		
		
	});
	
	function logoutConfirm(){
		layer.confirm('确认要退出登录？', function(index){
			$.ajax({
				type:"post",					
				url:"http://127.0.0.1:8080/logout",
				success:function(msg){						
					if(msg=="success"){
						window.location.href="login";
					}else{
						layer.alert("退出登录失败！");
					}						
				}
			})
			layer.close(index);
		});
	}
</script>
<body>
<div id="big_div">					
	<div id="div_nav_top">
		<ul class="layui-nav" id="item" lay-filter=""style="">		
			<a href="home"><img src="img/logo.png" style="margin-left:320px;width: 200px;height: 100%;"/></a>
			<div id="div_nav_item">
				<li class="layui-nav-item"><a href="/home" style="font-size: 20px;">首页</a></li>
				<li class="layui-nav-item"><a href="/search" style="font-size: 20px;">搜索</a></li>
  				<li class="layui-nav-item layui-this"><a href="/shoppingCart" style="font-size: 20px;">购物车<c:if test="${foodNumber != 0 }"><span class="layui-badge">${foodNumber }</span></c:if></a></li>
			  	<li class="layui-nav-item"><a href="/order" style="font-size: 20px;">我的订单</a></li>
			  	<!-- <li class="layui-nav-item"><a href="#" style="font-size: 20px;">个人中心</a></li> -->
			</div>
			<div id="div_nav_item" style="float:right;margin-right:240px;">
				<li class="layui-nav-item"  lay-unselect="">
			    <a href="javascript:;"><img src="img/user/${user.id}.jpg" onerror="this.src='img/user/0.jpg'" class="layui-nav-img">${user.username}</a>
			    <dl class="layui-nav-child">
			      <dd><a href="userInfo">修改信息</a></dd>		      
			      <dd><a href="javascript:logoutConfirm();">退出登录</a></dd>
			    </dl>
			  	</li>
			</div>
		</ul>				
	</div>

	<div id="div_cart">
		<div class="cartMessage">
			<span class="message1" style="margin-left: 255px;">
				图片
			</span>
			
			<span class="message1" style="margin-left: 80px;">
				商品信息
			</span>
			<span style="margin-left: 178px;">
				单价
			</span>
			<span style="margin-left: 90px;">
				数量
			</span>
			<span style="margin-left: 90px;">
				金额
			</span>
			<span style="margin-left: 62px;">
				操作
			</span>
		</div>
		<div id="div_cart_item_box">		
			<c:forEach items="${ois}" var="oi">
				<div id="" class="div_cart_item">
					<img src="img/food/${oi.food.img }.jpg" style="width: 100px;margin-top: 15px;margin-left: 20px;"/>
					<a href="#" style="display: inline-block;margin-left: 50px;width: 230px;overflow: hidden;">${oi.food.name }</a>
					<span style="margin-left: px;">${oi.food.price }</span>
					<span style="margin-left:85px;">${oi.number }</span>												
					<span style="display: inline-block;margin-left: 90px;width:30px">${oi.number*oi.food.price}</span>
					<a href="deleteCartItem?oiid=${oi.id}" style="margin-left: 60px;color:red ;">删除</a>
				</div>
			</c:forEach>															
		</div>
	</div>
	<!-- <div id="div_total_count">
		<button id="submit" class="layui-btn layui-bg-red" style="width:100px;height: 100%;float: right;">结算</button>
	</div> -->
	<div class="input_area_box">
		<div class="input_area_title">
			输入收货信息
		</div>
		<div class="input_area">
			<form class="layui-form" action="">
				<div class="layui-form-item layui-form-text">
  						<label class="layui-form-label">详细地址</label>
				    <div class="layui-input-block">
				      <textarea placeholder="请输入详细地址" name="address" id="address" class="layui-textarea"></textarea>
				    </div>
				</div>
			  	<div class="layui-form-item">
				    <label class="layui-form-label">收货人姓名</label>
				    <div class="layui-input-block">
				      <input type="text" name="receiver" id="receiver"  lay-verify="required" placeholder="请输入收货人姓名" autocomplete="off" class="layui-input">
				    </div>
			  	</div>
			  	<div class="layui-form-item">
				    <label class="layui-form-label">手机号码</label>
				    <div class="layui-input-block">
				      <input type="text" name="phone" id="phone" lay-verify="required" placeholder="请输入收货人手机号码" autocomplete="off" class="layui-input">
				    </div>
			  	</div>
			</form>
		</div>
	</div>
			
			
			
	<div class="total_price_box">
		<div style="float: right;">
			实付款：
			<span class="total_price">￥</span>
			<span class="total_price" id="total_price">
				${totalPrice}
			</span>
		</div>	
																							
	</div>
	<div class="submit_button_box">
		<div style="float: right;">
			<button id="submit" class="layui-btn layui-btn-danger">付款</button>
		</div>								
	</div>
	
</div>
</body>
</html>