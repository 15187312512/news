package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.ContentDao;
import com.dao.LanmuDao;
import com.dao.ManageDao;
import com.dao.PinglunDao;
import com.dao.UserDao;
import com.model.Content;
import com.model.Lanmu;
import com.model.Manage;
import com.model.Pinglun;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Util;





public class HoutaiAction extends ActionSupport {

	private static final long serialVersionUID = -4304509122548259589L;
	
	private ManageDao manageDao;

	private String url = "./";

	

	public ManageDao getManageDao() {
		return manageDao;
	}

	public void setManageDao(ManageDao manageDao) {
		this.manageDao = manageDao;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	
	
	
//后台入口程序
	public String index() {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request.getSession().getAttribute("wangzhanmanage") == null) {
			
			this.setUrl("login.jsp");
		} else {
			
			this.setUrl("manage/index.jsp");
		}
		return SUCCESS;
	}
	
//用户登录操作
	public String login() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Manage user = manageDao.selectUserbByusernameByPassword(username, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("wangzhanmanage", user);
			this.setUrl("houtaimethod!index.action");
			return "redirect";
		} else {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('用户名或者密码错误');window.location.href='houtaimethod!index.action';</script>");
		}
		return null;
	}
//用户退出操作
	public String loginout() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("wangzhanmanage");
		session.invalidate();
		this.setUrl("manage/login.jsp");
		return SUCCESS;
	}
//跳转到修改密码页面
	public String changepwd() {
		this.setUrl("manage/user/user.jsp");
		return SUCCESS;
	}
//修改密码操作
	public void changepwd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Manage u = (Manage) session.getAttribute("wangzhanmanage");
		if(u==null){
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>window.location.href='houtaimethod!index.action';</script>");
			return ;
		}
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String password3 = request.getParameter("password3");
		Manage bean = manageDao.selectUserbByusernameByPassword(u.getUsername(), password1);
		if (!password2.equals(password3)) {
			out.print(Util.tiaozhuan2("两次输入密码不一致", "houtaimethod!index.action'", ""));
			out.flush();
			out.close();
		} else if (bean != null) {
			bean.setPassword(password2);
			manageDao.updateBean(bean);
			out.print(Util.tiaozhuan2("success!", "houtaimethod!index.action'", ""));
			out.flush();
			out.close();
		} else {
			out.print(Util.tiaozhuan2("原密码错误", "houtaimethod!index.action'", ""));
			out.flush();
			out.close();
		}
	}

	private LanmuDao lanmuDao;



	public LanmuDao getLanmuDao() {
		return lanmuDao;
	}

	public void setLanmuDao(LanmuDao lanmuDao) {
		this.lanmuDao = lanmuDao;
	}
	
	//新闻栏目管理
	public String lanmulist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		sb.append("  lanmulock=0 order by id desc");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 20;
		if (request.getParameter("pageNum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pageNum"));
			pagesize = Integer.parseInt(request.getParameter("numPerPage"));
		}
		int total = lanmuDao.selectBeanCount(" where lanmulock=0 ");
		request.setAttribute("list", lanmuDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("totalCount", total);
		request.setAttribute("ps", pagesize);
		request.setAttribute("pn", currentpage);
		request.setAttribute("url", "houtaimethod!lanmulist.action");
		this.setUrl("manage/lanmu/lanmulist.jsp");
		return SUCCESS;
	}
//跳转到添加栏目页面
	public String lanmuadd() {
		this.setUrl("manage/lanmu/lanmuadd.jsp");
		return SUCCESS;
	}
//添加栏目操作
	public void lanmuadd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String lanmuming = request.getParameter("lanmuming");
		Lanmu bean = new Lanmu();
		bean.setLanmuming(lanmuming);
		lanmuDao.insertBean(bean);
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(Util.tiaozhuan("success!", "houtaimethod!lanmulist.action", "lanmulist"));
		out.flush();
		out.close();	
	}
	//跳转到更新栏目页面
	public String lanmuupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Lanmu bean = lanmuDao.selectBean(" where id= "+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		this.setUrl("manage/lanmu/lanmuupdate.jsp");
		return SUCCESS;
	}
	
//更新栏目操作
	public void lanmuupdate2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String lanmuming = request.getParameter("lanmuming");
		Lanmu bean = lanmuDao.selectBean(" where id= "+ request.getParameter("id"));
		bean.setLanmuming(lanmuming);
		lanmuDao.updateBean(bean);
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(Util.tiaozhuan("success!", "houtaimethod!lanmulist.action", "lanmulist"));
		out.flush();
		out.close();
	}
//删除栏目操作
	public void lanmudelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Lanmu bean = lanmuDao.selectBean(" where id= "+ request.getParameter("id"));
		bean.setLanmulock(1);
		lanmuDao.updateBean(bean);
		
		List<Content> bean2 = contentDao.selectBeanList(0, 99," where lanmuid= "+ request.getParameter("id"));
		
		//bean.setLanmu(lanmuDao.selectBean(" where id= "+lanmu));
		//bean.setTitle(title);
		
		for(int i=0; i<bean2.size(); i++){
			contentDao.deleteBean(bean2.get(i));
		}
		
		
		

		
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(Util.tiaozhuan2("success!", "houtaimethod!lanmulist.action", "lanmulist"));
		out.flush();
		out.close();
	}
	
	private ContentDao contentDao;
	
	public ContentDao getContentDao() {
		return contentDao;
	}

	public void setContentDao(ContentDao contentDao) {
		this.contentDao = contentDao;
	}

	
	//新闻管理
	public String contentlist() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("lanmulist", lanmuDao.selectBeanList(0, 99, " where lanmulock=0 "));
		String lanmuming = request.getParameter("lanmuming");
		String title = request.getParameter("title");
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		
		if (lanmuming != null && !"".equals(lanmuming)) {
			sb.append("lanmu.lanmuming like '%" + lanmuming + "%'");
			sb.append(" and ");
			request.setAttribute("lanmuming", lanmuming);

		}
		
		if (title != null && !"".equals(title)) {
			sb.append("title like '%" + title + "%'");
			sb.append(" and ");
			request.setAttribute("title", title);
			
		}
		sb.append("  contentlock=0 order by tuijian desc,id desc");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 20;
		if (request.getParameter("pageNum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pageNum"));
			pagesize = Integer.parseInt(request.getParameter("numPerPage"));
		}
		int total = contentDao.selectBeanCount(" where contentlock=0 ");
		request.setAttribute("list", contentDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("totalCount", total);
		request.setAttribute("url", "houtaimethod!contentlist.action");
		request.setAttribute("ps", pagesize);
		request.setAttribute("pn", currentpage);
		this.setUrl("manage/content/contentlist.jsp");
		return SUCCESS;
	}
//跳转到添加新闻页面
	public String contentadd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("list", lanmuDao.selectBeanList(0, 99, " where lanmulock=0 "));
		this.setUrl("manage/content/contentadd.jsp");
		return SUCCESS;
	}
//添加新闻操作
	public void contentadd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String content = request.getParameter("content1");
		String lanmu = request.getParameter("lanmu");
		String title = request.getParameter("title");
		Content bean = new Content();
		bean.setContent(content);
		bean.setLanmu(lanmuDao.selectBean(" where id= "+lanmu));
		bean.setTitle(title);
		bean.setCreatetime(new Date());
		contentDao.insertBean(bean);
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(Util.tiaozhuan("success!", "houtaimethod!contentlist.action", "contentlist"));
		out.flush();
		out.close();	
	}
	//跳转到更新新闻页面
	public String contentupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Content bean = contentDao.selectBean(" where id= "+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("list", lanmuDao.selectBeanList(0, 99, " where lanmulock=0 "));
		this.setUrl("manage/content/contentupdate.jsp");
		return SUCCESS;
	}
	
//更新新闻操作
	public void contentupdate2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String content = request.getParameter("content1");
		String lanmu = request.getParameter("lanmu");
		String title = request.getParameter("title");
		Content bean = contentDao.selectBean(" where id= "+ request.getParameter("id"));
		bean.setContent(content);
		bean.setLanmu(lanmuDao.selectBean(" where id= "+lanmu));
		bean.setTitle(title);
		contentDao.updateBean(bean);
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(Util.tiaozhuan("success!", "houtaimethod!contentlist.action", "contentlist"));
		out.flush();
		out.close();
	}
//删除新闻操作
	public void contentdelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Content bean = contentDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setContentlock(1);
		contentDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(Util.tiaozhuan2("success!", "houtaimethod!contentlist.action", "contentlist"));
		out.flush();
		out.close();
	}
	
	
	
	//推荐新闻操作
	public void contentupdate5() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Content bean = contentDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setTuijian(1);
		contentDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(Util.tiaozhuan2("success!", "houtaimethod!contentlist.action", "contentlist"));
		out.flush();
		out.close();
	}
	//取消推荐操作
	public void contentupdate6() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Content bean = contentDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setTuijian(0);
		contentDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(Util.tiaozhuan2("success!", "houtaimethod!contentlist.action", "contentlist"));
		out.flush();
		out.close();
	}
	
	private UserDao userDao;
	
	private PinglunDao pinglunDao;



	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public PinglunDao getPinglunDao() {
		return pinglunDao;
	}

	public void setPinglunDao(PinglunDao pinglunDao) {
		this.pinglunDao = pinglunDao;
	}
	//用户评论管理
	public String pinglunlist() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		sb.append("  pinglunlock=0 order by id desc");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 20;
		if (request.getParameter("pageNum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pageNum"));
			pagesize = Integer.parseInt(request.getParameter("numPerPage"));
		}
		int total = pinglunDao.selectBeanCount(" where pinglunlock=0 " );
		request.setAttribute("list", pinglunDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("totalCount", total);
		request.setAttribute("url", "houtaimethod!pinglunlist.action");
		request.setAttribute("ps", pagesize);
		request.setAttribute("pn", currentpage);
		this.setUrl("manage/pinglun/pinglunlist.jsp");
		return SUCCESS;
	}
	//删除用户评论操作
	public void pinglundelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Pinglun bean = pinglunDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setPinglunlock(1);
		pinglunDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(Util.tiaozhuan2("success!", "houtaimethod!pinglunlist.action", "pinglunlist"));
		out.flush();
		out.close();
	}
	
	//用户管理
	public String userlist() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		sb.append("  userlock=0 order by id desc");
		String where = sb.toString();
		int currentpage = 1;
		int pagesize = 20;
		if (request.getParameter("pageNum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pageNum"));
			pagesize = Integer.parseInt(request.getParameter("numPerPage"));
		}
		int total = userDao.selectBeanCount(" where userlock=0");
		request.setAttribute("list", userDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("totalCount", total);
		request.setAttribute("url", "houtaimethod!userlist.action");
		request.setAttribute("ps", pagesize);
		request.setAttribute("pn", currentpage);
		this.setUrl("manage/user/userlist.jsp");
		return SUCCESS;
	}
	//删除用户操作
	public void userdelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		User bean = userDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setUserlock(1);
		userDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(Util.tiaozhuan2("success!", "houtaimethod!userlist.action", "userlist"));
		out.flush();
		out.close();
	}
	

}
