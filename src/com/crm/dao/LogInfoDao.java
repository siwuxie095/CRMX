package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.LogInfo;

public interface LogInfoDao {
	public void save(LogInfo logInfo);
	public void delete(LogInfo logInfo);
	public void deleteMul(LogInfo[] logInfo);
	public void update(LogInfo logInfo);
	public boolean check(LogInfo logInfo); 
	public LogInfo getDtlById(LogInfo logInfo); 
	public LogInfo getDtlByName(LogInfo logInfo); 
	public List<LogInfo> getAll(); 
	public List<LogInfo> getAllByName(LogInfo logInfo); 
	public List<Object> getAllId(); 
	public int getNum(); 
	
	
}
