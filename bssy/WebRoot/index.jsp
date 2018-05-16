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
<link href="index.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
<script language="javascript" type="text/javascript">

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}


		
function registershow(){
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.showModalDialog("register.jsp?t="+t, null, 
		'dialogWidth:825px;dialogHeight:500px;help:no;unadorned:no;resizable:no;status:no;scroll:no');
	}
	

</script>

    <style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 1156px;
	top: 255px;
}
#Layer2 {
	position:absolute;
	width:684px;
	height:146px;
	z-index:2;
	left: 84px;
	top: 429px;
}
-->
.rollBox{width:528px;overflow:hidden;margin:0 auto;}
.rollBox .Cont{width:528px;overflow:hidden;margin:0 auto;padding-top:20px;}
.rollBox .ScrCont{width:10000000px;}
.rollBox .Cont .pic{width:130px;float:left;text-align:center;padding-right:20px;}
*+html .rollBox .Cont .pic{width:130px;float:left;text-align:center;padding-right:30px;}
.rollBox .Cont .pic img{padding:4px;background:#fff;border:1px solid #ccc;display:block;margin:0 auto;}
.rollBox .Cont .pic p{line-height:26px;color:#505050;}
.rollBox .Cont a:link,.rollBox .Cont a:visited{color:#626466;text-decoration:none;}
.rollBox .Cont a:hover{color:#f00;text-decoration:underline;}
.rollBox #List1,.rollBox #List2{float:left;}

    </style>
</head>
<body>


<div id="templatemo_header_wrapper">
  <div id="templatemo_header" align="center">
  <br/><br/><br/>
  </div>
  <!-- end of header -->
</div>
<!-- end of header wrapper -->

<div id="templatemo_menu_wrapper">

  <div id="templatemo_menu">
    <ul>
      <li><a href="." class="current">主页</a></li>
      <c:forEach items="${lanmulist}" var="bean">
       	<li>
       	  
   	    <a href="wangzhanmethod!lanmulist.action?id=${bean.id }" class="current">${bean.lanmuming }</a></li>
      </c:forEach>
      <li><a href="manage/login.jsp" class="current">后台管理</a></li>
    </ul>
  </div>
  <!-- end of menu -->
</div>


<!-- end of menu wrapper -->
<div id="tempatemo_content_wrapper">
  
  
  <div id="templatemo_content">
   
    <div id="content_panel">
      <div id="column_w610">
     
      
        <div class="header_01">${title }</div>
        <table style="font-size: 20px;" width="100%"  cellspacing="15">
         <c:forEach items="${contentlist}" var="bean">
        <tr>
        <td width="80%"><a style="text-decoration:none" href="wangzhanmethod!showcontent.action?id=${bean.id }">
        <span style="color: blue;">
        <c:if test="${fn:length(bean.title)>15}">${fn:substring(bean.title,0, 15)}...</c:if>
        <c:if test="${fn:length(bean.title)<=15}">${bean.title }</c:if>
        </span></a></td>
        <td width="20%">${fn:substring(bean.createtime,5, 10)}</td>

        </tr>
       
        </c:forEach>
        
        </table>
        
      ${pagerinfo }   
      
       
       
       <div class="rollBox">
     <img height="31" width="12" onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()" onmouseout="ISL_StopDown()" class="img1" src="images/shqm_left_pic.gif" /><div class="Cont" id="ISL_Cont">

      <div class="ScrCont">
       <div id="List1">
     
        <div class="pic">
          <a href="#" target="_blank"><img src="images/show_11.jpg" width="130" height="95" /></a>
         </div>
      <div class="pic">
          <a href="#" target="_blank"><img src="images/show_12.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_3.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_4.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_15.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_16.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_1.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_2.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_3.jpg" width="130" height="95" /></a>
         </div>
            <div class="pic">
          <a href="#" target="_blank"><img src="images/show_4.jpg" width="130" height="95" /></a>
         </div>
         <div class="pic">
          <a href="#" target="_blank"><img src="images/show_5.jpg" width="130" height="95" /></a>
         </div>
         <div class="pic">
          <a href="#" target="_blank"><img src="images/show_6.jpg" width="130" height="95" /></a>
         </div>
         <div class="pic">
          <a href="#" target="_blank"><img src="images/show_7.jpg" width="130" height="95" /></a>
         </div>
         <div class="pic">
          <a href="#" target="_blank"><img src="images/show_8.jpg" width="130" height="95" /></a>
         </div>
        
         <div class="pic">
          <a href="#" target="_blank"><img src="images/show_10.jpg" width="130" height="95" /></a>
         </div>
       </div>
       <div id="List2"></div>
      </div>
     </div>
<img  onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"  class="img2" src="images/shqm_right_pic.gif" width="12" height="31" />
    </div>
	  
      </div>
	  <script language="javascript" type="text/javascript">
<!--//--><![CDATA[//><!--
//ͼƬ�����б� mengjia 070816
var Speed = 10; //�ٶ�(����)
var Space = 10; //ÿ���ƶ�(px)
var PageWidth = 160; //��ҳ���
var fill = 0; //������λ
var MoveLock = false;
var MoveTimeObj;
var Comp = 0;
var AutoPlayObj = null;
GetObj("List2").innerHTML = GetObj("List1").innerHTML;
GetObj('ISL_Cont').scrollLeft = fill;
GetObj("ISL_Cont").onmouseover = function(){clearInterval(AutoPlayObj);}
GetObj("ISL_Cont").onmouseout = function(){AutoPlay();}
AutoPlay();
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval

('document.all.'+objName)}}
function AutoPlay(){ //�Զ�����
clearInterval(AutoPlayObj);
AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();',5000); //���ʱ��
}
function ISL_GoUp(){ //�Ϸ���ʼ
if(MoveLock) return;
clearInterval(AutoPlayObj);
MoveLock = true;
MoveTimeObj = setInterval('ISL_ScrUp();',Speed);
}
function ISL_StopUp(){ //�Ϸ�ֹͣ
clearInterval(MoveTimeObj);
if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0){
Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
CompScr();
}else{
MoveLock = false;
}
AutoPlay();
}
function ISL_ScrUp(){ //�Ϸ�����
if(GetObj('ISL_Cont').scrollLeft <= 0){GetObj('ISL_Cont').scrollLeft = GetObj

('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth}
GetObj('ISL_Cont').scrollLeft -= Space ;
}
function ISL_GoDown(){ //�·�
clearInterval(MoveTimeObj);
if(MoveLock) return;
clearInterval(AutoPlayObj);
MoveLock = true;
ISL_ScrDown();
MoveTimeObj = setInterval('ISL_ScrDown()',Speed);
}
function ISL_StopDown(){ //�·�ֹͣ
clearInterval(MoveTimeObj);
if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0 ){
Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
CompScr();
}else{
MoveLock = false;
}
AutoPlay();
}
function ISL_ScrDown(){ //�·�����
if(GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth){GetObj('ISL_Cont').scrollLeft =

GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth;}
GetObj('ISL_Cont').scrollLeft += Space ;
}
function CompScr(){
var num;
if(Comp == 0){MoveLock = false;return;}
if(Comp < 0){ //�Ϸ�
if(Comp < -Space){
   Comp += Space;
   num = Space;
}else{
   num = -Comp;
   Comp = 0;
}
GetObj('ISL_Cont').scrollLeft -= num;
setTimeout('CompScr()',Speed);
}else{ //�·�
if(Comp > Space){
   Comp -= Space;
   num = Space;
}else{
   num = Comp;
   Comp = 0;
}
GetObj('ISL_Cont').scrollLeft += num;
setTimeout('CompScr()',Speed);
}
}
//--><!]]>
</script>
	  
      <p>
        <!-- end of column w610 -->
      </p>
      <p>&nbsp; </p>
      <div id="column_w290">
      <c:if test="${user==null}">
       &nbsp;&nbsp;&nbsp;&nbsp;
      <a style="text-decoration:none" href="wangzhanmethod!login.action" >【用户登录】</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a style="text-decoration:none" href="####" onclick="registershow()">【用户注册】</a>
      </c:if>
      <c:if test="${user!=null}">
      欢迎您，${user.username } &nbsp;&nbsp;&nbsp;&nbsp;
      <a style="text-decoration:none" href="wangzhanmethod!loginout.action" >【用户退出】</a>
      </c:if>

      
        <div class="header_02">新闻点击排行</div>
        <table style="font-size: 20px;" width="100%"  cellspacing="15">
         <c:forEach items="${paihanglist}" var="bean">
        <tr>
        <td width="80%"><a style="text-decoration:none" href="wangzhanmethod!showcontent.action?id=${bean.id }">
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
		<td align="left"><img src="images/nyxf_36.gif" alt="ï¿½ï¿½Ïµï¿½ï¿½ï¿½ï¿½" width="288" height="62" /></td>
              </tr>
              <tr>
                <td height="67"><table width="205" border="0" align="center" cellpadding="0" cellspacing="10" bordercolor="#CCCCCC" height="158">
                    <tr>
                      <td align="left"><span class="STYLE3">欢迎光临！ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系邮箱：mail.126.com<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tel：1513511XXXX<br /> 
                      </span></td>
                    </tr>
                </table></td>
      </div>
      <!-- end of column 290 -->
      
    </div>
    <!-- end of content panel -->
    <div class="cleaner"></div>
  </div>
  
  
  <!-- end of content -->
</div>
<p>&nbsp;</p>
<p></a>
</p>

</body>
</html>
