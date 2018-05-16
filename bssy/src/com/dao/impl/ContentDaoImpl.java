package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.dao.ContentDao;
import com.model.Content;



public class ContentDaoImpl extends HibernateDaoSupport implements  ContentDao{
	
	
	

	public void deleteBean(Content Content) {
		this.getHibernateTemplate().delete(Content);
		
	}

	public void insertBean(Content Content) {
		this.getHibernateTemplate().save(Content);
		
	}

	@SuppressWarnings("unchecked")
	public Content selectBean(String where) {
		List<Content> list = this.getHibernateTemplate().find("from Content " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Content "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Content> selectBeanList(final int start,final int limit,final String where) {
		return (List<Content>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Content> list = session.createQuery("from Content "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Content Content) {
		this.getHibernateTemplate().update(Content);
		
	}

	
	@SuppressWarnings("unchecked")
	public List<Content> selectAllList(String where) {
		List<Content> list = this.getHibernateTemplate().find("from Content " +where);
		if(list.size()==0){
			return null;
		}
		return list;
	}
	
	
}
