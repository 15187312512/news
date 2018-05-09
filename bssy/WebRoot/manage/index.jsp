<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%

if(session.getAttribute("wangzhanmanage") == null){
	response.sendRedirect("login.jsp");
	return;
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>后台管理</title>

<link href="ui/themes/default/style.css" rel="stylesheet" type="text/css" />
<link href="ui/themes/css/core.css" rel="stylesheet" type="text/css" />
<link href="ui/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="ui/themes/css/ieHack.css" rel="stylesheet" type="text/css" />
<![endif]-->

<script src="ui/js/speedup.js" type="text/javascript"></script>
<script src="ui/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="ui/js/jquery.cookie.js" type="text/javascript"></script>
<script src="ui/js/jquery.validate.js" type="text/javascript"></script>
<script src="ui/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="ui/xheditor/xheditor-1.1.9-zh-cn.min.js" type="text/javascript"></script>
<script src="ui/uploadify/scripts/swfobject.js" type="text/javascript"></script>
<script src="ui/uploadify/scripts/jquery.uploadify.v2.1.0.js" type="text/javascript"></script>

<script src="ui/js/dwz.min.js" type="text/javascript"></script>
<script src="ui/js/dwz.regional.zh.js" type="text/javascript"></script>


<script type="text/javascript">
$(function(){
	DWZ.init("ui/dwz.frag.xml", {
		loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"ui/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});
</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<!-- <a class="logo" href="http://">标志</a> -->
				<div style="font-size: 25px;font-weight: bold;color: #fff;padding-left:10px;height: 40px;;padding-top: 10px;">
				后台管理</div>
				<ul class="nav">
				
					<li>
					<a href='#' onclick='javascript:window.parent.location="manage/login.jsp"'>安全退出系统</a>
					</li>
					<li><a href="houtaimethod!changepwd.action" target="dialog" width="600">修改密码</a></li>
					
			
				
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
                  
				<div class="accordion" fillSpace="sidebar">
				
					<div class="accordionHeader">
						<h2><span>Folder</span>内容管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>内容管理</a>
								<ul>

									<li><a href="houtaimethod!contentlist.action" target="navTab" fresh="false" rel="contentlist">内容管理</a></li>
									
								</ul>
							</li>
						
							
						</ul>
					</div>
					


					<div class="accordionHeader">
						<h2><span>Folder</span>栏目管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>栏目管理</a>
								<ul>

									<li><a href="houtaimethod!lanmulist.action" target="navTab" fresh="false" rel="lanmulist">栏目管理</a></li>
									
								</ul>
							</li>
						
							
						</ul>
					</div>
					
					
					<div class="accordionHeader">
						<h2><span>Folder</span>评论管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>评论管理</a>
								<ul>

									<li><a href="houtaimethod!pinglunlist.action" target="navTab" fresh="false" rel="pinglunlist">评论管理</a></li>
									
								</ul>
							</li>
						
							
						</ul>
					</div>
					
					
					<div class="accordionHeader">
						<h2><span>Folder</span>用户管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>用户管理</a>
								<ul>

									<li><a href="houtaimethod!userlist.action" target="navTab" fresh="false" rel="userlist">用户管理</a></li>
									
								</ul>
							</li>
						
							
						</ul>
					</div>
					

					
					
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<h1 style="font-size: 22px;text-align: center;">欢迎使用本平台</h1>
						</div>
						<div class="pageFormContent" layoutH="80">
							
							
							
							
							
						</div>
					</div>
					
				</div>
			</div>
		</div>

	</div>

	

</body>
</html>