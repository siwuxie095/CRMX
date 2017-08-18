package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.OfrInfo;

public interface OfrInfoDao {
	public void save(OfrInfo ofrInfo);
	public void delete(OfrInfo ofrInfo);
	public void deleteMul(OfrInfo[] ofrInfo);
	public void update(OfrInfo ofrInfo);
	public boolean check(OfrInfo ofrInfo); 
	public OfrInfo getDtlById(OfrInfo ofrInfo); 
	public OfrInfo getDtlByName(OfrInfo ofrInfo); 
	public List<OfrInfo> getAll(); 
	public List<OfrInfo> getAllByName(OfrInfo ofrInfo); 
	public List<Object> getAllId(); 
	public int getNum(); 
}
