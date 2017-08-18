package com.crm.dao;

import java.util.List;

import com.crm.entity.extd.CrmPwdx;

public interface CrmPwdxDao {
	public void save(CrmPwdx crmPwdx);
	public void delete(CrmPwdx crmPwdx);
	public void deleteMul(CrmPwdx[] crmPwdx);
	public void update(CrmPwdx crmPwdx);
	public boolean check(CrmPwdx crmPwdx);
	public boolean checkx(CrmPwdx crmPwdx);
	public CrmPwdx get(CrmPwdx crmPwdx);
	public List<CrmPwdx> getAll();
}
