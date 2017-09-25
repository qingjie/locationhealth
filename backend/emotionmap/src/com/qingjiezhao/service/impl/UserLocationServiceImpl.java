package com.qingjiezhao.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.qingjiezhao.bean.LocationBean;
import com.qingjiezhao.bean.UserBean;
import com.qingjiezhao.dao.LocationDao;
import com.qingjiezhao.dao.UserDao;
import com.qingjiezhao.form.Location;
import com.qingjiezhao.form.User;
import com.qingjiezhao.service.UserLocationService;

/**
 * @author qingjiezhao
 * 
 */
public class UserLocationServiceImpl implements UserLocationService {
	
	private UserDao userDao;

	private LocationDao locationDao;

	/**
	 * @return the userDao
	 */
	public UserDao getUserDao() {
		return userDao;
	}

	/**
	 * @param userDao
	 *            the userDao to set
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * @return the locationDao
	 */
	public LocationDao getLocationDao() {
		return locationDao;
	}

	/**
	 * @param locationDao
	 *            the locationDao to set
	 */
	public void setLocationDao(LocationDao locationDao) {
		this.locationDao = locationDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.service.UserLocationService#findUserById(int)
	 */
	public UserBean findUserById(int id) {
		UserBean userBean = userDao.findUserById(id);
		return userBean;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.qingjiezhao.service.UserLocationService#findUserListByEmotion_selected
	 * (java.lang.String)
	 */
	public List<User> findUserListByEmotion_selected(String emotion_selected) {
		List<UserBean> userBeanList = new ArrayList<UserBean>();

		LocationBean locationBean = locationDao
				.findLocationBeanByEmotion_selected(emotion_selected);
		Set<UserBean> userBeanSet = locationBean.getUserBeans();
		Iterator<UserBean> it = userBeanSet.iterator();
		int i = 0;
		while (it.hasNext()) {
			int intId = ((UserBean) it.next()).getId();
			UserBean userBean = userDao.findUserById(intId);
			userBeanList.add(userBean);
			i++;
		}
		List<User> userList = new ArrayList<User>();
		for (int j = 0; j < userBeanList.size(); j++) {
			User user = new User();
			user.setId(String.valueOf(userBeanList.get(0).getId()));
			user.setUsername(userBeanList.get(0).getUsername());
			user.setGender(userBeanList.get(0).getGender());
			user.setAge(userBeanList.get(0).getAge());
			user.setEmail(userBeanList.get(0).getEmail());
			user.setDescription(userBeanList.get(0).getDescription());
			userList.add(user);
		}

		return userList;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.qingjiezhao.service.UserLocationService#findLocationListByUserId(int)
	 */
	public List<Location> findLocationListByUserId(int id) {
		List<LocationBean> locationBeanList = new ArrayList<LocationBean>();
		UserBean userBean = userDao.findUserById(id);
		Set<LocationBean> locationBeanSet = userBean.getLocationBeans();
		Iterator<LocationBean> it = locationBeanSet.iterator();
		int i = 0;
		while (it.hasNext()) {
			int intId = ((LocationBean) it.next()).getId();
			LocationBean locationBean = locationDao.findLocationById(intId);
			locationBeanList.add(locationBean);
			i++;
		}
		List<Location> locationList = new ArrayList<Location>();

		for (int j = 0; j < locationBeanList.size(); j++) {
			Location location = new Location();
			location.setLatitude(locationBeanList.get(0).getLatitude());
			location.setLongitude(locationBeanList.get(0).getLongitude());
			location.setEmotion_selected(locationBeanList.get(0)
					.getEmotion_selected());
			location.setDescription(locationBeanList.get(0).getDescription());

			locationList.add(location);
		}

		return locationList;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.qingjiezhao.service.UserLocationService#userLogin(java.lang.String,
	 * java.lang.String)
	 */
	public User userLogin(String userName, String password) {
		UserBean userBean = userDao.userLogin(userName, password);
		if (null != userBean) {
			User user = new User();
			user.setId(String.valueOf(userBean.getId()));
			user.setUsername(userBean.getUsername());
			user.setGender(userBean.getGender());
			user.setAge(userBean.getAge());
			user.setEmail(userBean.getEmail());
			user.setDescription(userBean.getDescription());
			return user;
		}

		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.qingjiezhao.service.UserLocationService#saveUser(com.qingjiezhao.
	 * bean.UserBean)
	 */
	@Override
	public boolean saveUser(UserBean userBean) {

		String strUserName = userBean.getUsername();
		if (userDao.isAvailable(strUserName)) {
			userDao.save(userBean);
			return true;
		} else {
			return false;
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.qingjiezhao.service.UserLocationService#update(com.qingjiezhao.bean
	 * .UserBean)
	 */
	@Override
	public void update(UserBean userBean) {

		userDao.update(userBean);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.qingjiezhao.service.UserLocationService#saveLocation(com.qingjiezhao
	 * .bean.LocationBean)
	 */
	@Override
	public void saveLocation(LocationBean locationBean) {

		locationDao.save(locationBean);

	}



}
