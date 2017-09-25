/**
 * 
 */
package com.qingjiezhao.dao;

import java.util.List;

import com.qingjiezhao.bean.DayBean;

/**
 * @author qingjiezhao
 * 
 */
public interface DayDao {

	/**
	 * @param userId
	 * @return
	 */
	List<DayBean> findDayBeanListByUserId(String userId);

	/**
	 * @param dayBean
	 */
	void save(DayBean dayBean);

	/**
	 * @param dayBean
	 */
	void delete(DayBean dayBean);
}
