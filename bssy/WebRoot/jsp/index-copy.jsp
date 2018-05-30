<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>新闻发布网站首页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="<%=path %>/res/layui/css/layui.css">
  <link rel="stylesheet" href="<%=path %>/res/css/global.css">
  <script src="<%=path %>/res/layui/layui.js"></script>
  <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 100px; text-align: center;}
  </style>
</head>
<body>

<div class="fly-header layui-bg-black">
  <div class="layui-container">
    <a class="fly-logo" href="/">
      <img src="<%=path %>/res/images/logo.png" alt="layui">
    </a>

    
    <ul class="layui-nav fly-nav-user">
      <c:if test="${user==null}">
      <!-- 未登入的状态 -->
      <li class="layui-nav-item">
        <a class="iconfont icon-touxiang layui-hide-xs" href="<%=path %>/jsp/login.jsp"></a>
      </li>
      <li class="layui-nav-item">
        <a href="<%=path %>/jsp/login.jsp">登入</a>
      </li>
      <li class="layui-nav-item">
        <a href="<%=path %>/jsp/regist.jsp">注册</a>
      </li>
	  </c:if>
      
      <!-- 登入后的状态 -->
      <c:if test="${user!=null}">
      <li class="layui-nav-item">
        <a class="fly-nav-avatar" href="javascript:;">
        <cite class="layui-hide-xs">贤心</cite>
          <cite class="layui-hide-xs">${user.username }</cite>
          <i class="iconfont icon-renzheng layui-hide-xs" title=""></i>
          <i class="layui-badge fly-badge-vip layui-hide-xs">你好</i>
          <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
        </a>
        <dl class="layui-nav-child">
          <dd><a href="<%=path %>/jsp/set.jsp"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
          
          <hr style="margin: 5px 0;" />
          <dd><a href="wangzhanmethod!loginout.action" style="text-align: center;">退出</a></dd>
        </dl>
      </li>
      </c:if>
    </ul>
  </div>
</div>

<div class="fly-panel fly-column">

<!-- 新闻栏目列表 -->
  <div class="layui-container">

    <ul class="layui-clear">
    <li class="layui-nav-item"><a href="index.action">首页</a></li>
    <c:forEach items="${lanmulist}" var="bean">
       	<li class="layui-nav-item">
   	    <a href="wangzhanmethod!lanmulist.action?id=${bean.id }" class="current">${bean.lanmuming }</a>
   	    </li>
      </c:forEach>
    <li class="layui-nav-item"><a href="<%=path %>/manage/login.jsp" class="current">后台管理</a></li>
      
    </ul>

    <div class="fly-column-right layui-hide-xs">
	<form action="wangzhanmethod!search.action" method="post">
      <div class="class="layui-inline">
    		<div class="layui-input-inline">
    	    <input type="text" name="keyword" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" >
      		</div>
      		<button class="layui-btn layui-input-inline" lay-submit=""  style="width:60px;"><i class="layui-icon"></i></button>
    	</div>
    </form>
    </div>

  </div>
</div>


<!--新闻列表---------------------------------------->
<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel">
        <div class="fly-panel-title fly-filter">
          <a>当前位置：${title }</a>
         
        </div>
        
        

        
        <ul class="fly-list">
        	<c:forEach items="${contentlist}" var="bean">
        	
          <li>
            <h2>
              <a class="layui-badge">${bean.lanmu.lanmuming }</a>
              <a href="wangzhanmethod!showcontent.action?id=${bean.id }">
                <c:if test="${fn:length(bean.title)>15}">${fn:substring(bean.title,0, 15)}...</c:if>
        		<c:if test="${fn:length(bean.title)<=15}">${bean.title }</c:if>
              </a>
            </h2>
            <div class="fly-list-info">
              <cite>发布时间：</cite>
              <span>${fn:substring(bean.createtime,5, 10)}</span>

              <span class="fly-list-nums"> 
                <i class="iconfont" title="人气">&#xe60b;</i>${bean.dianjicishu} 
              </span>
            </div>
          </li>
          
          </c:forEach>
         

        </ul>
      </div>

      <!--分页工具-&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;-->

      <div style="text-align: center">
      <div id="demo0"></div>
	  <ul id="biuuu_city_list"></ul> 
      </div>
      
      <div class="fly-panel" style="margin-bottom: 0;">

			<!--滚动推荐栏-->
        <div class="layui-carousel" id="test2" style="margin-top: 15px;">
          <div carousel-item="">
            <c:forEach items="${suggestlist}" var="bean">
            <div>
            	<a href="wangzhanmethod!showcontent.action?id=${bean.id }">
            		<p class="layui-bg-green demo-carousel">
            		<c:if test="${fn:length(bean.title)>25}">${fn:substring(bean.title,0, 25)}...</c:if>
        			<c:if test="${fn:length(bean.title)<=25}">${bean.title }</c:if>
        			</p>
        		</a>
            </div>
            </c:forEach>
          </div>
        </div>

        <!-- 条目中可以是任意内容，如：<img src=""> -->




        <div style="text-align: center">
          <div class="laypage-main">
           <!--  <a href="jie/index.html" class="laypage-next">更多求解</a> -->
          </div>
        </div>

      </div>
    </div>
    <div class="layui-col-md4">
      <!--点击排行-&#45;&#45;&#45;&#45;&#45;&#45;&#45;-->
      <div class="fly-panel">
        <h3 class="fly-panel-title">点击排行</h3>
        <ul class="fly-panel-main fly-list-static">
         <c:forEach items="${paihanglist}" var="bean">
         	<li>
            <a href="wangzhanmethod!showcontent.action?id=${bean.id }" >
            	<c:if test="${fn:length(bean.title)>18}">${fn:substring(bean.title,0, 18)}...</c:if>
        		<c:if test="${fn:length(bean.title)<=18}">${bean.title }</c:if>
            </a>
            <span style="float:right;">
            ${bean.dianjicishu }
            <i class="iconfont" title="人气" >&#xe60b;</i> 
             </span>
             
              
          	</li>
         </c:forEach>
        </ul>
      </div>





      <!--评论排行&#45;&#45;&#45;&#45;&#45;&#45;-->
      <dl class="fly-panel fly-list-one">
        <dt class="fly-panel-title">本周热议</dt>
        <c:forEach items="${commentCountList}" var="bean">
        <dd>
          <a href="wangzhanmethod!showcontent.action?id=${bean[2] }" >
            	<c:if test="${fn:length(bean[0])>18}">${fn:substring(bean[0],0, 18)}...</c:if>
        		<c:if test="${fn:length(bean[0])<=18}">${bean[0] }</c:if>
           </a>

          <i class="iconfont icon-pinglun1" title="回答" style="float:right;">${bean[1] }</i>

        </dd>
        </c:forEach>






        <!-- 无数据时 -->
			<c:if test="${commentCountList==null }">
            <div class="fly-none">没有相关数据</div>
			</c:if>
      </dl>

      <div class="fly-panel">
        <div class="fly-panel-title">
          这里可作为广告区域
        </div>
        <div class="fly-panel-main">
          <a href="" target="_blank" class="fly-zanzhu" style="background-color: #393D49;">虚席以待</a>
        </div>
      </div>



    </div>
  </div>
</div>

<div class="fly-footer">
  <p><a href="#" target="_blank">新闻网站</a> 2018 &copy; <a href="#" target="_blank">cannon.zhang</a></p>

</div>


<script>
var pathName = document.location.pathname;
var index = pathName.substr(1).indexOf("/");
var result = pathName.substr(0,index+1);
var jsUrl=result+'/res/mods/';
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#test1'
     //设置容器宽度
    ,arrow: 'always' //始终显示箭头
    //,anim: 'updown' //切换动画方式
  });
    //改变下时间间隔、动画类型、高度
  carousel.render({
    elem: '#test2'
    ,width: '100%'
    ,interval: 2000
    ,anim: 'fade'
    ,height: '120px'
  });
});

layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
	
	  //总页数低于页码总数
  laypage.render({
    elem: 'demo0'
    ,limit:7
    ,count: 50 //数据总数
  });
});


</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>