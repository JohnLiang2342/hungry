<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script src="js/jquery/2.0.0/jquery.min.js" charset="utf-8"></script>
<script src="css/layui/layui.js"></script>
<link rel="stylesheet" href="css/layui/css/layui.css">
</head>
<style type="text/css">
	body{
		background: #eeeeee;
	}
	
	div.big_div{
		position: relative;
	    left: 0;
	    top: 0;
	    padding: 140px 0;
	    min-height: 100%;
	    box-sizing: border-box;
	}
	div.login_main{
		width: 375px;
	    margin: 0 auto;
	    
	}
	.login_head{
		width: 200px;
	}
	.login_box{
		margin:0 auto;
	}
	.layui-form{
		margin-top: 30px;
	}
	.layui-form-item{
		position: relative;
		margin-bottom: 15px;
	}
	.login-icon{
		position: absolute;
	    left: 1px;
	    top: 1px;
	    width: 38px;
	    line-height: 36px;
	    text-align: center;
	    color: #d2d2d2;
	}
	.layui-input{
		padding-left: 38px;
	}
	.register{
		float: right;
	}
	a{
		color: #029789;
	}
</style>
<script type="text/javascript">
	$(function(){
		layui.use(['layer','form'], function(){
			var layer = layui.layer
	      	,form = layui.form;	      				
		});
		
		$("#submit").click(function(){	    	
	    	if(checkSubmit()){
	    		//layer.alert("提交成功");
	    		$.ajax({
					type:"post",
					data:{username:$("#username").val(),
						password:$("#password").val()},
					url:"http://127.0.0.1:8080/checkLogin",
					success:function(msg){
						if(msg=="success"){
							window.location.href = "home";
						}else{
							layer.alert("帐号或密码错误！");
						}
						
					}
				});   		
	    	}		    			    				    			    			    	
	    });
		
		function checkSubmit(){
			var username = $("#username").val();
			var password = $("#password").val();
			
			if(username == "" || username == null){
	    		layer.alert("请输入用户名");
	    		return false;
	    	}else if(password == "" || password == null){
	    		layer.alert("请输入密码");
	    		return false;
	    	}else{
	    		return true;
	    	}	    		
		}
		
	})
</script>
<body>
<div class="big_div">
<div class="login_main">
		<div class="login_box">
			<img class="login_head" src="img/logo.png" />					
		</div>
		<div class="login_box login_body layui-form">
			<div class="layui-form-item">
				<span class="login-icon layui-icon layui-icon-username"></span>						
				<input type="text" name="username" id="username" placeholder="用户名" class="layui-input">
			</div>
			<div class="layui-form-item">
				<span class="login-icon layui-icon layui-icon-password"></span>						
				<input type="password" name="password" id="password" placeholder="密码" class="layui-input">
			</div>
			<div class="layui-form-item">
				<button class="layui-btn layui-btn-fluid" id="submit">登录</button>
			</div>
			<a class="forget" href="/forget">忘记密码？</a>
			<a class="register" href="/register">注册账号</a>
		</div>
	
	</div>
</div>
</body>
</html>