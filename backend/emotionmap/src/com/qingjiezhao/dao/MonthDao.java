/**
 * 
 */
package com.qingjiezhao.dao;

import java.util.List;

import com.qingjiezhao.bean.DayBean;
import com.qingjiezhao.bean.MonthBean;

/**
 * @author qingjiezhao
 * 
 */
public interface MonthDao {

	/**
	 * @param userId
	 * @return
	 */
	List<MonthBean> findMonthBeanListByUserId(String userId);
	/**
	 * @param monthBean
	 */
	void save(MonthBean monthBean);
}
