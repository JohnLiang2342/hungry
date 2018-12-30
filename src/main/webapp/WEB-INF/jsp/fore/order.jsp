<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
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
	div.order_layout{
		width: 800px;
		/*height: 1500px;*/
		margin: 0 auto;
		
		padding: 20px;
		margin-top: 60px;
								
		/*border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;*/
	}
			
	
					
	div.order_item{
		width: 100%;
		
		border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;
		
		
		margin-bottom: 30px;
					
	}
	div.order_title{
		width: 100%;
		height: 45px;
		
		border:solid ;
		border-width: 1px;
		border-color:#CCCCCC;
		
		background: #d2d2d2;
	}
	div.order_body{
		padding: 10px 20px 10px 30px;
		
	}
	
	div.order_food_item_box{
		margin-top: 20px;
		float: left;
		/*display: inline-block;*/
		width: 700px;
	}
	div.order_food_item{
		
		/*border-right:solid;
		border-width: 1px;
		border-color:#CCCCCC;*/
		margin-bottom: 10px;
	}
	div.order_price{
		margin-top: 50px;
		margin-left: 30px;
		float: left;
		/*display: inline-block;*/
	}
	.clerfloat{
		clear: both;height: 0;
	}
</style>
<script type="text/javascript">
	
	$(function(){
		
		layui.use(["element","layer"], function(){
 			var element = layui.element,
 				layer = layui.layer;
		});
       	//layer.alert("最多只能购买100件!");
		
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
 			<li class="layui-nav-item"><a href="/shoppingCart" style="font-size: 20px;">购物车<c:if test="false"><span class="layui-badge">0</span></c:if></a></li>
		  	<li class="layui-nav-item layui-this"><a href="/order" style="font-size: 20px;">我的订单</a></li>
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

<div class="order_layout">

	
	<c:forEach items="${os}" var="o">
		<div class="order_item">
			<div class="order_title">
				<div style="display:inline-block;margin-top: 13px;margin-left: 20px;">订单号：${o.order_code}</div>
				<span style="display:inline-block;width:160px;margin-top: 13px;margin-left: 260px;">实付款：￥${o.total_price}</span>
				<c:choose>
					<c:when test="${o.is_pay>0}">
						<c:choose>
							<c:when test="${o.delivery_date==null}">
								<span style="color:red;margin-left: 35px;">商家未发货</span>				
								<a href="deleteOrder?id=${o.id}" class="layui-btn layui-btn-sm layui-btn-danger" style="margin-left: 10px;">删除订单</a>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${o.confirm_date==null}">
										<a href="confirmReceive?id=${o.id}" class="layui-btn layui-btn-sm layui-btn-normal" style="margin-left: 35px;">确认收货</a>
										<a href="deleteOrder?id=${o.id}" class="layui-btn layui-btn-sm layui-btn-danger" style="margin-left: 10px;">删除订单</a>
									</c:when>
									<c:otherwise>										
										<a href="deleteOrder?id=${o.id}" class="layui-btn layui-btn-sm layui-btn-danger" style="margin-left: 120px;">删除订单</a>
									</c:otherwise>
								</c:choose>
								
							</c:otherwise>
						</c:choose>
																
					</c:when>
					<c:otherwise>
						<a href="pay?oid=${o.id}" class="layui-btn layui-btn-sm layui-btn-normal" style="margin-left: 60px;">付款</a>
						<a href="deleteOrder?id=${o.id}" class="layui-btn layui-btn-sm layui-btn-danger" style="margin-left: 10px;">删除订单</a>
					</c:otherwise>
				</c:choose>							
			</div>
			<div class="order_body">
				<div class="order_food_item_box">
					<c:forEach items="${o.ois}" var="oi">						
						<div class="order_food_item">
							<img style="width: 90px;" src="img/food/${oi.food.img}.jpg"/>
							<div style="display:inline-block;width:260px;margin-left: 50px;">${oi.food.name}</div>
							<div style="display:inline-block;width:50px;margin-left: 70px;">${oi.number}</div>
							<div style="display:inline-block;width:50px;margin-left: 70px;">￥${oi.number*oi.food.price}</div>					
						</div>
					</c:forEach>				
				</div>
				<div class="clerfloat"></div>
			</div>
		</div>	
	</c:forEach>	
</div>
	
</div>
</body>
</html>