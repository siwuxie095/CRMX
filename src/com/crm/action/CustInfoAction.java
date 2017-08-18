package com.crm.action;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.CustInfo;
import com.crm.service.CustInfoService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CustInfoAction extends ActionSupport implements ModelDriven<CustInfo> {

	private CustInfo custInfo=new CustInfo();
	private List<CustInfo> list;
	private CustInfoService custInfoService=new CustInfoService();
	HttpServletRequest request=ServletActionContext.getRequest();
	
	@Override
	public CustInfo getModel() {
		
		return custInfo;
	}
	
	public List<CustInfo> getList() {
		return list;
	}

	

	public CustInfo getCustInfo() {
		return custInfo;
	}

	public String queryAll() {
		
		list=custInfoService.queryAllCustInfo();
		
		return "qry_all";
	}
	
	
	public String queryByLvl() {
		String custLvl=request.getParameter("custLvl");
		custInfo.setCustLvl(custLvl);
		list=custInfoService.queryCustInfoByLvl(custInfo);
		return "qry_by_lvl";
	}
	
	public String queryByStatus() {
		String custStatus=request.getParameter("custStatus");
		custInfo.setCustStatus(custStatus);
		list=custInfoService.queryCustInfoByStatus(custInfo);
		return "qry_by_status";
	}
	
	public String queryByType() {
		String custType=request.getParameter("custType");
		custInfo.setCustType(custType);
		list=custInfoService.queryCustInfoByType(custInfo);
		return "qry_by_type";
	}
	
	public String queryDtlById() {
		
		Object obj=request.getSession().getAttribute("special");
		String custId="";
		if (obj!=null) {
			custId=request.getSession().getAttribute("custId").toString();
		} else {
			custId=request.getParameter("custId");
		}
		
		custInfo.setCustId(custId);
		custInfo=custInfoService.queryDtlCustInfoById(custInfo);
		return "qry_dtl_by_id";
	}
	
	public String queryDtlByName() {
		String custName=request.getParameter("custName");
		custInfo.setCustName(custName);
		custInfo=custInfoService.queryDtlCustInfoByName(custInfo);
		return "qry_dtl_by_name";
	}
	
	public String queryFuzzy() {
		String custQry=request.getParameter("custQry");
		if (isContainChinese(custQry)) {
			custInfo.setCustName(custQry);
			list=custInfoService.queryFuzzyCustInfoByName(custInfo);
		}else {
			custInfo.setCustId(custQry);
			list=custInfoService.queryFuzzyCustInfoById(custInfo);
		}
		return "qry_fuzzy";
	}
	
	public String add() {
		
		boolean checked=custInfoService.checkCustInfo(custInfo);
		
		if (checked) {
			request.setAttribute("msg", "此客户信息已存在！请重新添加!");
			return "add_err";
		} else {
			request.getSession().setAttribute("special", "special");
			request.getSession().setAttribute("custId", custInfo.getCustId());
			custInfo.setCrmId(request.getSession().getAttribute("crmId").toString());
			custInfoService.commitCustInfo(custInfo);
			return "add_succ";
		}
		
	}
	
	public String modify() {
		request.getSession().setAttribute("special", "special");
		request.getSession().setAttribute("custId", custInfo.getCustId());
		custInfo.setCrmId(request.getSession().getAttribute("crmId").toString());
		custInfoService.modifyCustInfo(custInfo);
		return "modify";
	} 
	
	
	public String delete() {
		String custId=request.getParameter("custId");
		custInfo.setCustId(custId);
		custInfoService.deleteCustInfo(custInfo);
		return "delete";
	}

	public String deleteMul() {
		String custIds=request.getParameter("custIds");
		String custIdsList[]=custIds.split("#");
		CustInfo custInfoArr[]=new CustInfo[custIdsList.length];
		for (int i = 0; i < custInfoArr.length; i++) {
			custInfoArr[i]=new CustInfo();
			custInfoArr[i].setCustId(custIdsList[i]);
		}
		custInfoService.deleteMulCustInfo(custInfoArr);
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
