package com.qingjiezhao.dao;

import java.util.List;

import com.qingjiezhao.bean.UserBean;

public interface UserDao {

	/**
	 * @return
	 */
	List<UserBean> findAll();

	/**
	 * @param userName
	 * @param password
	 * @return
	 */
	UserBean userLogin(String userName, String password);

	/**
	 * @param id
	 * @return
	 */
	UserBean findUserById(int id);

	/**
	 * @param userName
	 * @return
	 */
	boolean isAvailable(String userName);

	/**
	 * @param userBean
	 */
	void save(UserBean userBean);

	/**
	 * @param userBean
	 */
	void update(UserBean userBean);
}
