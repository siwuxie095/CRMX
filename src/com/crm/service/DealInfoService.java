package com.crm.service;

import java.util.List;

import com.crm.dao.DealInfoDao;
import com.crm.dao.impl.DealInfoDaoImpl;
import com.crm.entity.extd.DealInfo;

public class DealInfoService {
	
	private DealInfoDao dealInfoDao=new DealInfoDaoImpl();
	
	public List<DealInfo> queryAllDealInfo() {
		return dealInfoDao.getAll();
	}
	
	public List<DealInfo> queryAllDealInfoByName(DealInfo dealInfo) {
		return dealInfoDao.getAllByName(dealInfo);
	}
	
	public DealInfo queryDtlDealInfobyId(DealInfo dealInfo) {
		return dealInfoDao.getDtlById(dealInfo);
	}
	
	public DealInfo queryDtlDealInfobyName(DealInfo dealInfo) {
		return dealInfoDao.getDtlByName(dealInfo);
	}
	
	public void commitDealInfo(DealInfo dealInfo) {
		dealInfoDao.save(dealInfo);
	}
	
	public void deleteDealInfo(DealInfo dealInfo) {
		dealInfoDao.delete(dealInfo);
	}
	
	public void deleteMulDealInfo(DealInfo[] dealInfo) {
		dealInfoDao.deleteMul(dealInfo);
	}
	
	public void modifyDealInfo(DealInfo dealInfo) {
		dealInfoDao.update(dealInfo);
	}
	
	public boolean checkDealInfo(DealInfo dealInfo) {
		return dealInfoDao.check(dealInfo);
	}
}
