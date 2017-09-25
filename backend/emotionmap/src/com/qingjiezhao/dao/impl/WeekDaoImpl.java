/**
 * 
 */
package com.qingjiezhao.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.qingjiezhao.bean.WeekBean;
import com.qingjiezhao.dao.WeekDao;

/**
 * @author qingjiezhao
 * 
 */
public class WeekDaoImpl implements WeekDao {

	private SessionFactory sessionFactory;

	/**
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.WeekDao#findWeekBeanListByUserId(String)
	 */
	@Override
	public List<WeekBean> findWeekBeanListByUserId(String userId) {
		String hql = "FROM WeekBean where userId =:param";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param", userId);
		if (null != query) {
			return query.list();
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.WeekDao#save(com.qingjiezhao.bean.WeekBean)
	 */
	@Override
	public void save(WeekBean weekBean) {
		this.sessionFactory.getCurrentSession().save(weekBean);

	}
	
	/* (non-Javadoc)
	 * @see com.qingjiezhao.dao.WeekDao#delete(com.qingjiezhao.bean.WeekBean)
	 */
	public void delete(WeekBean weekBean) {
		this.sessionFactory.getCurrentSession().delete(weekBean);

	}

}
