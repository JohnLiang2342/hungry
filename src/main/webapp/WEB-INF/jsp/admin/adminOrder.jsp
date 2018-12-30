<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
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
		width: 1800px;
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

	function deleteConfirm(id){		
		layer.confirm('确认要删除此订单？', function(index){
			$.ajax({
				type:"post",
				data:{id:id},
				url:"http://127.0.0.1:8080/adminOrder_delete",
				success:function(msg){						
					if(msg=="success"){
						window.location.href="adminOrder";
					}else{
						layer.alert("删除失败！");
					}						
				}
			})
			layer.close(index);
		});		
	}
	
	function deliveryConfirm(id){		
		layer.confirm('确认要设置为已发货？', function(index){
			$.ajax({
				type:"post",
				data:{id:id},
				url:"http://127.0.0.1:8080/adminOrder_delivery",
				success:function(msg){						
					if(msg=="success"){
						window.location.href="adminOrder";
					}else{
						layer.alert("发货失败！");
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
				<li class="layui-nav-item"><a href="adminCategory" style="font-size: 20px;">分类管理</a></li>
  				<li class="layui-nav-item"><a href="adminUser" style="font-size: 20px;">注册用户</a></li>
			  	<li class="layui-nav-item layui-this"><a href="adminOrder" style="font-size: 20px;">订单管理</a></li>				
			</div>
		</ul>				
	</div>
		
	<div class="table">
		<div class="listCategory">
			<table class="layui-table">
				<colgroup>
				    <col width="100">
				    <col width="250">
				    <col>
				    <col width="120">
				    <col width="160">
				    <col width="170">
				    <col width="170">
				    <col width="170">
				    <col width="90">				    
				    <col width="100">
				    <col width="100">					    
			  	</colgroup>
			    <thead>
				<tr>
				  <th>ID</th>
				  <th>订单号</th>
				  <th>收货地址</th>
				  <th>收货人</th>
				  <th>联系方式</th>
				  <th>创建时间</th>
				  <th>发货时间</th>
				  <th>确认收货时间</th>
				  <th>状态</th>	
				  <th>发货</th>				  
				  <th>删除</th>
				  
			    </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${os}" var="o">
			    		<tr>
			    			<td>${o.id}</td>
				    		<td>${o.order_code}</td>
				    		<td>${o.address}</td>
				    		<td>${o.receiver}</td>
				    		<td>${o.phone}</td>
				    		<td>${o.create_date}</td>
				    		<td>${o.delivery_date}</td>
				    		<td>${o.confirm_date}</td>
				    		
				    				    		
				    		<c:choose>
				    			<c:when test="${o.is_pay>0}">
				    				<c:choose>
				    					<c:when test="${o.delivery_date==null}">
				    						<td><span style="color:green;">已付款</span></td>
				    					</c:when>
				    					<c:otherwise>
				    						<c:choose>
				    							<c:when test="${o.confirm_date==null}">
				    								<td><span style="color:blue;">已发货</span></td>
				    							</c:when>
				    							<c:otherwise>
				    								<td><span style="color:black;">完成订单</span></td>
				    							</c:otherwise>
				    						</c:choose>
				    					</c:otherwise>
				    				</c:choose>
				    			</c:when>
				    			<c:otherwise>
				    				<td><span style="color:red;">未付款</span></td>
				    			</c:otherwise>
				    		</c:choose>
				    		
				    		
				    		
				    		
				    		<%-- <c:choose>
								<c:when test="${o.delivery_date!=null}">
									<td><span style="color:blue;">已发货</span></td>																		
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${o.is_pay>0}">
											<td><span style="color:green;">已付款</span></td>
										</c:when>
										<c:otherwise>
											<td><span style="color:red;">未付款</span></td>
										</c:otherwise>
									</c:choose>
									
								</c:otherwise>
							</c:choose> --%>
			    						    		
				    		<c:choose>
								<c:when test="${o.delivery_date==null}">
									<c:choose>
										<c:when test="${o.is_pay>0}">
											<td><a href="javascript:deliveryConfirm(${o.id});" class="layui-btn layui-btn-normal layui-btn-sm">发货</a></td>	
										</c:when>
										<c:otherwise>
											<td><a href="" class="layui-btn layui-btn-disabled layui-btn-sm">发货</a></td>
										</c:otherwise>
									</c:choose>															
								</c:when>
								<c:otherwise>
									<td><a href="" class="layui-btn layui-btn-disabled layui-btn-sm">发货</a></td>
								</c:otherwise>
							</c:choose>										    
				    		<td><a href="javascript:deleteConfirm(${o.id});" class="layui-btn layui-btn-danger layui-btn-sm">删除</a></td>
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