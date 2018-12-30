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
		width:1900px;
	}
	
	#div_nav_top{
	width:100%;
			
	}
	#div_nav_item{
		display: inline;
		margin-left: 5px;
	}
	div.img_div{
		margin: 0 auto;			
		width: 600px;
		margin-top: 25px;
	}
</style>
<script type="text/javascript">
	$(function(){
				
		layui.use('upload', function(){
			
			var $ = layui.jquery
	 			,upload = layui.upload;
		   
		  //执行实例
		  upload.render({			  
		    elem: '#selectImg' //绑定元素
		    ,url: 'upload' //上传接口
		    ,choose: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#previewImg').attr('src', result); //图片链接（base64）
		      });
		    }
		    ,auto: false //选择文件后不自动上传
	 		,bindAction: '#submit' //指向一个按钮触发上传
			
	 		,data: {id:$("#id").val(),
					cid:$("#cid").val()
	 		}

		    ,done: function(msg){
		      //上传完毕回调
		      if(msg.code==0){	    	  
		    	  //window.location.href="uploadFood"
		    	  layer.confirm(msg.msg);	    	  
		      }	      	      
		    }
		    ,error: function(msg){
		      //请求异常回调
		    	layer.confirm("上传失败");
		    }
		  });
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
  				<li class="layui-nav-item"><a href="adminUser" style="font-size: 20px;">用户管理</a></li>
			  	<li class="layui-nav-item"><a href="adminOrder" style="font-size: 20px;">订单管理</a></li>				
			</div>
		</ul>				
	</div>
	<div class="img_div">
		<div class="layui-card">
	        <div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">新增或修改食物图片</div>
	        <div class="layui-card-body">
	        	<div class="layui-upload">
	        		<input type="hidden" name="id" id="id" value="${fs.id}">
	        		<input type="hidden" name="cid" id="cid" value="${fs.cid}">
	        		<button type="button" class="layui-btn" id="selectImg">选择图片</button>
					<span class="">尺寸300X300 为佳</span>
					<br>
					<span class="">预览：</span>
					<div class="layui-upload-list">
						<img class="layui-upload-img" src="img/food/${fs.img}.jpg" alt="" onerror="this.src='img/food/noimg.jpg'" style="width: 200px;height: 200px;" id="previewImg">						
					</div>
					<div style="text-align: center;">
						<button type="button" class="layui-btn" id="submit">提交</button>
					</div>							
				</div>
	          
	        </div>
        </div>
	</div>
</div>   
</body>
</html>