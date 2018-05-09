package com.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.dao.ManageDao;
import com.model.Manage;




public class ManageDaoImpl extends HibernateDaoSupport implements  ManageDao{
	
	
	

	public void deleteBean(Manage Manage) {
		this.getHibernateTemplate().delete(Manage);
		
	}

	public void insertBean(Manage Manage) {
		this.getHibernateTemplate().save(Manage);
		
	}

	@SuppressWarnings("unchecked")
	public Manage selectBean(String where) {
		List<Manage> list = this.getHibernateTemplate().find("from Manage " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Manage "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Manage> selectBeanList(final int start,final int limit,final String where) {
		return (List<Manage>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Manage> list = session.createQuery("from Manage "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Manage Manage) {
		this.getHibernateTemplate().update(Manage);
		
	}
	
	@SuppressWarnings("unchecked")
	public Manage selectUserbByusernameByPassword(String username, String password) {
		List<Manage> list = this.getHibernateTemplate().find("from Manage where username=? and password = ? and userlock=0",username,password);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public Manage selectUserbByusername(String username) {
		List<Manage> list = this.getHibernateTemplate().find("from Manage where username=? and userlock=0",username);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}
	
	
}
