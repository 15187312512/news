package com.dao;

import java.util.List;

import com.model.Pinglun;


public interface PinglunDao  {
	
	
	public void insertBean(Pinglun Pinglun);
	
	public void deleteBean(Pinglun Pinglun);
	
	public void updateBean(Pinglun Pinglun);

	public Pinglun selectBean(String where);
	
	public List<Pinglun> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	/*统计获取文章评论条数*/
	public List<Object> selectCommentsCount(String where,int top);
	
}
