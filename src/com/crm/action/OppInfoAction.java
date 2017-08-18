package com.crm.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.OppInfo;
import com.crm.service.OppInfoService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

public class OppInfoAction extends ActionSupport implements ModelDriven<OppInfo> {

	private OppInfo oppInfo=new OppInfo();
	
	private List<OppInfo> list;
	private OppInfoService oppInfoService=new OppInfoService();
	private HttpServletRequest request=ServletActionContext.getRequest();
	
	@Override
	public OppInfo getModel() {
		return oppInfo;
	}

	public OppInfo getOppInfo() {
		return oppInfo;
	}

	public List<OppInfo> getList() {
		return list;
	}

	public String queryAll() {
		
		ActionContext context=ActionContext.getContext();
		ValueStack stack=context.getValueStack();
		stack.set("crmNameX", request.getSession().getAttribute("crmName").toString());
		
		String crmRole=request.getSession().getAttribute("crmRole").toString();
		
		if (!crmRole.equals("comm")) {
			list=oppInfoService.queryAllOppInfo();
		} else {
			oppInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
			list=oppInfoService.queryAllOppInfoByName(oppInfo);
		}
		
		return "qry_all";
	}
	
	public String assign() {
		
		String oppId=request.getParameter("oppId");
		oppInfo.setOppId(oppId);
		oppInfo=oppInfoService.queryDtlOppInfoById(oppInfo);
		
		return "assign";
	}
	
	public String queryDtlById() {
		Object obj=request.getSession().getAttribute("special");
		String oppId="";
		if (obj!=null) {
			oppId=request.getSession().getAttribute("oppId").toString();
		} else {
			oppId=request.getParameter("oppId");
		}
		oppInfo.setOppId(oppId);
		oppInfo=oppInfoService.queryDtlOppInfoById(oppInfo);
		return "qry_dtl_by_id";
	}
	
	public String queryDtlByName() {
		String oppName=request.getParameter("oppName");
		oppInfo.setOppName(oppName);
		oppInfo=oppInfoService.queryDtlOppInfoByName(oppInfo);
		return "qry_dtl_by_name";
	}
	
	public String add() {
		
		boolean checked=oppInfoService.checkOppInfo(oppInfo);
		
		if (checked) {
			oppInfoService.commitOppInfo(oppInfo);
			oppInfo=oppInfoService.queryDtlOppInfoById(oppInfo);
			return "add_succ";
		} else {
			request.setAttribute("msg", "客户名称和联系人不匹配，请重新添加！");
			return "add_err";
		}
		
		
	}
	
	public String modify() {
		request.getSession().setAttribute("special", "special");
		request.getSession().setAttribute("oppId", oppInfo.getOppId());
		if (oppInfo.getCrmName()==null) {
			oppInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
		}
		oppInfoService.modifyOppInfo(oppInfo);
		return "modify";
	}
	
	public String delete() {
		String oppId=request.getParameter("oppId");
		oppInfo.setOppId(oppId);
		oppInfoService.deleteOppInfo(oppInfo);
		return "delete";
	}
	
	public String deleteMul() {
		String oppIds=request.getParameter("oppIds");
		String oppIdsList[]=oppIds.split("#");
		OppInfo oppInfoArr[]=new OppInfo[oppIdsList.length];
		for (int i = 0; i < oppInfoArr.length; i++) {
			oppInfoArr[i]=new OppInfo();
			oppInfoArr[i].setOppId(oppIdsList[i]);
		}
		oppInfoService.deleteMulOppInfo(oppInfoArr);
		return "delete";
	}
}
