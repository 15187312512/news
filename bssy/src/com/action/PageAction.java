package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.ContentDao;
import com.dao.PinglunDao;
import com.model.Content;
import com.model.Pinglun;

import net.sf.json.JSONArray;



public class PageAction {
	private ContentDao contentDao;
	private PinglunDao pinglunDao;
	
	public ContentDao getContentDao() {
		return contentDao;
	}
	public void setContentDao(ContentDao contentDao) {
		this.contentDao = contentDao;
	}
	public PinglunDao getPinglunDao() {
		return pinglunDao;
	}
	public void setPinglunDao(PinglunDao pinglunDao) {
		this.pinglunDao = pinglunDao;
	}
	
	/*首页分页*/
	public String pageForIndex() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response =ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		int curPage=Integer.valueOf(request.getParameter("curPage"));
		int limt=Integer.valueOf(request.getParameter("limt"));
		int columnId=Integer.valueOf(request.getParameter("columnId"));
		String sql=" where contentlock=0 and lanmuid="+columnId+" order by createtime desc";
		if (columnId==-1) {
			sql=" where contentlock=0 order by createtime desc";
		}
		if(columnId==-2){
			HttpSession session=request.getSession();
			String keyword=(String) session.getAttribute("keyword");
			sql=" where contentlock=0 and title like  '%"+keyword +"%' order by dianjicishu desc";
		}
		ArrayList<Content> list=(ArrayList<Content>) contentDao.selectBeanList((curPage-1)*limt, limt, sql);
		JSONArray json=JSONArray.fromObject(list);
		System.out.println(json.toString());
		out.write(json.toString());
		out.flush();
		out.close();
		return null;
	}
	public String pageForComment() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response =ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		int curPage=Integer.valueOf(request.getParameter("curPage"));
		int limt=Integer.valueOf(request.getParameter("limt"));
		int contentid=Integer.valueOf(request.getParameter("contentid"));
		String sql=" where pinglunlock=0 and content.id="+contentid+" order by id desc";
		ArrayList<Pinglun> list=(ArrayList<Pinglun>) pinglunDao.selectBeanList((curPage-1)*limt, limt, sql);
		JSONArray json=JSONArray.fromObject(list);
		System.out.println(json.toString());
		out.write(json.toString());
		out.flush();
		out.close();
		return null;
	}
}
