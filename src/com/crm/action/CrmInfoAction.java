package com.crm.action;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.CrmInfo;
import com.crm.entity.extd.CrmPwdx;
import com.crm.service.CrmInfoService;
import com.crm.service.CrmPwdxService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CrmInfoAction extends ActionSupport implements ModelDriven<CrmInfo> {

	private CrmInfo crmInfo=new CrmInfo();
	private List<CrmInfo> list;
	private CrmInfoService crmInfoService=new CrmInfoService();
	private HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public CrmInfo getModel() {
		return crmInfo;
	}
	
	public List<CrmInfo> getList() {
		return list;
	}

	public String add() {
		System.out.println(crmInfo.getCrmId());
		System.out.println(crmInfo.getCrmName());
		System.out.println(crmInfo.getCrmTitle());
		System.out.println(crmInfo.getCrmRole());
		request.getSession().setAttribute("crmName", crmInfo.getCrmName());
		request.getSession().setAttribute("crmTitle", crmInfo.getCrmTitle());
		request.getSession().setAttribute("crmRole", crmInfo.getCrmRole());
		
		crmInfoService.commitCrmInfo(crmInfo);
		
		request.setAttribute("msg", "添加个人信息成功，正在前往首页...");
		
		return "add";
	}
	
	public String queryAll() {
		list=crmInfoService.queryAllCrmInfo();
		return "qry_all";
	}
	
	public String modify() {
		crmInfoService.modifyCrmInfo(crmInfo);
		return "modify";
	}
	
	public String delete() {
		String crmId=request.getParameter("crmId");
		crmInfo.setCrmId(crmId);
		crmInfoService.deleteCrmInfo(crmInfo);
		CrmPwdx crmPwdx=new CrmPwdx();
		crmPwdx.setCrmId(crmId);
		CrmPwdxService crmPwdxService=new CrmPwdxService();
		crmPwdxService.deleteCrmPwdx(crmPwdx);
		return "delete";
	}
	
	public String deleteMul() {
		String crmIds=request.getParameter("crmIds");
		String crmIdsList[]=crmIds.split("#");
		CrmInfo crmInfoArr[]=new CrmInfo[crmIdsList.length];
		CrmPwdx crmPwdxArr[]=new CrmPwdx[crmIdsList.length];
		for (int i = 0; i < crmInfoArr.length; i++) {
			crmInfoArr[i]=new CrmInfo();
			crmInfoArr[i].setCrmId(crmIdsList[i]);
			crmPwdxArr[i]=new CrmPwdx();
			crmPwdxArr[i].setCrmId(crmIdsList[i]);
		}
		crmInfoService.deleteMulCrmInfo(crmInfoArr);
		CrmPwdxService crmPwdxService=new CrmPwdxService();
		crmPwdxService.deleteMulCrmPwdx(crmPwdxArr);
		return "deleteMul";
	}
}
