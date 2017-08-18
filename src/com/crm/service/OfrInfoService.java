package com.crm.service;

import java.util.List;

import com.crm.dao.OfrInfoDao;
import com.crm.dao.impl.OfrInfoDaoImpl;
import com.crm.entity.extd.OfrInfo;

public class OfrInfoService {

	private OfrInfoDao ofrInfoDao=new OfrInfoDaoImpl();
	
	public List<OfrInfo> queryAllOfrInfo() {
		return ofrInfoDao.getAll();
	}
	
	public List<OfrInfo> queryAllOfrInfoByName(OfrInfo ofrInfo) {
		return ofrInfoDao.getAllByName(ofrInfo);
	}
	
	public OfrInfo queryDtlOfrInfoById(OfrInfo ofrInfo) {
		return ofrInfoDao.getDtlById(ofrInfo);
	}
	
	public OfrInfo queryDtlOfrInfoByName(OfrInfo ofrInfo) {
		return ofrInfoDao.getDtlByName(ofrInfo);
	}
	
	public void commitOfrInfo(OfrInfo ofrInfo) {
		ofrInfoDao.save(ofrInfo);
	}
	
	public void modifyOfrInfo(OfrInfo ofrInfo) {
		ofrInfoDao.update(ofrInfo);
	}
	
	public void deleteOfrInfo(OfrInfo ofrInfo) {
		ofrInfoDao.delete(ofrInfo);
	}
	
	public void deleteMulOfrInfo(OfrInfo[] ofrInfo) {
		ofrInfoDao.deleteMul(ofrInfo);
	}
	
	public boolean checkOfrInfo(OfrInfo ofrInfo) {
		return ofrInfoDao.check(ofrInfo);
	}
}
