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
    <title>帐号设置</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path %>/res/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path %>/res/css/global.css">
    
<script language="javascript" type="text/javascript">

function checkmessform(){
  if (document.getElementById('L_username').value=="")
	{
		alert("用户名不能为空");
		return false;
	}
	var valid=/^\w+$/;
	if(!valid.test(document.getElementById('L_username').value)){
		alert("用户名必须是数字、字母或下划线");
		return false;
	}
}

function checkpassform()
{
	 
	 

	if (document.getElementById('L_nowpass').value=="")
	{
		alert("密码不能为空");
		return false;
	}
	if (document.getElementById('L_nowpass').value.length<6)
	{
		alert("密码长度必须大于6位");
		return false;
	}
	if(document.getElementById('oldpass').value != document.getElementById('L_nowpass').value){
	    alert("当前密码输入错误");
		return false;
	}
	
	
	if (document.getElementById('L_pass').value != document.getElementById('L_repass').value)
	{
		alert("确认密码与密码不一致");
		return false;
	}	 

	
}
</script>
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
          
          <hr style="margin: 5px 0;" />
          <dd><a href="wangzhanmethod!loginout.action" style="text-align: center;">退出</a></dd>
        </dl>
      </li>
      </c:if>
    </ul>
    </div>
</div>
<div class="fly-panel fly-column">
    <div class="layui-container">

    <ul class="layui-clear">
    <li class="layui-nav-item"><a href="index.action">首页</a></li>
    <li class="layui-nav-item"><a href="<%=path %>/manage/login.jsp" class="current">后台管理</a></li>
    </ul>



    </div>
</div>

<div class="layui-container fly-marginTop fly-user-main">

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>
	<!-- 获取session中的user对象 -->
	<c:set var="u" value="${sessionScope.user}"/> 
	
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li class="layui-this" lay-id="info">我的资料</li>
                <!-- <li lay-id="avatar">头像</li> -->
                <li lay-id="pass">密码</li>
                <!-- <li lay-id="bind">帐号绑定</li> -->
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-form layui-form-pane layui-tab-item layui-show">
                    <form action="wangzhanmethod!updateUserM.action" method="post" onsubmit="return checkmessform()">
                        <div class="layui-form-item">
                            <label for="L_email" class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_email" name="email" required lay-verify="email" autocomplete="off" value="${user.email }" class="layui-input">
                            </div>
                            
                        </div>
                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_username" name="username" required lay-verify="required" autocomplete="off" value="${user.username }" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_city" class="layui-form-label">城市</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_city" name="city" autocomplete="off" value="${user.city } " class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
                        </div>
                        </form>
                </div>

                <!-- <div class="layui-form layui-form-pane layui-tab-item">
                    <div class="layui-form-item">
                        <div class="avatar-add">
                            <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                            <button type="button" class="layui-btn upload-img">
                                <i class="layui-icon">&#xe67c;</i>上传头像
                            </button>
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
                            <span class="loading"></span>
                        </div>
                    </div>
                </div> -->

                <div class="layui-form layui-form-pane layui-tab-item">
                    <form action="wangzhanmethod!updatePass.action" method="post" onsubmit="return checkpassform()">
                        <div class="layui-form-item">
                            <label for="L_nowpass" class="layui-form-label">当前密码</label>
                            <input type="hidden" id="oldpass" name="oldpass" value="${user.password }"/>
                            <div class="layui-input-inline">
                                <input type="password" id="L_nowpass" name="nowpass" required lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_pass" class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_repass" class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
                        </div>
                    </form>
                </div>


            </div>

        </div>
    </div>
</div>
</div>

<div class="fly-footer">
    <p><a href="#" target="_blank">新闻网站</a> 2018 &copy; <a href="#" target="_blank">cannon.zhang</a></p>

</div>

<script src="<%=path %>/res/layui/layui.js"></script>
<script>
var pathName = document.location.pathname;
var index = pathName.substr(1).indexOf("/");
var result = pathName.substr(0,index+1);
var jsUrl=result+'/res/mods/';
layui.config({
  version: "3.0.0",
  base: jsUrl
}).extend({
  fly: 'index'
}).use('fly');
</script>
</body>
</html>