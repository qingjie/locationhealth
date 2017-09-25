package com.qingjiezhao.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingjiezhao.bean.DayBean;
import com.qingjiezhao.bean.LocationBean;
import com.qingjiezhao.bean.UserBean;
import com.qingjiezhao.form.Emotion;
import com.qingjiezhao.form.Location;
import com.qingjiezhao.form.User;
import com.qingjiezhao.service.EmotionService;
import com.qingjiezhao.service.ReportService;
import com.qingjiezhao.service.UserLocationService;

@Controller
@RequestMapping(value = "")
public class MainController {

	private static Logger logger = Logger.getLogger(MainController.class);

	@Autowired
	private EmotionService emotionService;

	@Autowired
	private ReportService reportService;

	@Autowired
	private UserLocationService userLocationService;

	/**
	 * @param emotionService
	 */
	public void setEmotionService(EmotionService emotionService) {
		this.emotionService = emotionService;
	}

	/**
	 * @param reportService
	 *            the reportService to set
	 */
	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	/**
	 * @param userLocationService
	 *            the userLocationService to set
	 */
	public void setUserLocationService(UserLocationService userLocationService) {
		this.userLocationService = userLocationService;
	}

	// http://localhost:8080/emotionmap/pages/listEmotion/1
	/**
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/listEmotion/{userId}", method = RequestMethod.GET)
	public @ResponseBody
	List<Emotion> getEmotionList(@PathVariable String userId) {
		
		List<Emotion> listEmotion = emotionService.findAll();

		return listEmotion;
	}

	// http://localhost:8080/emotionmap/pages/getLocationsByUserId/1
	/**
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getLocationsByUserId/{userId}", method = RequestMethod.GET)
	public @ResponseBody
	List<Location> getLocationsByUserId(@PathVariable int userId) {

		List<Location> listLoction = userLocationService
				.findLocationListByUserId(userId);

		return listLoction;
	}

	// http://localhost:8080/emotionmap/pages/getUsersByEmotion_selected/6
	/**
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getUsersByEmotion_selected/{emotion_selected}", method = RequestMethod.GET)
	public @ResponseBody
	List<User> getUsersByEmotion_selected(@PathVariable String emotion_selected) {
		System.out.println("------emotion_selected-----" + emotion_selected);
		List<User> userList = userLocationService
				.findUserListByEmotion_selected(emotion_selected);

		return userList;
	}

	/*
	 * insert emotion info to the map
	 */
	// http://localhost:8080/emotionmap/pages/addemotion.jsp?strUserId=1&strLatitude=latitude1&strLongitude=longitude1&strEmotion_selected=6&strDescription=description1
	@RequestMapping(value = "/addemotion")
	@ResponseBody
	public String addEmotion(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strUserId = request.getParameter("strUserId");
		String strLatitude = request.getParameter("strLatitude");
		String strLongitude = request.getParameter("strLongitude");
		String strDesc = request.getParameter("strDescription");
		String strEmotion_selected = request
				.getParameter("strEmotion_selected");

		String[] strArray = strEmotion_selected.split("");

		for (int i = 0; i < strArray.length; i++) {

			if (strArray[i].equals("1")) {

				LocationBean locationBean = new LocationBean();
				locationBean.setLatitude(strLatitude);
				locationBean.setLongitude(strLongitude);
				locationBean.setEmotion_selected(String.valueOf(i));
				Date date = new Date();
				locationBean.setCurrentTime(new Timestamp(date.getTime()));
				locationBean.setDescription(strDesc);

				UserBean userBean = userLocationService.findUserById(Integer
						.valueOf(strUserId));
				Set<UserBean> userBeans = new HashSet<UserBean>();
				userBeans.add(userBean);
				locationBean.setUserBeans(userBeans);
				userLocationService.saveLocation(locationBean);

			}
		}
		return "success";

	}

	// http://localhost:8080/emotionmap/pages/register.jsp?strUserName=zhaoqingjie&strPassword=666666&strGender=male&strAge=100&strEmail=zhaoqingjie@gmail.com&strDescription=descriptionTest
	@RequestMapping(value = "/register")
	@ResponseBody
	public String userRegister(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		UserBean userBean = new UserBean();
		userBean.setUsername(request.getParameter("strUserName"));
		userBean.setPassword(request.getParameter("strPassword"));
		userBean.setGender(request.getParameter("strGender"));
		userBean.setAge(request.getParameter("strAge"));
		userBean.setEmail(request.getParameter("strEmail"));
		Date date = new Date();
		userBean.setCurrentTime(new Timestamp(date.getTime()));
		userBean.setDescription(request.getParameter("strDescription"));

		if (userLocationService.saveUser(userBean)) {
			return "register success";
		} else {
			return "register fail";
		}
	}

	// http://localhost:8080/emotionmap/pages/login.jsp?strUserName=zhaoqingjie&strPassword=666666
	/**
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login")
	@ResponseBody
	public User login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strUserName = request.getParameter("strUserName");
		String strPassword = request.getParameter("strPassword");

		User user = userLocationService.userLogin(strUserName, strPassword);

		if (null != user) {
			return user;
		} else {
			return null;
		}

	}

	// http://localhost:8080/emotionmap/pages/dailyReport/2
	@RequestMapping(value = "/dailyReport/{userId}", method = RequestMethod.GET)
	public @ResponseBody
	List<DayBean> getDailyReport(@PathVariable String userId) {

		List<DayBean> dayBeanList = reportService.findDayListByUserId(userId);

		return dayBeanList;
	}
}
