package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.OppInfo;

public interface OppInfoDao {
	public void save(OppInfo oppInfo);
	public void delete(OppInfo oppInfo);
	public void deleteMul(OppInfo[] oppInfo);
	public void update(OppInfo oppInfo);
	public boolean check(OppInfo oppInfo); 
	public OppInfo getDtlById(OppInfo oppInfo); 
	public OppInfo getDtlByName(OppInfo oppInfo); 
	public List<OppInfo> getAll(); 
	public List<OppInfo> getAllByName(OppInfo oppInfo); 
	public List<Object> getAllId(); 
	public int getNum(); 
}
