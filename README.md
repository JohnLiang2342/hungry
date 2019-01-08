# hungry-

##### 简介
这是一个简易的外卖网站，主要是熟悉框架的使用  
项目分为两部分，前台和后台  
前端使用layui，有一小部分使用bootstrap（即使用了前端框架，我设计的页面还是很丑...）   
项目后端框架使用springboot + mybatis  
数据库使用mysql

前台：   
登录页面，注册页面，忘记密码页面  
注册页面，忘记密码页面使用了秒嘀科技的短信发送，用于验证用户的注册与找回密码  
首页：有基于layui前端框架的轮播图片，有各个分类的展示  
各个食物详情页面：可确认购买数量后添加到购物车
搜索：基于基础的like条件模糊搜索  
购物车：可删除购物项，按付款按钮可跳转到付款页面  
付款页面：一个假的支付宝二维码，直接按确认付款按钮就好  
我的订单页面：每确认付款一次购物车，就会生成一个订单，用户的所有订单信息
用户信息页面：可修改密码、用户名、头像  

后台：  
分类管理页面：显示所有食物分类，每个分类项可进行修改分类名、删除分类操作。可进入每个分类下的食品管理页。页面最下方可添加信分类（不建议，因为会破坏前端布局）  
食品管理页面：显示每个食品的信息，每个食物项可进行修改食物信息、删除食物操作。可重新上传食物图片。页面最下方可添加食物  
订单管理：显示各种订单信息。



流程：
用户可在“食物详情”页面选择数量后添加到购物车，在“购物车”页面用户可点击付款按钮跳转到付款页面。跳到付款页面后可点击确认付款。付款完成后“我的订单”页面新增一个订单项。若用户在付款页面时关闭了付款页面，“我的订单”页面也会新增一个订单项，但付款状态显示未付款，用户可点击付款按钮进行上述付款流程。  

在后台的“订单管理”页面中。若用户已正常付款，则状态一栏中显示已付款，同时激活发货按钮。点击发货则显示已发货。否则显示未付款，不激活发货按钮。若用户在已付款的订单点击确认收货按钮，则在状态一栏显示完成订单。
  


##### 项目使用的插件
秒嘀科技的短信发送，用于用户注册，忘记密码  
pagehelper，用于Mybatis分页  

##### 不足
代码管理混乱，前端公共区域没有单独提取出来，大量代码重复，维护困难

### 登录页面
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/1.png)

### 注册页面
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/2.png)

### 忘记密码
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/3.png)

### 首页
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/4.png)

### 搜索
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/5.png)

### 购物车
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/6.png)

### 我的订单
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/7.png)

### 修改用户信息
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/8.png)

### 后台-分类管理
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/9.png)

### 后台-每个分类下的食品管理
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/10.png)

### 后台-每个食品下的图片管理
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/11.png)

### 后台-订单管理
![](https://raw.githubusercontent.com/LJH612342/hungry-/master/readmeImg/12.png)

能力有限，项目还有很多不足的地方 :)
