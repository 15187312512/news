<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻发布平台</title>
<meta name="keywords" content="free templates, Business Website, Free CSS Template, CSS, HTML" />
<meta name="description" content="Business Template is a free css template provided by www.865171.cn" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>

	<script language="javascript" type="text/javascript"> 

		
function registershow(){
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.showModalDialog("register.jsp?t="+t, null, 
		'dialogWidth:825px;dialogHeight:500px;help:no;unadorned:no;resizable:no;status:no;scroll:no');
	}
</script>
</head>
<body>
<div id="templatemo_header_wrapper">
  <div id="templatemo_header" align="center">
  <br/><br/><br/>
    <span  style="color: red; font-size: 50px;"><br /></span> 
  </div>
  <!-- end of header -->
</div>
<!-- end of header wrapper -->

<div id="templatemo_menu_wrapper">

  <div id="templatemo_menu">
    <ul>
      <li><a href="." class="current">主页</a></li>
      <c:forEach items="${lanmulist}" var="bean">
       	<li><a href="wangzhanmethod!lanmulist.action?id=${bean.id }" class="current">${bean.lanmuming }</a></li>
      </c:forEach>
    </ul>
  </div>
  <!-- end of menu -->
</div>
<!-- end of menu wrapper -->
<div id="tempatemo_content_wrapper">
  <div id="templatemo_content">
    
    <div id="content_panel">
      <div id="column_w610">
        <div class="header_01">${mulu }</div>
        <div align="center" style="font-size: 25px;color: red;">${newstitle}</div>
        <br/> <br/>
         <div align="right" style="font-size: 15px;">点击数：${news.dianjicishu }&nbsp;&nbsp;&nbsp;&nbsp; 添加时间：${news.createtime } </div>
         
         <div align="left" style="font-size: 15px;"> <a href="wangzhanmethod!pinglun.action?id=${news.id }">发表评论</a> &nbsp;&nbsp;&nbsp;&nbsp;  
         <a href="wangzhanmethod!pinglunlist.action?id=${news.id }">评论条数:${pingluncount }</a></div>
         
         <br/>
       
       ${news.content }
        
       
        
        
      </div>
      <!-- end of column w610 -->
      <div id="column_w290">
      <c:if test="${user==null}">
       &nbsp;&nbsp;&nbsp;&nbsp;
      <a href="wangzhanmethod!login.action" >用户登录</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       <a href="####" onclick="registershow()">用户注册</a>
      </c:if>
     <c:if test="${user!=null}">
      欢迎您，${user.username } &nbsp;&nbsp;&nbsp;&nbsp;
      <a href="wangzhanmethod!loginout.action" >用户退出</a>
      </c:if>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="manage/login.jsp">管理后台</a>
        <div class="header_02">新闻点击排行</div>
        <table style="font-size: 20px;" width="100%"  cellspacing="15">
         <c:forEach items="${paihanglist}" var="bean">
        <tr>
        <td width="80%"><a href="wangzhanmethod!showcontent.action?id=${bean.id }">
        <span style="color: blue;">
        <c:if test="${fn:length(bean.title)>8}">${fn:substring(bean.title,0, 8)}...</c:if>
        <c:if test="${fn:length(bean.title)<=8}">${bean.title }</c:if>
        </span></a></td>
        <td width="20%">${bean.dianjicishu }</td>

        </tr>
       
        </c:forEach>
        
        </table>
        
        
        
        
        <div class="header_02">新闻搜索</div>
        <div class="column_w290_content">
          <form action="wangzhanmethod!search.action" method="post">
            <input type="text" value="请输入新闻标题关键字" name="keyword" size="10" class="inputfield" title="email address" onfocus="clearText(this)" onblur="clearText(this)" />
            <input type="submit" name="submit" value="搜索"  />
          </form>
        </div>
      </div>
      <!-- end of column 290 -->
      <div class="cleaner"></div>
    </div>
    <!-- end of content panel -->
    <div class="cleaner"></div>
  </div>
  <!-- end of content -->
</div>
</body>
</html>
