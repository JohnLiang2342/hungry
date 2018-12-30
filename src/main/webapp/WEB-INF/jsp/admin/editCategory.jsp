<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		$("#submit").click(function(){
			if(checkSubmit()){
	    		//layer.alert("提交成功");
	    		$.ajax({
					type:"post",
					data:{id:$("#id").val()
						,name:$("#name").val()},
					url:"http://127.0.0.1:8080/editCategory_update",
					success:function(msg){						
						if(msg=="success"){
							window.location.href="adminCategory";
						}else{
							layer.alert("更新失败！");
						}
						
					}
				})	    		
	    	}
		});
		function checkSubmit(){
			var name = $("#name").val();
			if(name == "" || name == null){
				layer.alert("请输入分类名");
	    		return false;
			}
			return true;
		}
	})
</script>
<body>
<div class="big_div">			
	<div id="div_nav_top">
		<ul class="layui-nav" id="item">			
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
	        <div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">编辑分类</div>
	        <div class="layui-card-body">
	        	<div class="layui-form">
	        		<input type="hidden" name="id" id="id" value="${cs.id}">
	        		<div class="layui-form-item">
	        			<label class="layui-form-label">分类名</label>
	        			<div class="layui-input-inline">
 							<input type="text" name="name" id="name" autocomplete="off" class="layui-input" value="${cs.name}">
						</div>
	        		</div>
	        		<div class="layui-form-item" style="text-align:center">
						<button class="layui-btn" id="submit"  >提交</button>
					</div>
	        		
	        	</div>
	          
	        </div>
        </div>
	</div>
</div>
</body>
</html>