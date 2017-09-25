/**
 * 
 */
package com.qingjiezhao.service;

import java.util.List;

import com.qingjiezhao.bean.DayBean;
import com.qingjiezhao.bean.MonthBean;
import com.qingjiezhao.bean.WeekBean;

/**
 * @author qingjiezhao
 * 
 */
public interface ReportService {

	/**
	 * @param id
	 * @return
	 */
	List<DayBean> findDayListByUserId(String userId);

	/**
	 * @param id
	 * @return
	 */
	List<WeekBean> findWeekBeanListByUserId(int id);

	/**
	 * @param id
	 * @return
	 */
	List<MonthBean> findMonthBeanListByUserId(int id);

	void generateDailyReport();

	void generateWeeklyReport();

	void generateMonthlyReport();

}
