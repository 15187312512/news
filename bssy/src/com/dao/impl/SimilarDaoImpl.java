package com.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.SimilarDao;
import com.model.Content;
import com.model.Pinglun;
import com.model.Similar;

public class SimilarDaoImpl extends HibernateDaoSupport implements SimilarDao {

	//插入两条新闻之间的相似度
	public void insertBean(Similar similar) {
		
		this.getHibernateTemplate().save(similar);
	}

	//获取出和某条新闻的相似列表
	@SuppressWarnings("unchecked")
	public List<Similar> selectBeanList(String where,int top) {
		return (List<Similar>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Similar> list = session.createQuery("from Similar "+where)
				.setMaxResults(top)
				.list();
				return list;
			}
		});
	}


	public void updateBean(Similar similar) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(similar);
	}


	@SuppressWarnings("unchecked")
	public List<Similar> selectBeanList(String where) {
		return (List<Similar>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Similar> list = session.createQuery("from Similar "+where)
				.list();
				return list;
			}
		});
	}

}
