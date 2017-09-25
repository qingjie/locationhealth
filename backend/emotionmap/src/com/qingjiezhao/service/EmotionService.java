package com.qingjiezhao.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.qingjiezhao.bean.EmotionBean;
import com.qingjiezhao.form.Emotion;

@Service
public interface EmotionService {
	/**
	 * @return
	 */
	List<Emotion> findAll();
}
