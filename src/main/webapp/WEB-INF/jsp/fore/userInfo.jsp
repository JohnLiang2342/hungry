<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
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
	
	div.div_password{
		width: 500px;
		margin:0 auto ;
		margin-top: 70px;
	}
	div.div_username{
		width: 500px;
		margin:0 auto ;
		margin-top: 70px;
	}
	div.div_usericon{
		width: 500px;
		margin:0 auto ;
		margin-top: 70px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		layui.use(["layer","element","upload"], function(){
 			var layer = layui.layer,
 				element = layui.element,
 				upload = layui.upload;
 			//执行实例 			
			  upload.render({			  
			    elem: '#selectImg' //绑定元素
			    ,url: 'uploadIcon' //上传接口
			    ,choose: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#previewImg').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,auto: false //选择文件后不自动上传
		 		,bindAction: '#updateIcon' //指向一个按钮触发上传
				
		 		,data: {id:$("#id").val()}
	
			    ,done: function(msg){
			      //上传完毕回调
			      if(msg.msg=="success"){
					layer.confirm("上传成功");
					//延时跳转
					setTimeout(function(){
						window.location.href="userInfo";
					}, 2000);
			      }	      	      
			    }
			    ,error: function(msg){
			      //请求异常回调
			    	layer.confirm("上传失败");
			    }
			  });
		});
		
		
		$("#updatePassword").click(function(){
			if(checkUpdatePassword()){								
				$.ajax({					
					type:"post",
					data:{id:$("#id").val(),
						password:$("#rePassword").val()},
					url:"http://127.0.0.1:8080/updatePassword",
					success:function(msg){
						if(msg=="success"){
							layer.msg("修改密码成功");
							//延时跳转
							setTimeout(function(){
								window.location.href="login";
							}, 2000);
							
						}else{
							layer.msg("修改密码失败");
						}
					}
				}) 
			}	    	
	    });
		function checkUpdatePassword(){
			
			var password = $("#password").val();
			var oldPassword = $("#oldPassword").val();
			var newPassword = $("#newPassword").val();
			var rePassword = $("#rePassword").val();
			
			if(oldPassword == "" || oldPassword == null){
	    		layer.alert("请输入密码");
	    		return false;
	    	}else if(password!=oldPassword){
	    		layer.alert("密码错误");
	    		return false;
	    	}else if(newPassword == "" || newPassword == null){
	    		layer.alert("请输入新密码");
	    		return false;
	    	}else if(rePassword == "" || rePassword == null){
	    		layer.alert("请再次输入新密码");
	    		return false;
	    	}if(rePassword!=newPassword){
	    		layer.alert("两次输入密码不一致");
	    		return false;	    		    		    
	    	}else{
	    		return true;
	    	}
		}
		
		
		
		
		$("#updateUsername").click(function(){
			if(checkUpdateUsername()){								
				$.ajax({					
					type:"post",
					data:{id:$("#id").val(),
						username:$("#username").val()},
					url:"http://127.0.0.1:8080/updateUsername",
					success:function(msg){
						if(msg=="success"){
							layer.msg("修改用户名成功");
							//延时跳转
							setTimeout(function(){
								window.location.href="userInfo";
							}, 2000);
							
						}else{
							layer.msg("修改用户名失败");
						}
					}
				}) 
			}	    	
	    });
		function checkUpdateUsername(){
			var username = $("#username").val();
			if(username == "" || username == null){
				layer.alert("用户名不能为空！");
	    		return false;
			}else{
				return true;
			}	    		    	
	    }		
	})
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
  				<li class="layui-nav-item"><a href="/shoppingCart" style="font-size: 20px;">购物车</a></li>
			  	<li class="layui-nav-item"><a href="/order" style="font-size: 20px;">我的订单</a></li>
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
	
	<input type="hidden" name="id" id="id" value="${user.id}">
	<input type="hidden" name="password" id="password" value="${user.password}">
	
	<div class="div_password">
		<div class="layui-card">
			<div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">修改密码</div>
			<div class="layui-card-body">
				<div class="layui-form">
					<div class="layui-form-item">
		            	<label class="layui-form-label">当前密码</label>
		                <div class="layui-input-inline">
		                	<input type="password" name="oldPassword" id="oldPassword" lay-verify="required" lay-vertype="tips" class="layui-input">
		                </div>
		            </div>
		            
		            <div class="layui-form-item">
		            	<label class="layui-form-label">新密码</label>
		                <div class="layui-input-inline">
		                	<input type="password" name="newPassword" id="newPassword" lay-verify="required" lay-vertype="tips" class="layui-input">
		                </div>
		            </div>
		            
		            <div class="layui-form-item">
		            	<label class="layui-form-label">确认新密码</label>
		                <div class="layui-input-inline">
		                	<input type="password" name="rePassword" id="rePassword" lay-verify="required" lay-vertype="tips" class="layui-input">
		                </div>
		            </div>
		            
		            <div class="layui-form-item">
		            	<div class="layui-input-block">
		                	<button class="layui-btn" id="updatePassword">确认修改</button>
		                </div>
		        	</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="div_username">
		<div class="layui-card">
			<div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">修改用户名</div>
			<div class="layui-card-body">
				<div class="layui-form">							          	            
		            
		            <div class="layui-form-item">
		            	<label class="layui-form-label">新用户名</label>
		                <div class="layui-input-inline">
		                	<input type="text" name="username" id="username" lay-verify="required" lay-vertype="tips" class="layui-input">
		                </div>
		            </div>
		            
		            <div class="layui-form-item">
		            	<div class="layui-input-block">
		                	<button class="layui-btn" id="updateUsername">确认修改</button>
		                </div>
		        	</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="div_usericon">
		<div class="layui-card">
			<div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">修改头像</div>
			<div class="layui-card-body">
	        	<div class="layui-upload">
	        		<input type="hidden" name="id" id="id" value="${fs.id}">
	        		<input type="hidden" name="cid" id="cid" value="${fs.cid}">
	        		<button type="button" class="layui-btn" id="selectImg">选择图片</button>
					<span class="">尺寸300X300 为佳</span>
					<br>
					<span class="">预览：</span>
					<div class="layui-upload-list">
						<img class="layui-upload-img" id="previewImg" src="img/user/${user.id}.jpg" alt="" onerror="this.src='img/user/0.jpg'" style="width: 200px;height: 200px;">						
					</div>
					<div style="text-align: center;">
						<button type="button" class="layui-btn" id="updateIcon">提交</button>
					</div>							
				</div>
	          
	        </div>
			
		</div>
	</div>
</div>
</body>
</html>