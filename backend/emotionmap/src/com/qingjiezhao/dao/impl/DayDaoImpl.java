/**
 * 
 */
package com.qingjiezhao.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.qingjiezhao.bean.DayBean;
import com.qingjiezhao.dao.DayDao;

/**
 * @author qingjiezhao
 * 
 */
public class DayDaoImpl implements DayDao {

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
	 * @see com.qingjiezhao.dao.DayDao#findDayBeanListByUserId(int)
	 */
	@Override
	public List<DayBean> findDayBeanListByUserId(String userId) {
		String hql = "FROM DayBean where userId =:param";
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
	 * @see com.qingjiezhao.dao.DayDao#save(com.qingjiezhao.bean.DayBean)
	 */
	@Override
	public void save(DayBean dayBean) {
		this.sessionFactory.getCurrentSession().save(dayBean);
	}

	/* (non-Javadoc)
	 * @see com.qingjiezhao.dao.DayDao#delete(com.qingjiezhao.bean.DayBean)
	 */
	public void delete(DayBean dayBean) {
		this.sessionFactory.getCurrentSession().delete(dayBean);
	}
}
