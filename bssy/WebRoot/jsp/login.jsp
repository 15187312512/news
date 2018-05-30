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
    <title>登入</title>

    <link rel="stylesheet" href="<%=path %>/res/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path %>/res/css/global.css">
    
 <script type="text/javascript">
function aa(){

window.close();
}

		
		
var code ; //在全局 定义验证码
function createCode(){ 
code = "";
var codeLength = 4;//验证码的长度
var checkCode = document.getElementById("checkCode");
checkCode.value = "";

var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*32);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
checkCode.value = code;
}
function checkregisterform(){
	
var inputCode = document.getElementById("input1").value.toUpperCase();

if(inputCode.length <=0) {
   alert("请输入验证码！");
   return false;
}
else if(inputCode != code ){
   alert("验证码输入错误！");
   createCode();
   return false;
		
		
		
}
	 
	 if (document.getElementById('user_name').value=="")
	{
		alert("账号不能为空");
		return false;
	}


	if (document.getElementById('user_password').value=="")
	{
		alert("密码不能为空");
		return false;
	}

	return true;
	
}




</script>   
</head>
<body onload="createCode()">

<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="/">
            <img src="<%=path %>/res/images/logo.png" alt="layui">
        </a>


        <ul class="layui-nav fly-nav-user">
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

        </ul>
    </div>
</div>

<!--新闻栏目列表-->

<div class="fly-panel fly-column">
    <div class="layui-container">

    <ul class="layui-clear">
    <li class="layui-nav-item"><a href="index.action">首页</a></li>
    <li class="layui-nav-item"><a href="<%=path %>/manage/login.jsp" class="current">后台管理</a></li>
    </ul>



    </div>
</div>
<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li class="layui-this">登入</li>
                <li><a href="<%=path %>/jsp/regist.jsp">注册</a></li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form action="wangzhanmethod!login2.action"  method="post"  onsubmit="return checkregisterform()">
                            <div class="layui-form-item">
                                <label for="L_email" class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_email" name="username" required lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_pass" class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_pass" name="password" required lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_vercode" class="layui-form-label">验证码</label>
                                <div class="layui-input-inline">
                                	 <input type="text" id="input1" name="vercode" required lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">              
          							 <input type="text" id="checkCode"  class="layui-input" readonly="true" style=""> <a href="####" onclick="createCode()">换一批</a>
                                </div>
                                
                                <div class="layui-form-mid">
                                    <span style="color: #c00;"></span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="*" lay-submit>立即登录</button>
                                <span style="padding-left:20px;">
                  
                </span>
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
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: './../res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: '../../res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>