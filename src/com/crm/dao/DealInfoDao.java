package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.DealInfo;

public interface DealInfoDao {
	public void save(DealInfo dealInfo);
	public void delete(DealInfo dealInfo);
	public void deleteMul(DealInfo[] dealInfo);
	public void update(DealInfo dealInfo);
	public boolean check(DealInfo dealInfo);
	public DealInfo getDtlById(DealInfo dealInfo); 
	public DealInfo getDtlByName(DealInfo dealInfo);
	public List<DealInfo> getAll(); 
	public List<DealInfo> getAllByName(DealInfo dealInfo); 
	public List<Object> getAllId(); 
	public int getNum(); 
}
