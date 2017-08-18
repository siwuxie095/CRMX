package com.crm.service;

import java.util.List;

import com.crm.dao.CrmInfoDao;
import com.crm.dao.impl.CrmInfoDaoImpl;
import com.crm.entity.extd.CrmInfo;

public class CrmInfoService {
	
	private CrmInfoDao crmInfoDao=new CrmInfoDaoImpl();

	public CrmInfo queryCrmInfo(CrmInfo crmInfo) {
		return crmInfoDao.get(crmInfo);
	}
	
	public List<CrmInfo> queryAllCrmInfo() {
		return crmInfoDao.getAll();
	}
	
	public void commitCrmInfo(CrmInfo crmInfo) {
		crmInfoDao.save(crmInfo);
	}
	
	public void modifyCrmInfo(CrmInfo crmInfo) {
		crmInfoDao.update(crmInfo);
	}
	
	public void deleteCrmInfo(CrmInfo crmInfo) {
		crmInfoDao.delete(crmInfo);
	}
	
	public void deleteMulCrmInfo(CrmInfo[] crmInfo) {
		crmInfoDao.deleteMul(crmInfo);
	}
}
