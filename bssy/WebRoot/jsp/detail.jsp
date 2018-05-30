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
    <title>Fly Template v3.0，基于 layui 的极简社区页面模版</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path %>/res/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path %>/res/css/global.css">
    <script src="<%=path %>/res/layui/layui.js"></script>
    <script src="<%=path %>/js/jquery.min.js"></script>
    <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 100px; text-align: center;}
  </style>
</head>
<body>

<div class="fly-header layui-bg-black">
  <div class="layui-container">
    <a class="fly-logo" href="index.action">
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
          <cite class="layui-hide-xs">${user.username }</cite>
          <i class="iconfont icon-renzheng layui-hide-xs" title=""></i>
          <i class="layui-badge fly-badge-vip layui-hide-xs">你好</i>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="<%=path %>/jsp/set.jsp"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
          
          <hr style="margin: 5px 0;">
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
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <h1>${newstitle}</h1>
                <div class="fly-detail-info">
                    
                    <span class="layui-badge layui-bg-green fly-detail-column">发布时间：</span>
                    <span>${fn:substring(news.createtime,0, 16)} </span>


                    <span class="fly-list-nums">
            <a href="#comment"><i class="iconfont" title="回答">&#xe60c;</i> ${pingluncount }</a>
            <i class="iconfont" title="人气">&#xe60b;</i> ${news.dianjicishu }
          </span>
                </div>



                <!--新闻详情内容展示------------------------------------>
                <div class="detail-body photos">
                    <p>
                        ${news.content }
                    </p>

                </div>
            </div>


            <!--评论区---------------------------------------->
            <div class="fly-panel detail-box" id="flyReply">
            	<a name="comment"></a>
                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>评论区</legend>
                </fieldset>
                
				<a id="anchor"></a>
                <div id="pagelist">
                <ul class="jieda" id="jieda">
                
                <c:if test="${(pingluncount)>0}">
                	<c:forEach items="${pinglunlist}" var="bean">
                	    <li data-id="111" class="jieda-daan">
                            <div class="fly-detail-user">
                                 <cite>${ bean.user.username } </cite>
                                 <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                             <span></span>

                            </div>

                            <div class="detail-hits">
                                <span>${fn:substring(bean.createtime,5, 16)}</span>
                            </div>

                        <div class="detail-body jieda-body photos">
                            <p>${bean.pingluncontent }</p>
                        </div>
                        <div class="jieda-reply">
                        </div>
                    </li>
                	</c:forEach>
    
                    
					</c:if>


                    <!-- 无数据时 -->

                     <c:if test="${(pingluncount)<=0}"><li class="fly-none">消灭零回复</li></c:if>
                     
                </ul>
				</div>

                    <!--分页工具-&${bean.title }45;&#45;-->
                    <div style="text-align: center">
				      <div id="demo0"></div>
					  <ul id="biuuu_city_list"></ul> 
				     </div>

				<!-- 发表评论 -->
				
                <div class="layui-form layui-form-pane">
                    <form action="wangzhanmethod!pinglun2.action" method="post">
                    	
                        <div class="layui-form-item layui-form-text">
                            
                            <div class="layui-input-block">
                                <textarea id="L_content" name="pingluncontent" required lay-verify="required" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                            </div>
                        </div>
                        <input type="hidden" id="contentid" name="contentid" value="${news.id }"/>
                        <div class="layui-form-item">
                            
                            <button class="layui-btn" lay-filter="*" lay-submit>提交评论</button>
                        </div>
                    </form>
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





        <!--评论排行-&#45;&#45;&#45;&#45;&#45;&#45;-->
        <dl class="fly-panel fly-list-one">
            <dt class="fly-panel-title">热议推荐</dt>
            <c:if test="${commentCountList!=null }">
            <c:forEach items="${commentCountList}" var="bean">
	        <dd>
	          <a href="wangzhanmethod!showcontent.action?id=${bean[2] }" >
            	<c:if test="${fn:length(bean[0])>18}">${fn:substring(bean[0],0, 18)}...</c:if>
        		<c:if test="${fn:length(bean[0])<=18}">${bean[0] }</c:if>
           </a>
	
	          <i class="iconfont icon-pinglun1" title="回答" style="float:right;">${bean[1] }</i>
	
	        </dd>
	        </c:forEach>
			
			</c:if>
            <!-- 无数据时 -->
			<c:if test="${commentCountList==null }">
            <div class="fly-none">没有相关数据</div>
			</c:if>
        </dl>

        <!--相似推荐滚动&#45;&#45;&#45;&#45;-->
        
        
        <dl class="fly-panel fly-list-one">
            <dt class="fly-panel-title">相似推荐</dt>
           <div class="layui-carousel" id="test2" style="margin-top: 15px;">
          <div carousel-item="">
            <c:forEach items="${similarContentList}" var="bean">
            <div>
            	<a href="wangzhanmethod!showcontent.action?id=${bean.id }">
            		<p class="layui-bg-green demo-carousel">
            		<c:if test="${fn:length(bean.title)>18}">${fn:substring(bean.title,0, 18)}...</c:if>
        			<c:if test="${fn:length(bean.title)<=18}">${bean.title }</c:if>
        			</p>
        		</a>
            </div>
            </c:forEach>
          </div>
        </div>
        


            <!-- 无数据时 -->
            <c:if test="${similarContentList==null }">
            <div class="fly-none">没有相关数据</div>
            </c:if>
        </dl>


        <div class="fly-panel">
            <div class="fly-panel-title">
                广告区域
            </div>
            <div class="fly-panel-main">
                <a href="" target="_blank" class="fly-zanzhu" style="background-color: #393D49;">虚席以待</a>
            </div>
        </div>

        </div>
    </div>
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




/* 将后台返回的数据渲染到页面 */   
function printDataToPage(data){

     var s="<ul class='jieda' id='jieda'>";
      $.each(data,function(v,bean){
      				var month=bean.createtime.month+1;
      				if(month<10){
      				   month="0"+month;
      				}
      				var date=month+"-"+bean.createtime.date+" "+bean.createtime.hours+":"+bean.createtime.minutes;

      			   s+="<li data-id='111' class='jieda-daan'>";
      			   s+="<div class='fly-detail-user'>";
      			   s+="<cite>"+bean.user.username+"</cite>";
                   s+="<i class='iconfont icon-renzheng' title='认证信息：XXX'></i>";
                   s+="</div>";
                   s+="<div class='detail-hits'>";
                   s+="<span>"+date+"</span>";
                   s+="</div>";
                   s+="<div class='detail-body jieda-body photos'>";
                   s+="<p>"+bean.pingluncontent+"</p>";
                   s+="</div>";
       }); 
       s+="</ul>"
       $('#pagelist').html(s);
}

/* 请求数据 */
 function getIndexPage(obj){
			var contentid=${news.id }; 
            $.ajax({
                type:"post",
                async:false,
                scriptCharset: 'utf-8',
                url:"pagemethod!pageForComment.action",
                data:{curPage:obj.curr, limt:obj.limit,contentid:contentid},
                success:function(data,status){
                    
                    printDataToPage(eval(data));
                    $("html,body").animate({scrollTop:$("#anchor").offset().top},1000);

                }
            });

 }
        
     
     
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  
	  //总页数低于页码总数
  laypage.render({
    elem: 'demo0'
    ,limit:3
    ,count:${total }//数据总数
    
     ,jump: function(obj, first){
    //obj包含了当前分页的所有参数，比如：
    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    console.log(obj.limit); //得到每页显示的条数
    
    //首次不执行
    if(!first){
      console.log(obj.curr);
      $('#pagelist').html("");
      getIndexPage(obj);
    }
  }
  });
 });
 
 layui.config({
  version: "3.0.0",
  base: jsUrl
}).extend({
  fly: 'index'
}).use('fly');
</script>



</body>
</html>