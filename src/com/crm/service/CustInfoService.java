package com.crm.service;

import java.util.List;

import com.crm.dao.CustInfoDao;
import com.crm.dao.impl.CustInfoDaoImpl;
import com.crm.entity.extd.CustInfo;

public class CustInfoService {

	private CustInfoDao custInfoDao=new CustInfoDaoImpl();
	
	public List<CustInfo> queryAllCustInfo() {
		return custInfoDao.getAll();
	}
	
	public CustInfo queryDtlCustInfoById(CustInfo custInfo) {
		return custInfoDao.getDtlById(custInfo);
	}
	
	public CustInfo queryDtlCustInfoByName(CustInfo custInfo) {
		return custInfoDao.getDtlByName(custInfo);
	}
	
	public List<CustInfo> queryCustInfoByStatus(CustInfo custInfo) {
		return custInfoDao.getByStatus(custInfo);
	}
	
	public List<CustInfo> queryCustInfoByType(CustInfo custInfo) {
		return custInfoDao.getByType(custInfo);
	}
	
	public List<CustInfo> queryCustInfoByLvl(CustInfo custInfo) {
		return custInfoDao.getByLvl(custInfo);
	}
	
	public void commitCustInfo(CustInfo custInfo) {
		custInfoDao.save(custInfo);
	}
	
	public boolean checkCustInfo(CustInfo custInfo) {
		return custInfoDao.check(custInfo);
	}
	
	public void modifyCustInfo(CustInfo custInfo) {
		custInfoDao.update(custInfo);
	}
	
	public void deleteCustInfo(CustInfo custInfo) {
		custInfoDao.delete(custInfo);
	}
	
	public void deleteMulCustInfo(CustInfo[] custInfo) {
		custInfoDao.deleteMul(custInfo);
	}
	
	public List<CustInfo> queryFuzzyCustInfoById(CustInfo custInfo) {
		return custInfoDao.getFuzzyById(custInfo);
	}
	
	public List<CustInfo> queryFuzzyCustInfoByName(CustInfo custInfo) {
		return custInfoDao.getFuzzyByName(custInfo);
	}
}
