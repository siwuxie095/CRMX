package com.crm.service;

import java.util.List;

import com.crm.dao.CtcInfoDao;
import com.crm.dao.impl.CtcInfoDaoImpl;
import com.crm.entity.extd.CtcInfo;

public class CtcInfoService {

	private CtcInfoDao ctcInfoDao=new CtcInfoDaoImpl();
	
	public List<CtcInfo> queryAllCtcInfo() {
		return ctcInfoDao.getAll();
	}
	
	public CtcInfo queryDtlCtcInfoById(CtcInfo ctcInfo) {
		return ctcInfoDao.getDtlById(ctcInfo);
	}
	
	public CtcInfo queryDtlCtcInfoByName(CtcInfo ctcInfo) {
		return ctcInfoDao.getDtlByName(ctcInfo);
	}
	
	public List<CtcInfo> queryFuzzyCtcInfoById(CtcInfo ctcInfo) {
		return ctcInfoDao.getFuzzyById(ctcInfo);
	}
	
	public List<CtcInfo> queryFuzzyCtcInfoByName(CtcInfo ctcInfo) {
		return ctcInfoDao.getFuzzyByName(ctcInfo);
	}
	
	public boolean checkCtcInfo(CtcInfo ctcInfo) {
		return ctcInfoDao.check(ctcInfo);
	}
	
	public void commitCtcInfo(CtcInfo ctcInfo) {
		ctcInfoDao.save(ctcInfo);
	}
	
	public void modifyCtcInfo(CtcInfo ctcInfo) {
		ctcInfoDao.update(ctcInfo);
	}
	
	public void deleteCtcInfo(CtcInfo ctcInfo) {
		ctcInfoDao.delete(ctcInfo);
	}
	
	public void deleteMulCtcInfo(CtcInfo[] ctcInfo) {
		ctcInfoDao.deleteMul(ctcInfo);
	}
}
