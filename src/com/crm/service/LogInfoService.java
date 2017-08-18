package com.crm.service;

import java.util.List;

import com.crm.dao.LogInfoDao;
import com.crm.dao.impl.LogInfoDaoImpl;
import com.crm.entity.extd.LogInfo;

public class LogInfoService {

	private LogInfoDao logInfoDao=new LogInfoDaoImpl();
	
	public List<LogInfo> queryAllLogInfo() {
		return logInfoDao.getAll();
	}
	
	public List<LogInfo> queryAllLogInfoByName(LogInfo logInfo) {
		return logInfoDao.getAllByName(logInfo);
	}
	
	public LogInfo queryDtlLogInfoById(LogInfo logInfo) {
		return logInfoDao.getDtlById(logInfo);
	}
	
	public LogInfo queryDtlLogInfoByName(LogInfo logInfo) {
		return logInfoDao.getDtlByName(logInfo);
	}
	
	public void commitLogInfo(LogInfo logInfo) {
		logInfoDao.save(logInfo);
	}
	
	public void modifyLogInfo(LogInfo logInfo) {
		logInfoDao.update(logInfo);
	}
	
	public void deleteLogInfo(LogInfo logInfo) {
		logInfoDao.delete(logInfo);
	}
	
	public void deleteMulLogInfo(LogInfo[] logInfo) {
		logInfoDao.deleteMul(logInfo);
	}
	
	public boolean checkLogInfo(LogInfo logInfo) {
		return logInfoDao.check(logInfo);
	}
}
