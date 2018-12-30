<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册用户</title>
<script src="js/jquery/2.0.0/jquery.min.js" charset="utf-8"></script>
<script src="css/layui/layui.js"></script>
<link rel="stylesheet" href="css/layui/css/layui.css">
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
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
	
	div.table{
		margin: 0 auto;
		width: 900px;
		padding: 10px 15px;
		margin-top: 50px;
		background: #FFFFFF;
	}
	
	div.pageDiv{
		text-align:center;
	}
</style>
<script type="text/javascript">
	/* 加载layui模块 */
	$(function(){
		layui.use(['layer','form','element',], function(){
		  var layer = layui.layer
		  ,form = layui.form
		  ,element = layui.element;
		  //建造实例
		  
		});
	});

</script>
<body>
<div class="big_div">
			
	<div id="div_nav_top">
		<ul class="layui-nav" id="item" lay-filter=""style="">
			
			<img src="img/adminLogo.png" style="margin-left:320px;width: 300px;height: 100%;"/>
			<div id="div_nav_item">
				<li class="layui-nav-item"><a href="adminCategory" style="font-size: 20px;">分类管理</a></li>
  				<li class="layui-nav-item layui-this"><a href="adminUser" style="font-size: 20px;">注册用户</a></li>
			  	<li class="layui-nav-item"><a href="adminOrder" style="font-size: 20px;">订单管理</a></li>				
			</div>
		</ul>				
	</div>
		
	<div class="table">
		<div class="listCategory">
			<table class="layui-table">
				<colgroup>
				    <col width="100">
				    <col width="200">
				    <col width="200">
				    <col width="160">
				    <col>				    					    
			  	</colgroup>
			    <thead>
				<tr>
				  <th>ID</th>
				  <th>用户名</th>
				  <th>密码</th>
				  <th>联系方式</th>
				  <th>注册时间</th>				  
			    </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${us}" var="u">
			    		<tr>
			    			<td>${u.id}</td>
				    		<td>${u.username}</td>
				    		<td>${u.password}</td>
				    		<td>${u.phone}</td>
				    		<td>${u.create_date}</td>			    		
			    		</tr>
			    	</c:forEach>			    				    			    	
			    </tbody>
			</table>
		</div>
	</div>
	<div class="pageDiv">
        <%@include file="../adminPage.jsp"%>
    </div>			
</div>
</body>
</html>