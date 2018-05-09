<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<form id="pagerForm" method="post" action="${url }">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${ps}" />
	<input type="hidden" name="lanmuming" value="${lanmuming}" />
	<input type="hidden" name="title" value="${title}" />
</form>


<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="houtaimethod!contentlist.action" method="post">
	<div class="searchBar">
		<table class="searchContent">
	
			<tr>
				
				 
				
				
				<td>
					栏目：
					<select name="lanmuming">
					<option value="" >所有栏目</option>
					<c:forEach items="${lanmulist}" var="bean">
					<option value="${bean.lanmuming }" <c:if test="${bean.lanmuming==lanmuming }">selected</c:if>>${bean.lanmuming }</option>
					</c:forEach>
					</select>
				</td>
				<td>
					标题：<input type="text"  name="title" value="${title}"/>
				</td>
				

				<td>
					<div class="subBar">
					<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
					</ul>
					</div>
				</td>
				
			</tr>
			
		</table>
		
	</div>
	</form>
	<form onsubmit="return navTabSearch(this);" action="houtaimethod!contentlist.action" method="post">
	<tr>
	<td>
				<div class="subBar">
				<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">刷新</button></div></div></li>
				</ul>
				</div>
	</td>
	</tr>
	
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">

			
			<li><a class="add" href="houtaimethod!contentadd.action" target="dialog" mask="true"><span>添加内容</span></a></li>

			<li><a class="edit" href="houtaimethod!contentupdate.action?id={sid_user}" target="dialog" mask="true"><span>修改内容</span></a></li>
			
			<li><a class="delete" href="houtaimethod!contentdelete.action?id={sid_user}" target="ajaxTodo" title="确定要删除吗?" ><span>删除内容</span></a></li>

		
			
			<li><a class="delete" href="houtaimethod!contentupdate5.action?id={sid_user}" target="ajaxTodo" title="确定要推荐吗?" ><span>热点推荐操作</span></a></li>

			<li><a class="delete" href="houtaimethod!contentupdate6.action?id={sid_user}" target="ajaxTodo" title="确定要取消推荐吗?" ><span>取消热点推荐</span></a></li>
			
			
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="120">栏目</th>
				
				<th width="120">标题</th>
				
			
				
				<th width="120">点击数</th>
				
				<th width="120">是否热点推荐</th>
				
				
				
				<th width="120">添加时间</th>
				
				<th width="120">操作</th>
				
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${list}" var="bean"  >
			<tr target="sid_user" rel="${bean.id}">
				<td>
				${bean.lanmu.lanmuming}
				</td>
				<td>
				${bean.title}
				</td>
				
				<td>
				${bean.dianjicishu}
				</td>
				<td>
				<c:if test="${bean.tuijian==0}">未推荐</c:if>
				<c:if test="${bean.tuijian==1}">已推荐</c:if>
				</td>
				
				<td>
				${fn:substring(bean.createtime,0, 19)}
				</td>
				<td>
				<a href="wangzhanmethod!showcontent.action?id=${bean.id }" target="_blank">预览</a>
				</td>
			</tr>			
			</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${totalCount}" numPerPage="${ps}" pageNumShown="10" currentPage="${pn}"></div>

	</div>
</div>

  </body>
</html>
