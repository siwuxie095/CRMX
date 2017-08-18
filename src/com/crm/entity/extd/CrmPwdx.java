package com.crm.entity.extd;

import com.crm.entity.AbstractCrmId;

public class CrmPwdx extends AbstractCrmId {
	private String crmPwd;
	
	public String getCrmPwd() {
		return crmPwd;
	}
	public void setCrmPwd(String crmPwd) {
		this.crmPwd = crmPwd;
	}
	@Override
	public String toString() {
		return "CrmPwdx [crmPwd=" + crmPwd + ", crmId=" + crmId + "]";
	}
	
}
