<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
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
	$(function() {
		
	    layui.use(['layer','form'], function(){
			var layer = layui.layer
	      	,form = layui.form;
	      	
			//监听提交	      
			form.on('submit(submit)', function(data){
	    	 	
				
		    	/* if(!checkPhone()){
		    		layer.msg("!check");
					return false;
		    	}
		    	if(checkPhone()){
		    		layer.msg("check");
		    	} */
	    	   
	    	});
		});	  
	    
	    $("#getVerCode").click(function(){
			if(checkPhone()){								
				$.ajax({					
					type:"post",
					data:{phone:$("#phone").val()},
					url:"http://127.0.0.1:8080/forgetGetVerCode",
					success:function(msg){
						if(msg=="success"){
							layer.msg("发送手机验证码成功");
						}else{
							layer.msg("手机号尚未注册！");
						}
						
						//layer.alert(msg);
					}
				}) 
			}	    	
	    });	
	    			    				    				    			    			    			    	 	    		    
	    
	    $("#submit").click(function(){	    	
	    	if(checkVerCode()){
	    		$.ajax({
					type:"post",
					data:{verCode:$("#verCode").val()},
					url:"http://127.0.0.1:8080/checkVerCode",
					success:function(msg){						
						layer.alert(msg);
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
	    	    	    
	    function checkVerCode(){
	    	var verCode = $("#verCode").val();
	    	if(verCode == "" || verCode == null){
	    		layer.alert("验证码不能为空！");
	    		return false;
	    	}else{
	    		var regexVerCode = /^\d{6}$/;
	    		if(verCode.match(regexVerCode)==null){
	    			layer.alert("请输入六位数字的验证码");
	    			return false;
	    		}else{
	    			return true;
	    		}
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
				<span class="login-icon layui-icon layui-icon-cellphone"></span>						
				<input type="text" name="phone" id="phone" placeholder="请输入注册时的手机号" class="layui-input">
			</div>
			<div class="layui-form-item">
				<div class="layui-row">
					<div class="layui-col-xs7">
						<span class="login-icon layui-icon layui-icon-vercode"></span>						
						<input type="password" name="verCode" id="verCode" placeholder="短信验证码" class="layui-input">								
					</div>
					<div class="layui-col-xs5">
						<div style="margin-left: 10px;" >
							<button type="button" id="getVerCode" class="layui-btn layui-btn-primary layui-btn-fluid">获取验证码</button>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<button type="button" class="layui-btn layui-btn-fluid" id="submit">找回密码</button>
			</div>
		</div>
	
	</div>
</div>
</body>
</html>