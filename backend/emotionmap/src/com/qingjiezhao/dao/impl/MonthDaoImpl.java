/**
 * 
 */
package com.qingjiezhao.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.qingjiezhao.bean.MonthBean;
import com.qingjiezhao.dao.MonthDao;

/**
 * @author qingjiezhao
 * 
 */
public class MonthDaoImpl implements MonthDao {

	private SessionFactory sessionFactory;

	/**
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	/* (non-Javadoc)
	 * @see com.qingjiezhao.dao.MonthDao#findMonthBeanListByUserId(String)
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<MonthBean> findMonthBeanListByUserId(String userId) {
		String hql = "FROM MonthBean where userId =:param";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param", userId);
		if (null != query) {
			return query.list();
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.qingjiezhao.dao.MonthDao#save(com.qingjiezhao.bean.MonthBean)
	 */
	@Override
	public void save(MonthBean monthBean) {
		this.sessionFactory.getCurrentSession().save(monthBean);

	}
}
