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
</head>
<body>

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
                <li ><a href="<%=path %>/jsp/login.jsp">登入</a></li>
                <li class="layui-this">找回密码</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form action="/user/repass" method="post">
                            <div class="layui-form-item">
                                <label for="L_email" class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_email" name="email" required lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_pass" class="layui-form-label">密码</label>
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
                                <label for="L_vercode" class="layui-form-label">验证码</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid">
                                    <span style="color: #c00;"></span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <input type="hidden" name="username" value="{{d.username}}">
                                <input type="hidden" name="email" value="{{d.email}}">
                                <button class="layui-btn" alert="1" lay-filter="*" lay-submit>提交</button>
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

<script src="../res/layui/layui.js"></script>
<script>
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '../../res/images/avatar/00.jpg'
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