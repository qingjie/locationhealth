package com.qingjiezhao.service.impl;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.qingjiezhao.service.ReportService;

public class GenerateWeeklyReport extends QuartzJobBean {

	private ReportService reportService;

	/**
	 * @param reportService
	 *            the reportService to set
	 */
	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	/* (non-Javadoc)
	 * @see org.springframework.scheduling.quartz.QuartzJobBean#executeInternal(org.quartz.JobExecutionContext)
	 */
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {

		reportService.generateWeeklyReport();

	}
}