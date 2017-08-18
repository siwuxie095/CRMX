package com.crm.action;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.CtcInfo;
import com.crm.service.CtcInfoService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.regexp.internal.recompile;

public class CtcInfoAction extends ActionSupport implements ModelDriven<CtcInfo> {

	private CtcInfo ctcInfo=new CtcInfo();
	private List<CtcInfo> list;
	private CtcInfoService ctcInfoService=new CtcInfoService();
	private HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public CtcInfo getModel() {
		return ctcInfo;
	}

	public List<CtcInfo> getList() {
		return list;
	}
	
	public CtcInfo getCtcInfo() {
		return ctcInfo;
	}
	
	
	public String queryAll() {
		list=ctcInfoService.queryAllCtcInfo();
		return "qry_all";
	}
	
	public String queryDtlById() {
		Object obj=request.getSession().getAttribute("special");
		String ctcId="";
		if (obj!=null) {
			ctcId=request.getSession().getAttribute("ctcId").toString();
		} else {
			ctcId=request.getParameter("ctcId");
		}
		ctcInfo.setCtcId(ctcId);
		ctcInfo=ctcInfoService.queryDtlCtcInfoById(ctcInfo);
		return "qry_dtl_by_id";
	}
	
	public String queryDtlByName() {
		String ctcName=request.getParameter("ctcName");
		ctcInfo.setCtcName(ctcName);
		ctcInfo=ctcInfoService.queryDtlCtcInfoByName(ctcInfo);
		return "qry_dtl_by_name";
	}
	
	public String queryFuzzy() {
		String ctcQry=request.getParameter("ctcQry");
		if (isContainChinese(ctcQry)) {
			ctcInfo.setCtcName(ctcQry);
			list=ctcInfoService.queryFuzzyCtcInfoByName(ctcInfo);
		}else {
			ctcInfo.setCtcId(ctcQry);
			list=ctcInfoService.queryFuzzyCtcInfoById(ctcInfo);
		}
		return "qry_fuzzy";
	}
	
	public String add() {
		
		boolean checked=ctcInfoService.checkCtcInfo(ctcInfo);
		
		if (checked) {
			request.setAttribute("msg", "该公司已存在联系人无法重复添加，请到备注中添加！");
			return "add_err";
		} else {
			request.getSession().setAttribute("special", "special");
			request.getSession().setAttribute("ctcId", ctcInfo.getCtcId());
			ctcInfo.setCrmId(request.getSession().getAttribute("crmId").toString());
			ctcInfoService.commitCtcInfo(ctcInfo);
		}
		return "add_succ";
	}
	
	public String modify() {
		request.getSession().setAttribute("special", "special");
		request.getSession().setAttribute("ctcId", ctcInfo.getCtcId());
		ctcInfo.setCrmId(request.getSession().getAttribute("crmId").toString());
		ctcInfoService.modifyCtcInfo(ctcInfo);
		return "modify";
	}
	
	public String delete() {
		String ctcId=request.getParameter("ctcId");
		ctcInfo.setCtcId(ctcId);
		ctcInfoService.deleteCtcInfo(ctcInfo);
		return "delete";
	}
	
	public String deleteMul() {
		
		String ctcIds=request.getParameter("ctcIds");
		String ctcIdsList[]=ctcIds.split("#");
		CtcInfo ctcInfoArr[]=new CtcInfo[ctcIdsList.length];
		for (int i = 0; i < ctcInfoArr.length; i++) {
			ctcInfoArr[i]=new CtcInfo();
			ctcInfoArr[i].setCtcId(ctcIdsList[i]);
		}
		ctcInfoService.deleteMulCtcInfo(ctcInfoArr);
		
		return "delete";
	}
	
	public boolean isContainLetter(String str) {  
        String regex=".*[a-zA-Z]+.*";  
        Matcher m=Pattern.compile(regex).matcher(str);  
        return m.matches();  
    }  
  
	
	public boolean isContainChinese(String str) {

        Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
        Matcher m = p.matcher(str);
        if (m.find()) {
            return true;
        }
        return false;
    }
}
