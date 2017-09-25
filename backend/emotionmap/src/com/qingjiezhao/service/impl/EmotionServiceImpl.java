package com.qingjiezhao.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.qingjiezhao.bean.EmotionBean;
import com.qingjiezhao.dao.EmotionDao;
import com.qingjiezhao.form.Emotion;
import com.qingjiezhao.service.EmotionService;

public class EmotionServiceImpl implements EmotionService {

	private EmotionDao emotionDao;

	/**
	 * @return
	 */
	public EmotionDao getEmotionDao() {
		return emotionDao;
	}

	/**
	 * @param emotionDao
	 */
	public void setEmotionDao(EmotionDao emotionDao) {
		this.emotionDao = emotionDao;
	}

	/* (non-Javadoc)
	 * @see com.qingjiezhao.service.EmotionService#findAll()
	 */
	public List<Emotion> findAll() {
		List<Emotion> listEmotion = new ArrayList<Emotion>();
		List<EmotionBean> listEmotionBean = emotionDao.findAll();

		for (int i = 0; i < listEmotionBean.size(); i++) {
			Emotion emotion = new Emotion();
			emotion.setName(listEmotionBean.get(i).getName());
			emotion.setValue(listEmotionBean.get(i).getValue());
			emotion.setDescription(listEmotionBean.get(i).getDescription());
			listEmotion.add(emotion);

		}

		return listEmotion;
	}

}
