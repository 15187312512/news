package com.dao;


import java.util.List;

import com.model.Similar;

public interface SimilarDao {
	public void insertBean(Similar similar);
	//获取某条新闻的相似相似新闻，限制条数
	public List<Similar>  selectBeanList(String where,int top);
	//更新相似度
	public void updateBean(Similar similar);
	//获取相似列表
	public List<Similar> selectBeanList(String where);

}
