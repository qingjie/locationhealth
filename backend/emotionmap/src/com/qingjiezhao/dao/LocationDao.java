package com.qingjiezhao.dao;

import java.util.List;

import com.qingjiezhao.bean.LocationBean;

/**
 * @author qingjiezhao
 * 
 */

public interface LocationDao {

	/**
	 * @return
	 */
	List<LocationBean> findLocationBeanListByDay();

	/**
	 * @return
	 */
	List<LocationBean> findAll();

	/**
	 * @param id
	 * @return
	 */
	LocationBean findLocationById(int id);

	/**
	 * @param emotion_selected
	 * @return
	 */
	LocationBean findLocationBeanByEmotion_selected(String emotion_selected);

	/**
	 * @param locationBean
	 */
	void save(LocationBean locationBean);
}
