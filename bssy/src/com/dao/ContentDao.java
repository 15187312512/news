package com.dao;

import java.util.List;

import com.model.Content;


public interface ContentDao  {
	
	
	public void insertBean(Content Content);
	
	public void deleteBean(Content Content);
	
	public void updateBean(Content Content);

	public Content selectBean(String where);
	
	public List<Content> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	public List<Content> selectAllList(String where);
	
}
