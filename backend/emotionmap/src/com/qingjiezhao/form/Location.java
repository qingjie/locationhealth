package com.qingjiezhao.form;

public class Location implements java.io.Serializable {

	private static final long serialVersionUID = -1648882264577434878L;

	private String latitude;

	private String longitude;

	private String emotion_selected;

	private String description;

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

}