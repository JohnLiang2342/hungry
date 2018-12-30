<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款</title>
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
	
	.total_price{
		font-family: "微软雅黑";
		font-size: 20px;
		color: red;
	}
</style>
<script type="text/javascript">	
	$(function(){		
		layui.use("element", function(){
 			var element = layui.element; 
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
				<li class="layui-nav-item"><a href="/home" style="font-size: 20px;">首页</a></li>
				<li class="layui-nav-item"><a href="/search" style="font-size: 20px;">搜索</a></li>
	 				<li class="layui-nav-item"><a href="/shoppingCart" style="font-size: 20px;">购物车<c:if test="false"><span class="layui-badge">0</span></c:if></a></li>
			  	<li class="layui-nav-item layui-this"><a href="/order" style="font-size: 20px;">我的订单</a></li>
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
	
	
	<div style="text-align:center;width:200px;margin:0 auto;margin-top:100px;"><span>扫一扫付款（元）</span></div>
	<div style="text-align:center;width:200px;margin:0 auto;margin-top:5px;"><span class="total_price">￥${totalPrice}</span></div>
	<div class="alipay" style="width:200px;margin:0 auto;margin-top:5px;"><img src="img/alipay.png" style="width:200px;"></img></div>
	<a href="confirmPay?oid=${oid}" class="layui-btn layui-btn-normal" style="display:block;width:92px;margin:0 auto;margin-top:10px;">确认付款</a>
	
</div>

</body>
</html>