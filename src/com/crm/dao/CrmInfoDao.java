package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.CrmInfo;

public interface CrmInfoDao {
	public void save(CrmInfo crmInfo);
	public void delete(CrmInfo crmInfo);
	public void deleteMul(CrmInfo[] crmInfo);
	public void update(CrmInfo crmInfo);
	public boolean	check(CrmInfo crmInfo);
	public CrmInfo	get(CrmInfo crmInfo); 
	public List<CrmInfo> getAll(); 
	public List<Object> getAllName(); 
	public int getNum(); 
}
