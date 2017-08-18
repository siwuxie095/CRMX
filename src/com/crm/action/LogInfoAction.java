package com.crm.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.LogInfo;
import com.crm.service.LogInfoService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LogInfoAction extends ActionSupport implements ModelDriven<LogInfo> {
	
	private LogInfo logInfo=new LogInfo();
	private List<LogInfo> list;
	private LogInfoService logInfoService=new LogInfoService();
	private HttpServletRequest request=ServletActionContext.getRequest();
	
	
	@Override
	public LogInfo getModel() {
		return logInfo;
	}
	
	public LogInfo getLogInfo() {
		return logInfo;
	}
	
	public List<LogInfo> getList() {
		return list;
	}
	
	public String queryAll() {
		logInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
		list=logInfoService.queryAllLogInfoByName(logInfo);
		return "qry_all";
	}
	
	public String queryDtlById() {
		Object obj=request.getSession().getAttribute("special");
		String logId="";
		if (obj!=null) {
			logId=request.getSession().getAttribute("logId").toString();
		} else {
			logId=request.getParameter("logId");
		}
		logInfo.setLogId(logId);
		logInfo=logInfoService.queryDtlLogInfoById(logInfo);
		return "qry_dtl_by_id";
	}
	
	public String queryDtlByName() {
		String logThm=request.getParameter("logThm");
		logInfo.setLogThm(logThm);
		logInfo=logInfoService.queryDtlLogInfoByName(logInfo);
		return "qry_dtl_by_name";
	}
	
	public String add() {
		
		logInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
		boolean checked=logInfoService.checkLogInfo(logInfo);
		
		if (checked) {
			request.getSession().setAttribute("special", "special");
			request.getSession().setAttribute("logId", logInfo.getLogId());
			logInfoService.commitLogInfo(logInfo);
			return "add_succ";
		} else {
			request.setAttribute("msg", "客户名称、联系人、销售机会、销售负责人不匹配，请重新添加！");
			return "add_err";
		}
		
		
	}
	
	public String modify() {
		request.getSession().setAttribute("special", "special");
		request.getSession().setAttribute("logId", logInfo.getLogId());
		logInfo.setCrmName(request.getSession().getAttribute("crmName").toString());
		logInfoService.modifyLogInfo(logInfo);
		return "modify";
	}
	
	public String delete() {
		String logId=request.getParameter("logId");
		logInfo.setLogId(logId);
		logInfoService.deleteLogInfo(logInfo);
		return "delete";
	}
	
	public String deleteMul() {
		String logIds=request.getParameter("logIds");
		String logIdsList[]=logIds.split("#");
		LogInfo logInfoArr[]=new LogInfo[logIdsList.length];
		for (int i = 0; i < logInfoArr.length; i++) {
			logInfoArr[i]=new LogInfo();
			logInfoArr[i].setLogId(logIdsList[i]);
		}
		
		logInfoService.deleteMulLogInfo(logInfoArr);
		return "delete";
	}
	
}
