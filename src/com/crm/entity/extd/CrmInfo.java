package com.crm.entity.extd;

import com.crm.entity.AbstractCrmId;

public class CrmInfo extends AbstractCrmId {
	private String crmName;
	private String crmTitle;
	private String crmRole;
	
	
	public String getCrmName() {
		return crmName;
	}
	public void setCrmName(String crmName) {
		this.crmName = crmName;
	}
	public String getCrmTitle() {
		return crmTitle;
	}
	public void setCrmTitle(String crmTitle) {
		this.crmTitle = crmTitle;
	}
	public String getCrmRole() {
		return crmRole;
	}
	public void setCrmRole(String crmRole) {
		this.crmRole = crmRole;
	}
	@Override
	public String toString() {
		return "CrmInfo [crmName=" + crmName + ", crmTitle=" + crmTitle + ", crmRole=" + crmRole + ", crmId=" + crmId
				+ "]";
	}
	
}
