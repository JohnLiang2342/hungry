<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑食品</title>
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
	div.add_div{
		margin: 0 auto;			
		width: 400px;
		margin-top: 25px;
	}
</style>
<script type="text/javascript">
	$(function(){
		layui.use(['layer','form','element'], function(){
			  var layer = layui.layer
			  ,form = layui.form
			  ,element = layui.element;
			  //建造实例
			  
			});
		$("#submit").click(function(){
			if(checkSubmit()){
	    		//layer.alert("提交成功");
	    		var f = {
	    				id:$("#id").val(),
	    				name:$("#name").val(),
    					description:$("#description").val(),
    					price:$("#price").val()
  					}
	    		$.ajax({
					type:"post",
					data: f ,
					url:"http://127.0.0.1:8080/editFood_update",
					success:function(msg){						
						if(msg=="success"){
							window.location.href="/adminFood?cid="+${fs.cid}
							//layer.alert("更新成功！");
						}else{
							layer.alert("更新失败！");
						}
						
					}
				})	    		
	    	}
		});
		function checkSubmit(){
			var name = $("#name").val();
			var description = $("#description").val();
			var price = $("#price").val();
			
			var regexPrice = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
			
			if(name == "" || name == null){
				layer.alert("请输入食品名称");
	    		return false;
			}else if(description == "" || description == null){
				layer.alert("请输入食品描述");
	    		return false;
			}else if(price == "" || price == null){				
				layer.alert("请输入食品价格");
	    		return false;
			}else if(price.match(regexPrice)==null){
				layer.alert("请输入正确格式的价格");
	    		return false;
			}
			return true;
		}
	})
</script>
<body>
<div class="big_div">			
	<div id="div_nav_top">
		<ul class="layui-nav" id="item" lay-filter=""style="">
			
			<img src="img/adminLogo.png" style="margin-left:320px;width: 300px;height: 100%;"/>
			<div id="div_nav_item">
				<li class="layui-nav-item"><a href="adminCategory" style="font-size: 20px;">分类管理</a></li>
  				<li class="layui-nav-item"><a href="adminUser" style="font-size: 20px;">用户管理</a></li>
			  	<li class="layui-nav-item"><a href="adminOrder" style="font-size: 20px;">订单管理</a></li>				
			</div>
		</ul>				
	</div>
	<div class="add_div">
		<div class="layui-card">
	        <div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">编辑食品</div>
	        <div class="layui-card-body">
	        	<div class="layui-form">
	        		<input type="hidden" name="id" id="id" value="${fs.id}">
	        		<div class="layui-form-item">
	        			<label class="layui-form-label">食品名称</label>
	        			<div class="layui-input-inline">
 							<input type="text" name="name" id="name" autocomplete="off" class="layui-input" value="${fs.name}">
						</div>
	        		</div>
	        		<div class="layui-form-item">
	        			<label class="layui-form-label">食品描述</label>
	        			<div class="layui-input-inline">
 							<input type="text" name="description" id="description" autocomplete="off" class="layui-input" value="${fs.description}">
						</div>
	        		</div>
	        		<div class="layui-form-item">
	        			<label class="layui-form-label">食品价格</label>
	        			<div class="layui-input-inline">
 							<input type="text" name="price" id="price" autocomplete="off" class="layui-input" value="${fs.price}">
						</div>
	        		</div>
	        		<div class="layui-form-item" style="text-align:center">
						<button class="layui-btn"  id="submit">提交</button>
					</div>
	        		
	        	</div>
	          
	        </div>
        </div>
	</div>
</div>
</body>
</html>