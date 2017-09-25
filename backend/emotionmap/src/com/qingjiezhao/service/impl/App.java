package com.qingjiezhao.service.impl;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) throws Exception {
		new ClassPathXmlApplicationContext( new String[] { "applicationContext-dao.xml","applicationContext-service.xml","applicationContext.xml","applicationContext-quartz1.xml"});
	
	}

}