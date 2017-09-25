package com.qingjiezhao.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.qingjiezhao.bean.UserBean;
import com.qingjiezhao.dao.UserDao;

public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#findAll()
	 */
	public List<UserBean> findAll() {
		String hql = "FROM UserBean";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (null != query) {
			return query.list();
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#userLogin(java.lang.String,
	 * java.lang.String)
	 */
	public UserBean userLogin(String username, String password) {

		String hql = "FROM UserBean WHERE username =:param1 and password =:param2";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param1", username);
		query.setParameter("param2", password);
		if (null != query) {
			List list = query.list();
			if (list.size() == 1) {
				UserBean userBean = (UserBean) list.get(0);
				return userBean;
			} else {
				return null;
			}

		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#findUserById(int)
	 */
	public UserBean findUserById(int id) {

		String hql = "FROM UserBean WHERE id =:param1";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param1", id);
		if (null != query) {
			List list = query.list();
			UserBean userBean = (UserBean) list.get(0);
			return userBean;
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#isAvailable(java.lang.String)
	 */
	public boolean isAvailable(String userName) {
		String hql = "FROM UserBean WHERE username =:param1";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("param1", userName);
		if (null != query) {
			if ((query.list().size()) == 0) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#save(com.qingjiezhao.bean.UserBean)
	 */
	public void save(UserBean userBean) {
		this.sessionFactory.getCurrentSession().save(userBean);

	}

	/**
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.dao.UserDao#update(com.qingjiezhao.bean.UserBean)
	 */
	public void update(UserBean userBean) {

		this.sessionFactory.getCurrentSession().update(userBean);
	}

}
