<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索</title>
<script src="js/jquery/2.0.0/jquery.min.js" charset="utf-8"></script>
<script src="css/layui/layui.js"></script>
<link rel="stylesheet" href="css/layui/css/layui.css">
</head>
<style type="text/css">
	body{
		background: #f2f2f2;
	}
	#big_div{
		width:1900px
	}
	
	/* 顶部导航栏开始 */
	#div_nav_top{
		width:100%;
		height:63px;					
	}
	#div_nav_item{
		display: inline;
		margin-left: 5px;
	}
	
	div.search_div{
		margin: 0 auto;			
		width: 400px;
		margin-top: 25px;
	}
</style>
<script type="text/javascript">
$(function(){
	
	layui.use(["element","layer"], function(){
		var element = layui.element,
			layer = layui.layer; 
	});
	
	$("#submit").click(function(){
		if(checkSubmit()){
			window.location.href = "toSearch?keyword="+$("#keyword").val();
		}
	})
});
function checkSubmit(){
	var keyword = $("#keyword").val();
	
	if(keyword == "" || keyword == null){
		layer.alert("请输入关键词");
		return false;
	}else{
		return true;
	}	
}
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
				<li class="layui-nav-item layui-this"><a href="/search" style="font-size: 20px;">搜索</a></li>
  				<li class="layui-nav-item"><a href="/shoppingCart" style="font-size: 20px;">购物车<c:if test="false"><span class="layui-badge">0</span></c:if></a></li>
			  	<li class="layui-nav-item"><a href="/order" style="font-size: 20px;">我的订单</a></li>
			  	<!-- <li class="layui-nav-item"><a href="#" style="font-size: 20px;">个人中心</a></li> -->			  	
			</div>
				
			<c:choose>
				<c:when test="${user!=null }">
					<div id="div_nav_item" style="float:right;margin-right:240px;">
						<li class="layui-nav-item"  lay-unselect="">
					    <a href="javascript:;"><img src="img/user/${user.id}.jpg" onerror="this.src='img/user/0.jpg'" class="layui-nav-img">${user.username}</a>
					    <dl class="layui-nav-child">
					      <dd><a href="userInfo">修改信息</a></dd>
					      <dd><a href="javascript:logoutConfirm();">退出登录</a></dd>
					    </dl>
					  	</li>
					</div>
				</c:when>
				<c:otherwise>
					<div id="div_nav_item" style="float:right;margin-right:240px;">
						<li class="layui-nav-item"  lay-unselect="">
					    <a href="javascript:;"><img src="img/food/noimg.jpg" class="layui-nav-img">到此一游</a>
					    <dl class="layui-nav-child">						      
					      <dd><a href="login">登录</a></dd>
					    </dl>
					  	</li>
					</div>
				</c:otherwise>		
			</c:choose>							
		</ul>				
	</div>
	
	<div class="search_div">
		<div class="layui-card">
	        <div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">搜索</div>
	        <div class="layui-card-body">
	        	<div class="layui-form">
	        		<div class="layui-form-item">
	        			<label class="layui-form-label">搜索</label>
	        			<div class="layui-input-inline">
 							<input type="text" name="keyword" id="keyword" autocomplete="off" class="layui-input">
						</div>
	        		</div>
	        		<div class="layui-form-item" style="text-align:center">
						<button class="layui-btn" id="submit">搜索</button>
					</div>
	        		
	        	</div>
	          
	        </div>
        </div>
	</div>
</div>
</body>
</html>