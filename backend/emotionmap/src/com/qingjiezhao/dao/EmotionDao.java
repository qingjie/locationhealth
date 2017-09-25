package com.qingjiezhao.dao;

import java.util.List;

import com.qingjiezhao.bean.EmotionBean;

public interface EmotionDao {

	/**
	 * @return
	 */
	List<EmotionBean> findAll();
	
	/**
	 * @param value
	 * @return
	 */
	String findNameByValue(String value);

}
