<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
<!--
	function check(form, callback){
		var $form = $(form);
		if (!$form.valid()) {
			return false;
		}
		$("#content1").val(eWebEditor.getHTML());
		$.ajax({
			type: form.method || 'POST',
			url:$form.attr("action"),
			data:$form.serializeArray(),
			dataType:"json",
			cache: false,
			success: callback || DWZ.ajaxDone,
			error: DWZ.ajaxError
		});
		return false;
	}
//-->
</script>

<div class="pageContent">
<form method="post" name=form1 action="houtaimethod!contentupdate2.action" class="pageForm" onsubmit="return check(this,dialogAjaxDone);">

	<div class="pageFormContent nowrap" layoutH="80">
				
				
				<div class="unit">
				<label>所属栏目:</label>
				 <select name="lanmu">
				 <c:forEach items="${list}" var="bean2">
				  <option value="${bean2.id }" <c:if test="${bean.lanmu.id==bean2.id }">selected</c:if> >${bean2.lanmuming }</option>
				 </c:forEach>
				
				 </select>
				
				</div>
				
				<input type="hidden" name="id" value="${bean.id }"/> 
				
				<div class="unit">
				<label>内容标题:</label>
				 <input type="text" name="title" class="required" size="60" value="${bean.title }"/> 
				
				</div>
				
				
				
			
				
				
			<div class="unit">
				<label>内容：</label>
			</div>
			<div class="unit">
				<textarea id="content1" name="content1" style="display: none;">${bean.content }</textarea>
				<iframe ID="eWebEditor" src="editor/ewebeditor.htm?id=content1" frameborder="0" scrolling="no" width="1200" height="500"></iframe>					
			</div>
				
				
				
				
						
						

	</div>
<div class="formBar">
      <ul>
            <li>
                 <div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div>
            </li>
            <li>
                  <div class="button"><div class="buttonContent"><button type="Button" class="close">取消</button></div></div>
            </li>
      </ul>
</div>
</form>
</div>

