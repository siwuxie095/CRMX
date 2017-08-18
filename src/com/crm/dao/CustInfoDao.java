package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.CustInfo;

public interface CustInfoDao {
	public void save(CustInfo custInfo);
	public void delete(CustInfo custInfo);
	public void deleteMul(CustInfo[] custInfo);
	public void update(CustInfo custInfo);
	public boolean check(CustInfo custInfo);
	public List<CustInfo> getFuzzyById(CustInfo custInfo); 
	public List<CustInfo> getFuzzyByName(CustInfo custInfo); 
	public CustInfo getDtlById(CustInfo custInfo); 
	public CustInfo getDtlByName(CustInfo custInfo); 
	public List<CustInfo> getByStatus(CustInfo custInfo); 
	public List<CustInfo> getByType(CustInfo custInfo); 
	public List<CustInfo> getByLvl(CustInfo custInfo); 
	public List<CustInfo> getAll(); 
	public List<Object> getAllId(); 
	public List<Object> getAllName(); 
	public int getNum(); 
}
