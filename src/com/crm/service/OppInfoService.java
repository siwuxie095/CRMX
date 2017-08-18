package com.crm.service;

import java.util.List;

import com.crm.dao.OppInfoDao;
import com.crm.dao.impl.OppInfoDaoImpl;
import com.crm.entity.extd.OppInfo;

public class OppInfoService {

	private OppInfoDao oppInfoDao=new OppInfoDaoImpl();
	
	public List<OppInfo> queryAllOppInfo() {
		return oppInfoDao.getAll();
	}
	
	public List<OppInfo> queryAllOppInfoByName(OppInfo oppInfo) {
		return oppInfoDao.getAllByName(oppInfo);
	}
	
	public OppInfo queryDtlOppInfoById(OppInfo oppInfo) {
		return oppInfoDao.getDtlById(oppInfo);
	}
	
	public OppInfo queryDtlOppInfoByName(OppInfo oppInfo) {
		return oppInfoDao.getDtlByName(oppInfo);
	}
	
	public void commitOppInfo(OppInfo oppInfo) {
		oppInfoDao.save(oppInfo);
	}
	
	public void modifyOppInfo(OppInfo oppInfo) {
		oppInfoDao.update(oppInfo);
	}
	
	public void deleteOppInfo(OppInfo oppInfo) {
		oppInfoDao.delete(oppInfo);
	}
	
	public void deleteMulOppInfo(OppInfo[] oppInfo) {
		oppInfoDao.deleteMul(oppInfo);
	}
	
	public boolean checkOppInfo(OppInfo oppInfo) {
		return oppInfoDao.check(oppInfo);
	}
}
