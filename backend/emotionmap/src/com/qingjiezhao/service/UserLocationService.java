package com.qingjiezhao.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.qingjiezhao.bean.LocationBean;
import com.qingjiezhao.bean.UserBean;
import com.qingjiezhao.form.Location;
import com.qingjiezhao.form.User;

/**
 * @author qingjiezhao
 * 
 */

@Service
public interface UserLocationService {

	/**
	 * @param id
	 * @return
	 */
	UserBean findUserById(int id);
	/**
	 * @param id
	 * @return
	 */
	List<Location> findLocationListByUserId(int id);

	
	/**
	 * @param emotion_selected
	 * @return
	 */
	List<User> findUserListByEmotion_selected(String emotion_selected);

	/**
	 * @param locationBean
	 */
	void saveLocation(LocationBean locationBean);

	/**
	 * @param userBean
	 * @return
	 */
	boolean saveUser(UserBean userBean);

	/**
	 * @param userBean
	 */
	void update(UserBean userBean);

	/**
	 * @param userName
	 * @param password
	 * @return
	 */
	User userLogin(String userName, String password);
	
}
