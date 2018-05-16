package com.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.dao.ContentDao;
import com.dao.LanmuDao;
import com.dao.PinglunDao;
import com.dao.UserDao;
import com.model.Content;
import com.model.Lanmu;
import com.model.Pinglun;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.service.SimilarService;
import com.util.Pager;




public class WangzhanAction extends ActionSupport {

	private static final long serialVersionUID = -4304509122548259589L;
	
	
	private ContentDao contentDao;

	public ContentDao getContentDao() {
		return contentDao;
	}

	public void setContentDao(ContentDao contentDao) {
		this.contentDao = contentDao;
	}
	
	private String url = "./";
	
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
	private LanmuDao lanmuDao;
	
	public LanmuDao getLanmuDao() {
		return lanmuDao;
	}

	public void setLanmuDao(LanmuDao lanmuDao) {
		this.lanmuDao = lanmuDao;
	}
	
	
	
	
//网站首页
	public String index() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String id = request.getParameter("id");
		int currentpage = 1;
		int pagesize = 9;
		if(request.getParameter("pagenum")!=null){
			currentpage= Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = contentDao.selectBeanCount(" where contentlock=0 ");
		
	
		request.setAttribute("contentlist",contentDao.selectBeanList((currentpage-1)*pagesize, pagesize, 
				" where contentlock=0 order by tuijian desc,id desc"));
		
		String pagerinfo = Pager.getPagerNormal(total, pagesize, currentpage, "index.action?id="+id,"共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		request.setAttribute("lanmulist",lanmuDao.selectBeanList(0, 6, " where lanmulock=0 order by id "));
		
		request.setAttribute("paihanglist",contentDao.selectBeanList(0, 6, " where contentlock=0 order by dianjicishu desc"));
		
		request.setAttribute("title","热点新闻");
		return "success";
	}
	
	
	//分类管理
	public String lanmulist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		int currentpage = 1;
		int pagesize = 12;
		if(request.getParameter("pagenum")!=null){
			currentpage= Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = contentDao.selectBeanCount(" where contentlock=0 and lanmu.id="+id);
		
		request.setAttribute("contentlist", contentDao.selectBeanList((currentpage-1)*pagesize, pagesize, 
				" where contentlock=0 and lanmu.id="+id+" order by tuijian desc,id desc"));
		
		String pagerinfo = Pager.getPagerNormal(total, pagesize, currentpage, "index.action?id="+id,"共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		
		request.setAttribute("lanmulist",lanmuDao.selectBeanList(0, 6, " where lanmulock=0 order by id "));
		
		request.setAttribute("paihanglist",contentDao.selectBeanList(0, 6, " where contentlock=0 order by dianjicishu desc"));
		Lanmu lanmu = lanmuDao.selectBean(" where id= "+id);
		request.setAttribute("title",lanmu.getLanmuming());
		this.setUrl("index.jsp");
		return SUCCESS;
	}
	private SimilarService similarService;
	
	public SimilarService getSimilarService() {
		return similarService;
	}

	public void setSimilarService(SimilarService similarService) {
		this.similarService = similarService;
	}

	//新闻详细页面
	public String showcontent() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Content bean = contentDao.selectBean(" where id= "+ request.getParameter("id"));
		bean.setDianjicishu(bean.getDianjicishu()+1);
		contentDao.updateBean(bean);
		request.setAttribute("newstitle", bean.getTitle());
		request.setAttribute("news", bean);
		request.setAttribute("mulu", "当前位置:"+bean.getLanmu().getLanmuming()+"");
		
		request.setAttribute("lanmulist",lanmuDao.selectBeanList(0, 6, " where lanmulock=0 order by id "));
		
		request.setAttribute("paihanglist",contentDao.selectBeanList(0, 6, " where contentlock=0 order by dianjicishu desc"));
		
		
		request.setAttribute("pingluncount", pinglunDao.selectBeanCount(" where  pinglunlock=0 and content.id="+bean.getId()));
		
		//推荐列表
		int top=3;
		List<Content> listSimList=similarService.getSimList(bean, top);
		request.setAttribute("similarContentList",listSimList );
		this.setUrl("content.jsp");
		return SUCCESS;
	}
	
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	//用户注册操作
	public void register() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = java.net.URLDecoder.decode(request.getParameter("username"), "utf-8");
		
		String password = request.getParameter("password");
		
		User bean = userDao.selectBean(" where username='"+username+"' ");
		if(bean ==null){
			bean = new User();
			bean.setUsername(username);
			bean.setPassword(password);
			bean.setCreatetime(new Date());
			userDao.insertBean(bean);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("注册新用户成功！您的用户名"+bean.getUsername()+",请妥善保管！");
		}else{
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("该用户名已经存在，请重新注册！");
		}
		
	}
	
	
	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();

		request.setAttribute("mulu", "当前位置:用户登录");
		
		request.setAttribute("lanmulist",lanmuDao.selectBeanList(0, 6, " where lanmulock=0 order by id "));
		
		request.setAttribute("paihanglist",contentDao.selectBeanList(0, 6, " where contentlock=0 order by dianjicishu desc"));

		this.setUrl("login.jsp");
		return SUCCESS;
	}
	
	
	//用户登录操作
	public String login2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password"); 
		User user = userDao.selectBean(" where username='"+username+"' and password='"+password+"' and userlock=0");
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			this.setUrl("index.action");
			return "redirect";
		} else {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('用户名或者密码错误');window.location.href='wangzhanmethod!login.action';</script>");
		}
		return null;
	}
	
	
	//用户登录操作
	public String loginout() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		this.setUrl("index.action");
		return "redirect";
	}
	
	
	public String search() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String keyword = request.getParameter("keyword");
		if(keyword!=null&&!"".equals(keyword)){
			int currentpage = 1;
			int pagesize = 99;
			if(request.getParameter("pagenum")!=null){
				currentpage= Integer.parseInt(request.getParameter("pagenum"));
			}
			int total = contentDao.selectBeanCount(" where contentlock=0 and title like  '%"+keyword +"%'");
			request.setAttribute("contentlist",contentDao.selectBeanList((currentpage-1)*pagesize, pagesize, " where contentlock=0 and title like  '%"+keyword +"%' order by dianjicishu desc"));
			request.setAttribute("title", "新闻搜索关键字："+keyword);
			request.setAttribute("total", total);
			
			
			request.setAttribute("lanmulist",lanmuDao.selectBeanList(0, 6, " where lanmulock=0 order by id "));
			
			request.setAttribute("paihanglist",contentDao.selectBeanList(0, 6, " where contentlock=0 order by dianjicishu desc"));
			this.setUrl("index.jsp");
			return SUCCESS;
		}else{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('搜索的关键字不能为空');window.location.href='.';</script>");
			return null;
		}

	}
	
	
	private PinglunDao pinglunDao;

	public PinglunDao getPinglunDao() {
		return pinglunDao;
	}

	public void setPinglunDao(PinglunDao pinglunDao) {
		this.pinglunDao = pinglunDao;
	}
	
	
	
	public String pinglun() {
		HttpServletRequest request = ServletActionContext.getRequest();

		request.setAttribute("mulu", "当前位置:发表评论");
		Content bean = contentDao.selectBean(" where id= "+request.getParameter("id"));
		request.setAttribute("content", bean);
		
		
		request.setAttribute("lanmulist",lanmuDao.selectBeanList(0, 6, " where lanmulock=0 order by id "));
		request.setAttribute("paihanglist",contentDao.selectBeanList(0, 6, " where contentlock=0 order by dianjicishu desc"));

		this.setUrl("pinglun.jsp");
		return SUCCESS;
	}
	
	
	public String pinglun2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String contentid = request.getParameter("contentid");
		String pingluncontent = request.getParameter("pingluncontent"); 
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user==null){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('请先登录');window.location.href='wangzhanmethod!login.action';</script>");
		}else{
			Pinglun bean = new Pinglun();
			bean.setContent(contentDao.selectBean(" where id= "+contentid));
			bean.setCreatetime(new Date());
			bean.setPingluncontent(pingluncontent);
			bean.setUser(user);
			pinglunDao.insertBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('success!');window.location.href='wangzhanmethod!pinglunlist.action?id="+contentid+"';</script>");
		}
		
		
		return null;
	}
	
	
	public String pinglunlist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		int currentpage = 1;
		int pagesize = 12;
		if(request.getParameter("pagenum")!=null){
			currentpage= Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = pinglunDao.selectBeanCount(" where pinglunlock=0 and content.id="+id);
		
		request.setAttribute("pinglunlist", pinglunDao.selectBeanList((currentpage-1)*pagesize, pagesize, 
				" where pinglunlock=0 and content.id="+id+" order by id desc"));
		
		String pagerinfo = Pager.getPagerNormal(total, pagesize, currentpage, "index.action?id="+id,"共有"+total+"条记录");
		request.setAttribute("pagerinfo", pagerinfo);
		
		request.setAttribute("lanmulist",lanmuDao.selectBeanList(0, 6, " where lanmulock=0 order by id "));
		
		request.setAttribute("paihanglist",contentDao.selectBeanList(0, 6, " where contentlock=0 order by dianjicishu desc"));
		Content content = contentDao.selectBean(" where id= "+id);
		request.setAttribute("content",content);
		this.setUrl("pinglunlist.jsp");
		return SUCCESS;
	}

	
	
}
