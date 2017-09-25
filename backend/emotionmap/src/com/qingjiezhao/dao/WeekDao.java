/**
 * 
 */
package com.qingjiezhao.dao;

import java.util.List;

import com.qingjiezhao.bean.WeekBean;

/**
 * @author qingjiezhao
 * 
 */
public interface WeekDao {
	/**
	 * @param userId
	 * @return
	 */
	List<WeekBean> findWeekBeanListByUserId(String userId);

	/**
	 * @param weekBean
	 */
	void save(WeekBean weekBean);
	
	/**
	 * @param weekBean
	 */
	void delete(WeekBean weekBean);
}
