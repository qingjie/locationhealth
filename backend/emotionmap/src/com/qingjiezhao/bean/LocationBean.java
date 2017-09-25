package com.qingjiezhao.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class LocationBean implements Serializable {

	private static final long serialVersionUID = 2287448959886471922L;

	private int id;

	private String latitude;

	private String longitude;

	private Timestamp currentTime;

	private String emotion_selected;

	private String description;

	private Set<UserBean> userBeans = new HashSet<UserBean>(0);

	public LocationBean() {

	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the latitude
	 */
	public String getLatitude() {
		return latitude;
	}

	/**
	 * @param latitude
	 *            the latitude to set
	 */
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	/**
	 * @return the longitude
	 */
	public String getLongitude() {
		return longitude;
	}

	/**
	 * @param longitude
	 *            the longitude to set
	 */
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	/**
	 * @return the currentTime
	 */
	public Timestamp getCurrentTime() {
		return currentTime;
	}

	/**
	 * @param currentTime
	 *            the currentTime to set
	 */
	public void setCurrentTime(Timestamp currentTime) {
		this.currentTime = currentTime;
	}

	/**
	 * @return the emotion_selected
	 */
	public String getEmotion_selected() {
		return emotion_selected;
	}

	/**
	 * @param emotion_selected
	 *            the emotion_selected to set
	 */
	public void setEmotion_selected(String emotion_selected) {
		this.emotion_selected = emotion_selected;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the userBeans
	 */
	public Set<UserBean> getUserBeans() {
		return userBeans;
	}

	/**
	 * @param userBeans
	 *            the userBeans to set
	 */
	public void setUserBeans(Set<UserBean> userBeans) {
		this.userBeans = userBeans;
	}

}
