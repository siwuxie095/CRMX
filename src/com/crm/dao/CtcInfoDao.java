package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.CtcInfo;

public interface CtcInfoDao {
	public void save(CtcInfo ctcInfo);
	public void delete(CtcInfo ctcInfo);
	public void deleteMul(CtcInfo[] ctcInfo);
	public void update(CtcInfo ctcInfo);
	public boolean check(CtcInfo ctcInfo); 
	public List<CtcInfo> getFuzzyById(CtcInfo ctcInfo); 
	public List<CtcInfo> getFuzzyByName(CtcInfo ctcInfo); 
	public CtcInfo getDtlById(CtcInfo ctcInfo); 
	public CtcInfo getDtlByName(CtcInfo ctcInfo); 
	public List<CtcInfo> getAll(); 
	public List<Object> getAllId(); 
	public List<Object> getAllName(); 
	public int getNum(); 
}
