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
	div.item{  
	width:1000px;
	height: 800px;
	
	margin:0 auto ;
	margin-top: 50px;
	
	border:solid ;
	border-width: 1px;
	border-color:#CCCCCC;		
	/*text-align: center;*/
	
	
    }
    div.foodItem{
    	width:1000px;
	height: 800px;
	
	margin:0 auto ;
	margin-top: 50px;
	
	border:solid ;
	border-width: 1px;
	border-color:#CCCCCC;
    }
    
    div.foodImg{
    	margin-top:10px ;
    	margin-left: 20px;
    	float: left;
    	
    }
    
    div.foodInfo{
    	float: left;
    	margin-left: 100px;
    }
    
    div.foodName{
    	height: 50px;
    	width: 550px;
    			    	
    	margin-top: 20px;
    	font-size:35px ;
    	color: #23262E;
    	font-family: "微软雅黑";
    }
    
    div.foodDescription{
    	font-size:20px ;
    	color: darkgray;
    }
   
    div.foodPrice{
    	font-size:25px ;
    	margin-top:50px;
    	color: #FF5722;
    }
    
    div.foodNumber{
		margin-top: 50px;
				
	}
    
    #addCart{
    	margin-top:15px ;
    	margin-left: 5px;
    }						
</style>
<script type="text/javascript">			
	$(function(){
		layui.use(["layer","element"], function(){
 			var layer = layui.layer,
 			element = layui.element; 
		});
		
		
		/* 数量输入框 */
	    $(".foodNumber").keyup(function(){
	        var num= $(".foodInputNumber").val();
	        num = parseInt(num);
	        if(isNaN(num)){
	        	num= 1;
	        }
	        if(num>100){
	        	layer.alert('最多只能购买100件！');
	        	num=100;
	        }
	        if(num<=0){
	        	num = 1;
	        }	            		        
	        $(".foodInputNumber").val(num);
	    });
		/* 数量增加 */
	    $(".increaseNumber").click(function(){
	        var num= $(".foodInputNumber").val();
	        num++;
	        if(num>100){
	        	num = 100;
	        }		            
	        $(".foodInputNumber").val(num);
	    });
	    /* 数量减少 */
	    $(".decreaseNumber").click(function(){
	        var num= $(".foodInputNumber").val();
	        --num;
	        if(num<=0)
	            num=1;
	        $(".foodInputNumber").val(num);
	    });
	    
	    $("#addCart").click(function(){
	    	var fid = ${fs.id};
			var number = $(".foodInputNumber").val();		
			$.ajax({					
				type:"post",
				data:{fid:fid,
					number:number},
				url:"http://127.0.0.1:8080/addCart",
				success:function(msg){										
					if(msg>0 ){
						layer.alert("添加成功");
						$(".layui-badge").text(msg);
					}
				}
			})
	    	
	    });
	    /* $("#addCart").click(function(){
	    	layer.alert(${cartCount});
	    }); */
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
				<li class="layui-nav-item"><a href="home" style="font-size: 20px;">首页</a></li>
				<li class="layui-nav-item"><a href="/search" style="font-size: 20px;">搜索</a></li>
  				<li class="layui-nav-item"><a href="shoppingCart" style="font-size: 20px;">购物车<c:if test="${cartCount != 0}"><span class="layui-badge">${cartCount}</span></c:if>	  								    				       				    			    				    				
  				</a></li>
			  	<li class="layui-nav-item"><a href="#" style="font-size: 20px;">我的订单</a></li>
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
	<div class="foodItem">
		
			<div class="foodImg">
				<img src="img/food/${fs.img}.jpg" width="300px"/>
			</div>					
			
			<div class="foodInfo">
				<div class="foodName">
					${fs.name}
					
				</div>
				<div class="foodDescription">
					${fs.description}
				</div>
				
				<div class="foodPrice">
					¥${fs.price}
				</div>
				
				<div class="foodNumber">
					数量
					<button class="layui-btn layui-btn-primary layui-btn-xs decreaseNumber }">－</button>
					<input class="foodInputNumber" id="foodInputNumber" type="text" style="width:25px;height:17px;" value=1></input>
					<button class="layui-btn layui-btn-primary layui-btn-xs increaseNumber">＋</button>
					份
				</div>
				
				<button class="layui-btn layui-btn-danger layui-btn-radius" id="addCart">添加到购物车</button>
			</div>
						
		
		
		<fieldset class="layui-elem-field" style="margin-top:430px">
		  <legend>评价</legend>
		  <div class="layui-field-box">
		    内容区域
		  </div>
		</fieldset>
		
		
	</div>
	
	
</div>
</body>
</html>