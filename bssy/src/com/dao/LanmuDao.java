package com.dao;

import java.util.List;

import com.model.Lanmu;


public interface LanmuDao  {
	
	
	public void insertBean(Lanmu Lanmu);
	
	public void deleteBean(Lanmu Lanmu);
	
	public void updateBean(Lanmu Lanmu);

	public Lanmu selectBean(String where);
	
	public List<Lanmu> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
