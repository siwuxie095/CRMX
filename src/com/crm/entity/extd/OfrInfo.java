package com.crm.entity.extd;

import com.crm.entity.AbstractCrmName;

public class OfrInfo extends AbstractCrmName {
	private String ofrId;
	private String ofrName;
	private String custName;
	private String ctcName;
	private String ofrStatus;
	private String ofrVali;
	private String oppId;
	private String saleDisc;
	private String saleSum;
	
	public String getOfrId() {
		return ofrId;
	}
	public void setOfrId(String ofrId) {
		this.ofrId = ofrId;
	}
	public String getOfrName() {
		return ofrName;
	}
	public void setOfrName(String ofrName) {
		this.ofrName = ofrName;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCtcName() {
		return ctcName;
	}
	public void setCtcName(String ctcName) {
		this.ctcName = ctcName;
	}
	public String getOfrStatus() {
		return ofrStatus;
	}
	public void setOfrStatus(String ofrStatus) {
		this.ofrStatus = ofrStatus;
	}
	public String getOfrVali() {
		return ofrVali;
	}
	public void setOfrVali(String ofrVali) {
		this.ofrVali = ofrVali;
	}
	public String getOppId() {
		return oppId;
	}
	public void setOppId(String oppId) {
		this.oppId = oppId;
	}
	public String getSaleDisc() {
		return saleDisc;
	}
	public void setSaleDisc(String saleDisc) {
		this.saleDisc = saleDisc;
	}
	
	
	public String getSaleSum() {
		return saleSum;
	}
	public void setSaleSum(String saleSum) {
		this.saleSum = saleSum;
	}
	@Override
	public String toString() {
		return "OfrInfo [ofrId=" + ofrId + ", ofrName=" + ofrName + ", custName=" + custName + ", ctcName=" + ctcName
				+ ", ofrStatus=" + ofrStatus + ", ofrVali=" + ofrVali + ", oppId=" + oppId + ", saleDisc=" + saleDisc
				+ ", saleSum=" + saleSum + ", crmName=" + crmName + "]";
	}
	
	
}
