<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$(function () {		
	    layui.use(['layer','form'], function(){
			var layer = layui.layer
	      	,form = layui.form;
	      		      			
		});	  
	    
	    $("#getVerCode").click(function(){
			if(checkPhone()){
				//layer.alert("发送成功");
				$.ajax({					
					type:"post",
					data:{phone:$("#phone").val()},
					url:"http://127.0.0.1:8080/getVerCode",
					success:function(msg){
						if(msg=="success"){
							layer.msg("发送手机验证码成功");
						}else{
							layer.msg("该手机号已被注册！");
						}												
					}
				}) 
			}	    	
	    });	
	    		    				    				    			    			    			    	 	    		   	    
	    $("#submit").click(function(){	    	
	    	if(checkSubmit()){
	    		//layer.alert("提交成功");
	    		$.ajax({
	    			async : false,
					type:"post",
					data:{verCode:$("#verCode").val()},
					url:"http://127.0.0.1:8080/checkVerCode",
					success:function(msg){
						if(msg=="success"){
							$.ajax({								
				    			async : false,
								type:"post",
								data:{username:$("#username").val(),
									  password:$("#password2").val(),
									  phone:$("#phone").val()
									 },
								url:"http://127.0.0.1:8080/toRegister",
								success:function(msg){
									layer.msg("注册成功！");
									if(msg=="success"){
										//延时跳转
										setTimeout(function(){
											window.location.href="home";
										}, 2000);
										
									}else{
										layer.alert("注册失败！");
									}
								}
							})
						}else{
							layer.alert("验证码错误");
						}
						
					}
				})	    		
	    	}		    			    				    			    			    	
	    });
	    
	    function checkPhone(){
			var phone = $("#phone").val();
			if(phone == "" || phone == null){
				layer.alert("手机号不能为空！");
	    		return false;
			}else{
				var regexPhone = "1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}";
				if(phone.match(regexPhone)==null){
					layer.alert("手机格式不正确！");
					return false;					
				}else{
					return true;
				}
			}	    		    	
	    }
	    
	    function checkSubmit(){
	    	var username = $("#username").val();
	    	var password = $("#password").val();
	    	var password2 = $("#password2").val();
	    	var phone = $("#phone").val();
	    	var verCode = $("#verCode").val();
	    	
	    	var regexPhone = "1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}";
	    	var regexVerCode = /^\d{6}$/;
	    	
	    	if(username == "" || username == null){
	    		layer.alert("请输入用户名");
	    		return false;
	    	}else if(password == "" || password == null){
	    		layer.alert("请输入密码");
	    		return false;
	    	}else if(password2 == "" || password2 == null){
	    		layer.alert("请再次输入密码");
	    		return false;
	    	}if(password2!=password){
	    		layer.alert("两次输入密码不一致");
	    		return false;
	    	}else if(phone == "" || phone == null){
	    		layer.alert("请输入手机号");
	    		return false;
	    	}else if(phone.match(regexPhone)==null){
    			layer.alert("手机格式不正确！");
				return false;
    		}if(verCode == "" || verCode == null){
	    		layer.alert("请输入手机验证码");
	    		return false;
	    	}else if(verCode.match(regexVerCode)==null){
    			layer.alert("请输入六位数字的验证码");
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
				<span class="login-icon layui-icon layui-icon-password"></span>						
				<input type="password" name="password2" id="password2" placeholder="确认密码" class="layui-input">
			</div>
			<div class="layui-form-item">
				<span class="login-icon layui-icon layui-icon-cellphone"></span>						
				<input type="text" name="phone" id="phone" placeholder="手机" class="layui-input">
			</div>
			<div class="layui-form-item">
				<div class="layui-row">
					<div class="layui-col-xs7">
						<span class="login-icon layui-icon layui-icon-vercode"></span>						
						<input type="text" name="verCode" id="verCode" placeholder="短信验证码" class="layui-input">								
					</div>
					<div class="layui-col-xs5">
						<div style="margin-left: 10px;" >
							<button type="button" id="getVerCode" class="layui-btn layui-btn-primary layui-btn-fluid">获取验证码</button>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<button class="layui-btn layui-btn-fluid" id="submit">注册</button>
			</div>
		</div>
	
	</div>
</div>
</body>
</html>