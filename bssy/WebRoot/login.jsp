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
<link href="layui/css/layui.css" rel="stylesheet" type="text/css" media="screen,projection" />
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="myjs/bootstrap.js"></script>

    <script type="text/javascript">
       $(function(){


        erajs.onReady(function(){

	       return true;
	    },{
	        needValidated : true,
	        validationPath:'./validation/validation.xml',
	        loadValidationXml:true,
	        targetForm : 'loginForm'
	    });



})
    </script>
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

    <style type="text/css">
    div{
    margin:0px;
    padding:0px;
    }

.STYLE1 {color: #000000}
#Layer1 {
	position:absolute;
	width:619px;
	height:392px;
	z-index:1;
	left: 276px;
	top: -1px;
}
#Layer2 {
	position:absolute;
	width:468px;
	height:296px;
	z-index:2;
	left: 94px;
	top: 52px;
}
#Layer3 {
	position:absolute;
	width:924px;
	height:110px;
	z-index:2;
	left: -10px;
	top: 345px;
}
.STYLE2 {color: #728244}
.STYLE4 {color: #75894C}
#Layer4 {
	position:absolute;
	width:266px;
	height:342px;
	z-index:3;
	left: 113px;
	top: 2px;
}
#Layer5 {
	position:absolute;
	width:948px;
	height:365px;
	z-index:4;
	left: -55px;
	top: 49px;
}
#Layer6 {
	position:absolute;
	width:917px;
	height:537px;
	z-index:1;
	left: 43px;
	top: 194px;
}
#Layer7 {
	position:absolute;
	width:1024px;
	height:589px;
	z-index:1;
	left: 0px;
	top: 8px;
}
#logindemo {
border: 2px solid #397DBA;	
}
#logindemo:hover {
border: 2px solid #3B4E76;

}
.STYLE6 {font-family: "宋体"}
.STYLE7 {color: #000000; font-family: "宋体"; }

    </style>
</head>
<body ><center>
<div id="Layer7" align="center">
<div id="templatemo_header_wrapper">
  <div id="templatemo_header" align="center">
  <br/><br/><br/>
    <span  style="color: red; font-size: 50px;"><br /></span> 
  </div>
  <!-- end of header -->
</div>
<!-- end of header wrapper -->



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


 <div id="Layer6">
<div id="Layer1">
  <table id="logindemo" width="350" height="314" border="1">
    <tr>
      <td width="500" height="305" background=""><div id="Layer2">
      
      
      
      <form name="loginForm" class="layui-form" action="wangzhanmethod!login2.action" method="post" >
      
      <div class="layui-form-item" >
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-block">
      <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" style="width:250px">
    </div>
  </div>
   <div class="layui-form-item" style="margin-buttom:30px">
    <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
    <div class="layui-input-inline">
      <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"  style="width:250px">
    </div>
    <div class="layui-form-item">
    <div class="layui-input-block" style="margin-top:30px">
      <button class="layui-btn" lay-submit lay-filter="formDemo" style="text-align:center">登录</button>
      <a href="" class="layui-btn layui-btn-normal" style="text-decoration:none" style="text-align:center">注册</a>
    </div>
  </div>
    
      </form>
      
	  </div></td>
    </tr>
  </table>
</div>
<div id="Layer3">
  <p class="STYLE2"><span class="STYLE4"><span class="STYLE1"><strong>
 
  ___________________________________________________________________________________________________</strong></span></span></p>
  <p class="STYLE4">&nbsp;</p>
  <p align="center" class="STYLE1">欢迎使用本系统   联系我们：151XXXXXX </p>
  <p align="center" class="STYLE1">&nbsp;</p>
  </p>
  </div>
<a href="manage/login.jsp"></a>
<div id="Layer4">
<div id="demo" style="overflow:hidden;height:311px;width:200px; border:1px solid #dde5bc; overflow:hidden;float:left"><div id=demo1> 
<img src="images/show_11.jpg" width="200" height="140" />
<img src="images/show_10.jpg" width="200" height="140" />
<img src="images/show_12.jpg" width="200" height="140" />
<img src="images/show_13.jpg" width="200" height="140" />
<img src="images/show_14.jpg" width="200" height="140" />
<img src="images/show_15.jpg" width="200" height="140" />
<img src="images/show_16.jpg" width="200" height="140" />
<img src="images/show_1.jpg" width="200" height="140" />
<img src="images/show_2.jpg" width="200" height="140" />
 </div><div id=demo2></div></div>
 <script>
 var speed=40
 var demo=document.getElementById("demo");
 var demo2=document.getElementById("demo2");
 var demo1=document.getElementById("demo1");
 demo2.innerHTML=demo1.innerHTML
 function Marquee()
 {if(demo2.offsetTop-demo.scrollTop<=0)
 demo.scrollTop-=demo1.offsetHeight
 else
 {
 demo.scrollTop++
 }
 }
 var MyMar=setInterval(Marquee,speed)
 demo.onmouseover=function() {clearInterval(MyMar)}
 demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
 </script>
 <script>
 $(function(){
 //一般直接写在一个js文件中
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
});
 });
 </script>
</div>

</div>

</div>
<!-- end of menu wrapper -->

</center>
</body>
</html>
