package com.qingjiezhao.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class MonthBean implements Serializable {

	private static final long serialVersionUID = -5864752116652418602L;

	private int id;

	private String userId;

	private String name;

	private String value;

	private String description;

	private Timestamp currentTime;

	public MonthBean() {

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
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value
	 *            the value to set
	 */
	public void setValue(String value) {
		this.value = value;
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
}
