package com.crm.service;

import java.util.List;

import com.crm.dao.CrmPwdxDao;
import com.crm.dao.impl.CrmPwdxDaoImpl;
import com.crm.entity.extd.CrmPwdx;

public class CrmPwdxService {

	private CrmPwdxDao crmPwdxDao=new CrmPwdxDaoImpl();
	
	public String checkCrmPwdx(CrmPwdx crmPwdx) {
		
		boolean flag=crmPwdxDao.check(crmPwdx);
		
		if (flag) {
			
			boolean flagx=crmPwdxDao.checkx(crmPwdx);
			
			if (flagx) {
				System.out.println("two - 帐号存在，且密码输入正确");
				return "two";
			} else {
				System.out.println("one - 帐号存在，但密码输入错误");
				return "one";
			}
		}
		
		System.out.println("zero - 帐号不存在");
		return "zero";
	}
	
	public void commitCrmPwdx(CrmPwdx crmPwdx) {
		crmPwdxDao.save(crmPwdx);
	}
	
	public void modifyCrmPwdx(CrmPwdx crmPwdx) {
		crmPwdxDao.update(crmPwdx);
	}
	
	public List<CrmPwdx> queryAllCrmPwdx() {
		return crmPwdxDao.getAll();
	}
	
	public void deleteCrmPwdx(CrmPwdx crmPwdx) {
		crmPwdxDao.delete(crmPwdx);
	}
	
	public void deleteMulCrmPwdx(CrmPwdx[] crmPwdx) {
		crmPwdxDao.deleteMul(crmPwdx);
	}
}
