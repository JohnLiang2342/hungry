<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建订单</title>
<script src="js/jquery/2.0.0/jquery.min.js" charset="utf-8"></script>
<script src="css/layui/layui.js"></script>
<link rel="stylesheet" href="css/layui/css/layui.css">
</head>
<style type="text/css">
	body{
		background: #eeeeee;
	}
	#big_div{
		width:1900px
	}
	#div_nav_top{
		width:100%;
				
	}
	#div_nav_item{
		display: inline;
		margin-left: 5px;
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
		layui.use(['element','form'], function(){
 			var element = layui.element,
 				form = layui.form;
		});
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
				<li class="layui-nav-item"><a href="home" style="font-size: 20px;">首页</a></li>
				<li class="layui-nav-item"><a href="/search" style="font-size: 20px;">搜索</a></li>
  				<li class="layui-nav-item"><a href="shoppingCart" style="font-size: 20px;">购物车<span class="layui-badge">9</span></a></li>
			  	<li class="layui-nav-item"><a href="order" style="font-size: 20px;">我的订单</a></li>
			  	<li class="layui-nav-item"><a href="#" style="font-size: 20px;">个人中心</a></li>
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
	
	<div class="input_area_box">
		<div class="input_area_title">
			输入收货信息
		</div>
		<div class="input_area">
			<form class="layui-form" action="">
				<div class="layui-form-item layui-form-text">
  						<label class="layui-form-label">详细地址</label>
				    <div class="layui-input-block">
				      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
						</div>
			  	<div class="layui-form-item">
				    <label class="layui-form-label">收货人姓名</label>
				    <div class="layui-input-block">
				      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
				    </div>
			  	</div>
			  	<div class="layui-form-item">
				    <label class="layui-form-label">手机号码</label>
				    <div class="layui-input-block">
				      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
				    </div>
			  	</div>
			</form>
		</div>
	</div>
	
	<div class="order_item_box">
		<div class="input_area_title">
			确认订单信息
		</div>
		<div class="order_food_item">
			<img style="width: 60px;" src="img/2.jpg"/>
			<div style="display:inline-block;width:260px;margin-left: 50px;">名字名字名字名字字名字字名字字名字</div>
			<div style="display:inline-block;width:50px;margin-left: 70px;">100</div>
			<div style="display:inline-block;width:50px;margin-left: 70px;">￥66666</div>					
		</div>
		<div class="order_food_item">
			<img style="width: 60px;" src="img/2.jpg"/>
			<div style="display:inline-block;width:260px;margin-left: 50px;">名字名字名字名字字名字字名字字名字</div>
			<div style="display:inline-block;width:50px;margin-left: 70px;">100</div>
			<div style="display:inline-block;width:50px;margin-left: 70px;">￥66666</div>					
		</div>
	</div>
	
	<div class="total_price_box">
		<div style="float: right;">
			实付款：
			<span class="total_price">
				￥666
			</span>
		</div>	
																							
	</div>
	<div class="submit_button_box">
		<div style="float: right;">
			<button class="layui-btn layui-btn-danger">提交订单</button>
		</div>								
	</div>
	
</div>
</body>
</html>