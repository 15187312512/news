package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.dao.LanmuDao;
import com.model.Lanmu;



public class LanmuDaoImpl extends HibernateDaoSupport implements  LanmuDao{
	
	
	

	public void deleteBean(Lanmu Lanmu) {
		this.getHibernateTemplate().delete(Lanmu);
		
	}

	public void insertBean(Lanmu Lanmu) {
		this.getHibernateTemplate().save(Lanmu);
		
	}

	@SuppressWarnings("unchecked")
	public Lanmu selectBean(String where) {
		List<Lanmu> list = this.getHibernateTemplate().find("from Lanmu " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Lanmu "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Lanmu> selectBeanList(final int start,final int limit,final String where) {
		return (List<Lanmu>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Lanmu> list = session.createQuery("from Lanmu "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Lanmu Lanmu) {
		this.getHibernateTemplate().update(Lanmu);
		
	}
	
	
}
