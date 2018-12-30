<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类管理</title>
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
		width: 1200px;
		height:325px;
		padding: 10px 15px;
		margin-top: 50px;
		background: #FFFFFF;
	}
	div.add_div{
		margin: 0 auto;			
		width: 400px;
		margin-top: 20px;
	}
	div.pageDiv{
		text-align:center;
	}
</style>
<script type="text/javascript">
	/* 加载layui模块 */
	$(function(){
		layui.use(['layer','form','element'], function(){
		  var layer = layui.layer
		  ,form = layui.form
		  ,element = layui.element;
		  //建造实例
		  
		});
		
		$("#submit").click(function(){
			var name = $("#name").val();
			if(checkSubmit()){
				$.ajax({
					type:"post",
					data:{name:$("#name").val()},
					url:"http://127.0.0.1:8080/adminCategory_add",
					success:function(msg){						
						if(msg=="success"){
							window.location.href="adminCategory";
						}else{
							layer.alert("增加失败！");
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
		
	});
	function deleteConfirm(id){		
		layer.confirm('确认要删除？', function(index){
			$.ajax({
				type:"post",
				data:{id:id},
				url:"http://127.0.0.1:8080/adminCategory_delete",
				success:function(msg){						
					if(msg=="success"){
						window.location.href="adminCategory";
					}else{
						layer.alert("删除失败！");
					}						
				}
			})
			layer.close(index);
		});		
	}
</script>
<body>
<div class="big_div">			
	<div id="div_nav_top">
		<ul class="layui-nav" id="item" lay-filter=""style="">
			
			<img src="img/adminLogo.png" style="margin-left:320px;width: 300px;height: 100%;"/>
			<div id="div_nav_item">
				<li class="layui-nav-item layui-this"><a href="adminCategory" style="font-size: 20px;">分类管理</a></li>
  				<li class="layui-nav-item"><a href="adminUser" style="font-size: 20px;">注册用户</a></li>
			  	<li class="layui-nav-item"><a href="adminOrder" style="font-size: 20px;">订单管理</a></li>				
			</div>				
		</ul>				
	</div>
	
	
	<div class="table">
		<div class="listCategory">
			<table class="layui-table">
				<colgroup>
				    <col width="150">
				    <col>
				    <col width="200">
				    <col width="100">
				    <col width="100">						    
			  	</colgroup>
			    <thead>
				<tr>
				  <th>ID</th>
				  <th>分类名称</th>
				  <th>食品管理</th>
				  <th>编辑</th>
				  <th>删除</th>
				  
			    </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${cs}" var="c">
				    	<tr>
				    		<td>${c.id}</td>
				    		<td>${c.name}</td>
				    		<td><a href="adminFood?cid=${c.id}" class="layui-icon layui-icon-edit" style="font-size: 30px;color: #393D49;"></a></td>
				    		<td><a href="editCategory?cid=${c.id}" class="layui-btn layui-bg-cyan layui-btn-sm">编辑</a></td>
				    		<td><a href="javascript:deleteConfirm(${c.id});" class="layui-btn layui-btn-danger layui-btn-sm">删除</a></td>			    		
				    	<%-- deleteCategory?cid=${c.id} --%>
				    	</tr>
			    	</c:forEach>
			    </tbody>
			</table>
		</div>
	</div>
	
	<div class="pageDiv">
        <%@include file="../adminPage.jsp"%>
    </div>
	
	<div class="add_div">
		<div class="layui-card">
	        <div class="layui-card-header" style="background: #393D49;color: #FFFFFF;">添加分类（不建议添加）</div>
	        <div class="layui-card-body">
	        	<div class="layui-form">
	        		<div class="layui-form-item">
	        			<label class="layui-form-label">分类名</label>
	        			<div class="layui-input-inline">
 							<input type="text" name="name" id="name" autocomplete="off" class="layui-input">
						</div>
	        		</div>
	        		<div class="layui-form-item" style="text-align:center">
						<button class="layui-btn" id="submit">提交</button>
					</div>
	        		
	        	</div>
	          
	        </div>
        </div>
	</div>
				
</div>
</body>
</html>