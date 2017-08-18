package com.crm.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.DealInfo;
import com.crm.service.DealInfoService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

public class DealInfoAction extends ActionSupport implements ModelDriven<DealInfo> {

	private DealInfo dealInfo=new DealInfo();
	private List<DealInfo> list;
	private DealInfoService dealInfoService=new DealInfoService();
	private HttpServletRequest request=ServletActionContext.getRequest();
	
	@Override
	public DealInfo getModel() {
		return dealInfo;
	}

	public DealInfo getDealInfo() {
		return dealInfo;
	}

	public List<DealInfo> getList() {
		return list;
	}
	
	public String queryAll() {
		ActionContext context=ActionContext.getContext();
		ValueStack stack=context.getValueStack();
		stack.set("crmNameX", request.getSession().getAttribute("crmName").toString());
		
		String crmRole=request.getSession().getAttribute("crmRole").toString();
		
		if (!crmRole.equals("comm")) {
			list=dealInfoService.queryAllDealInfo();
		} else {
			dealInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
			list=dealInfoService.queryAllDealInfoByName(dealInfo);
		}
		return "qry_all";
	}
	
	public String queryDtlById() {
		Object obj=request.getSession().getAttribute("special");
		String dealId="";
		if (obj!=null) {
			dealId=request.getSession().getAttribute("dealId").toString();
		} else {
			dealId=request.getParameter("dealId");
		}
		dealInfo.setDealId(dealId);
		dealInfo=dealInfoService.queryDtlDealInfobyId(dealInfo);
		return "qry_dtl_by_id";
	}
	
	public String queryDtlByName() {
		String dealThm=request.getParameter("dealThm");
		dealInfo.setDealThm(dealThm);
		dealInfo=dealInfoService.queryDtlDealInfobyName(dealInfo);
		return "qry_dtl_by_name";
	}
	
	public String add() {
		
		boolean checked=dealInfoService.checkDealInfo(dealInfo);
		
		if (checked) {
			request.getSession().setAttribute("special", "special");
			request.getSession().setAttribute("dealId", dealInfo.getDealId());
			dealInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
			dealInfoService.commitDealInfo(dealInfo);
			return "add_succ";
		} else {
			request.setAttribute("msg", "客户名称、联系人、销售机会、报价单不匹配，请重新添加！");
			return "add_err";
		}
		
	}
	
	public String modify() {
		request.getSession().setAttribute("special", "special");
		request.getSession().setAttribute("dealId", dealInfo.getDealId());
		dealInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
		dealInfoService.modifyDealInfo(dealInfo);
		return "modify";
	}

	public String delete() {
		String dealId=request.getParameter("dealId");
		dealInfo.setDealId(dealId);
		dealInfoService.deleteDealInfo(dealInfo);
		return "delete";
	}
	
	public String deleteMul() {
		String dealIds=request.getParameter("dealIds");
		String dealIdsList[]=dealIds.split("#");
		DealInfo dealInfoArr[]=new DealInfo[dealIdsList.length];
		for (int i = 0; i < dealInfoArr.length; i++) {
			dealInfoArr[i]=new DealInfo();
			dealInfoArr[i].setDealId(dealIdsList[i]);
		}
		dealInfoService.deleteMulDealInfo(dealInfoArr);
		return "delete";
	}
}
