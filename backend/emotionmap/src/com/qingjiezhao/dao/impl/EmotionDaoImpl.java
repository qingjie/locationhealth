package com.qingjiezhao.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.qingjiezhao.bean.EmotionBean;
import com.qingjiezhao.dao.EmotionDao;

public class EmotionDaoImpl implements EmotionDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmotionBean> findAll() {
		String hql = "FROM EmotionBean";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (null != query) {
			return query.list();
		}
		return null;
	}

	@Override
	public String findNameByValue(String value) {
		String hql = "FROM EmotionBean where value =:param ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param", value);
		if (null != query) {
			return ((EmotionBean) query.list().get(0)).getName();
		}
		return null;
	}
	/*
	 * public void update(String name, String selected) {
	 * 
	 * String hql =
	 * "update EmotionBean set selected =:param1  where name =:param2"; Query
	 * query = this.sessionFactory.getCurrentSession().createQuery(hql);
	 * query.setParameter("param1", selected); query.setParameter("param2",
	 * name);
	 * 
	 * int rowCount = query.executeUpdate();
	 * System.out.println("Rows affected: " + rowCount);
	 * 
	 * }
	 */
}
