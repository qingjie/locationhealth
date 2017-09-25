package com.qingjiezhao.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class UserBean implements Serializable {

	private static final long serialVersionUID = 2287448959886471922L;

	private int id;

	private String username;

	private String password;

	private String gender;

	private String age;

	private String email;

	private Timestamp currentTime;

	private String description;

	private Set<LocationBean> locationBeans = new HashSet<LocationBean>(0);

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
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender
	 *            the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the age
	 */
	public String getAge() {
		return age;
	}

	/**
	 * @param age
	 *            the age to set
	 */
	public void setAge(String age) {
		this.age = age;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * @return the locationBeans
	 */
	public Set<LocationBean> getLocationBeans() {
		return locationBeans;
	}

	/**
	 * @param locationBeans
	 *            the locationBeans to set
	 */
	public void setLocationBeans(Set<LocationBean> locationBeans) {
		this.locationBeans = locationBeans;
	}

}
