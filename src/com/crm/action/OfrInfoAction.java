package com.crm.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.OfrInfo;
import com.crm.service.OfrInfoService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

public class OfrInfoAction extends ActionSupport implements ModelDriven<OfrInfo> {

	private OfrInfo ofrInfo=new OfrInfo();
	private List<OfrInfo> list;
	private OfrInfoService ofrInfoService=new OfrInfoService();
	private HttpServletRequest request=ServletActionContext.getRequest();
	
	@Override
	public OfrInfo getModel() {
		return ofrInfo;
	}

	public OfrInfo getOfrInfo() {
		return ofrInfo;
	}

	public List<OfrInfo> getList() {
		return list;
	}
	
	public String queryAll() {
		
		ActionContext context=ActionContext.getContext();
		ValueStack stack=context.getValueStack();
		stack.set("crmNameX", request.getSession().getAttribute("crmName").toString());
		
		String crmRole=request.getSession().getAttribute("crmRole").toString();
		
		if (!crmRole.equals("comm")) {
			list=ofrInfoService.queryAllOfrInfo();
		} else {
			ofrInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
			list=ofrInfoService.queryAllOfrInfoByName(ofrInfo);
		}
		
		return "qry_all";
	}
	
	public String queryDtlById() {
		
		Object obj=request.getSession().getAttribute("special");
		String ofrId="";
		if (obj!=null) {
			ofrId=request.getSession().getAttribute("ofrId").toString();
		} else {
			ofrId=request.getParameter("ofrId");
		}
		ofrInfo.setOfrId(ofrId);
		ofrInfo=ofrInfoService.queryDtlOfrInfoById(ofrInfo);
		return "qry_dtl_by_id";
	}
	
	public String queryDtlByName() {
		String ofrName=request.getParameter("ofrName");
		ofrInfo.setOfrName(ofrName);
		ofrInfo=ofrInfoService.queryDtlOfrInfoByName(ofrInfo);
		return "qry_dtl_by_name";
	}

	public String add() {
		
		boolean checked=ofrInfoService.checkOfrInfo(ofrInfo);
		
		if (checked) {
			request.getSession().setAttribute("special", "special");
			request.getSession().setAttribute("ofrId", ofrInfo.getOfrId());
			ofrInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
			ofrInfoService.commitOfrInfo(ofrInfo);
			return "add_succ";
		} else {
			request.setAttribute("msg", "客户名称、联系人、销售机会不匹配，请重新添加！");
			return "add_err";
		}
		
		
	}
	
	public String modify() {
		request.getSession().setAttribute("special", "special");
		request.getSession().setAttribute("ofrId", ofrInfo.getOfrId());
		ofrInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
		ofrInfoService.modifyOfrInfo(ofrInfo);
		return "modify";
	}
	
	public String delete() {
		String ofrId=request.getParameter("ofrId");
		ofrInfo.setOfrId(ofrId);
		ofrInfoService.deleteOfrInfo(ofrInfo);
		return "delete";
	}
	
	public String deleteMul() {
		String ofrIds=request.getParameter("ofrIds");
		String ofrIdsList[]=ofrIds.split("#");
		OfrInfo ofrInfoArr[]=new OfrInfo[ofrIdsList.length];
		for (int i = 0; i < ofrInfoArr.length; i++) {
			ofrInfoArr[i]=new OfrInfo();
			ofrInfoArr[i].setOfrId(ofrIdsList[i]);
		}
		ofrInfoService.deleteMulOfrInfo(ofrInfoArr);
		return "delete";
	}
}
