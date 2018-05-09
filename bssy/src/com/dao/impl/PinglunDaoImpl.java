package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.dao.PinglunDao;
import com.model.Pinglun;



public class PinglunDaoImpl extends HibernateDaoSupport implements  PinglunDao{
	
	
	

	public void deleteBean(Pinglun Pinglun) {
		this.getHibernateTemplate().delete(Pinglun);
		
	}

	public void insertBean(Pinglun Pinglun) {
		this.getHibernateTemplate().save(Pinglun);
		
	}

	@SuppressWarnings("unchecked")
	public Pinglun selectBean(String where) {
		List<Pinglun> list = this.getHibernateTemplate().find("from Pinglun " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Pinglun "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Pinglun> selectBeanList(final int start,final int limit,final String where) {
		return (List<Pinglun>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Pinglun> list = session.createQuery("from Pinglun "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Pinglun Pinglun) {
		this.getHibernateTemplate().update(Pinglun);
		
	}
	
	
}
