package com.qingjiezhao.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.qingjiezhao.bean.DayBean;
import com.qingjiezhao.bean.LocationBean;
import com.qingjiezhao.bean.MonthBean;
import com.qingjiezhao.bean.UserBean;
import com.qingjiezhao.bean.WeekBean;
import com.qingjiezhao.dao.DayDao;
import com.qingjiezhao.dao.EmotionDao;
import com.qingjiezhao.dao.LocationDao;
import com.qingjiezhao.dao.MonthDao;
import com.qingjiezhao.dao.UserDao;
import com.qingjiezhao.dao.WeekDao;
import com.qingjiezhao.service.ReportService;

/**
 * @author qingjiezhao
 * 
 */
public class ReportServiceImpl implements ReportService {

	private DayDao dayDao;

	private WeekDao weekDao;

	private MonthDao monthDao;

	private UserDao userDao;

	private LocationDao locationDao;

	private EmotionDao emotionDao;

	/**
	 * @return the dayDao
	 */
	public DayDao getDayDao() {
		return dayDao;
	}

	/**
	 * @param dayDao
	 *            the dayDao to set
	 */
	public void setDayDao(DayDao dayDao) {
		this.dayDao = dayDao;
	}

	/**
	 * @return the weekDao
	 */
	public WeekDao getWeekDao() {
		return weekDao;
	}

	/**
	 * @param weekDao
	 *            the weekDao to set
	 */
	public void setWeekDao(WeekDao weekDao) {
		this.weekDao = weekDao;
	}

	/**
	 * @return the monthDao
	 */
	public MonthDao getMonthDao() {
		return monthDao;
	}

	/**
	 * @param monthDao
	 *            the monthDao to set
	 */
	public void setMonthDao(MonthDao monthDao) {
		this.monthDao = monthDao;
	}

	/**
	 * @param userDao
	 *            the userDao to set
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * @param locationDao
	 *            the locationDao to set
	 */
	public void setLocationDao(LocationDao locationDao) {
		this.locationDao = locationDao;
	}

	/**
	 * @param emotionDao
	 *            the emotionDao to set
	 */
	public void setEmotionDao(EmotionDao emotionDao) {
		this.emotionDao = emotionDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.service.ReportService#findDayListByUserId(int)
	 */
	@Override
	public List<DayBean> findDayListByUserId(String userId) {

		List<DayBean> dayBeanList = dayDao.findDayBeanListByUserId(userId);
		return dayBeanList;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.service.ReportService#findWeekBeanListByUserId(int)
	 */
	public List<WeekBean> findWeekBeanListByUserId(int id) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.service.ReportService#findMonthBeanListByUserId(int)
	 */
	public List<MonthBean> findMonthBeanListByUserId(int id) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.service.ReportService#generateDailyReport()
	 */
	public void generateDailyReport() {
		System.out.println("generate daily report + Quartz 1.8.6 ~");

		List<LocationBean> locationBeanList = locationDao
				.findLocationBeanListByDay();
		for (int i = 0; i < locationBeanList.size(); i++) {
			String strEmotion_selected = locationBeanList.get(i)
					.getEmotion_selected();
			Set<UserBean> userBeanSet = locationBeanList.get(i).getUserBeans();
			Iterator<UserBean> it = userBeanSet.iterator();
			int k = 0;
			while (it.hasNext()) {
				DayBean dayBean = new DayBean();
				dayBean.setUserId(String.valueOf(((UserBean) it.next()).getId()));
				String strName = emotionDao
						.findNameByValue(strEmotion_selected);
				dayBean.setName(strName);
				dayBean.setValue(strEmotion_selected);
				dayBean.setDescription("This is the description");
				Date date = new Date();
				dayBean.setCurrentTime(new Timestamp(date.getTime()));
				dayDao.save(dayBean);
				k++;

			}
		}

	}

	private void deleteDailyReport() {
		System.out.println("delete daily report ~");
		
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.service.ReportService#generateWeeklyReport()
	 */
	public void generateWeeklyReport() {
		System.out.println("generate weekly report + Quartz 1.8.6 ~");
		deleteDailyReport();
	}

	private void deleteWeeklyReport() {
		System.out.println("delete weekly report ~");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.qingjiezhao.service.ReportService#generateMonthlyReport()
	 */
	public void generateMonthlyReport() {
		System.out.println("generate monthly report + Quartz 1.8.6 ~");
		deleteWeeklyReport();
	}

}
