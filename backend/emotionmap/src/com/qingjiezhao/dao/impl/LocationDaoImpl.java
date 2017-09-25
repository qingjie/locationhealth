package com.qingjiezhao.dao.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.qingjiezhao.bean.LocationBean;
import com.qingjiezhao.dao.LocationDao;

/**
 * @author qingjiezhao
 * 
 */
public class LocationDaoImpl implements LocationDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#findAll()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<LocationBean> findAll() {
		String hql = "FROM LocationBean";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (null != query) {
			return query.list();
		}
		return null;
	}

	public LocationBean findLocationById(int id) {

		String hql = "FROM LocationBean WHERE id =:param1";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param1", id);
		if (null != query) {
			List list = query.list();
			LocationBean locationBean = (LocationBean) list.get(0);
			return locationBean;
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.LocationDao#findLocationById(int)
	 */
	public LocationBean findLocationBeanByEmotion_selected(
			String emotion_selected) {
		String hql = "FROM LocationBean WHERE emotion_selected =:param1";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param1", emotion_selected);
		if (null != query) {
			List list = query.list();
			LocationBean locationBean = (LocationBean) list.get(0);
			return locationBean;
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#save(com.qingjiezhao.bean.UserBean)
	 */
	@Override
	public void save(LocationBean locationBean) {
		this.sessionFactory.getCurrentSession().save(locationBean);
	}

	public List<LocationBean> findLocationBeanListByDay() {
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DATE);
		String hql = "FROM LocationBean WHERE day(currentTime)  =:param1";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param1", day);
		//query.setParameter("param1", 21);
		if (null != query) {
			return query.list();

		}
		return null;
	}
}
