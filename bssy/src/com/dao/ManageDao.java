package com.dao;

import java.util.List;

import com.model.Manage;




public interface ManageDao  {
	
	public Manage selectUserbByusernameByPassword(String username, String password);
	
	public Manage selectUserbByusername(String username);
	
	public void insertBean(Manage manage);
	
	public void deleteBean(Manage manage);
	
	public void updateBean(Manage manage);

	public Manage selectBean(String where);
	
	public List<Manage> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
