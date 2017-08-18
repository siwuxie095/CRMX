package com.crm.action;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.crm.entity.extd.CrmInfo;
import com.crm.entity.extd.CrmPwdx;
import com.crm.service.CrmInfoService;
import com.crm.service.CrmPwdxService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CrmPwdxAction extends ActionSupport implements ModelDriven<CrmPwdx> {

	private CrmPwdx crmPwdx=new CrmPwdx();
	private List<CrmPwdx> list;
	private CrmPwdxService crmPwdxService=new CrmPwdxService();
	private HttpServletRequest request=ServletActionContext.getRequest();
	
	private String returnUri;
	
	@Override
	public CrmPwdx getModel() {
		return crmPwdx;
	}
	
	public List<CrmPwdx> getList() {
		return list;
	}
	
	public String getReturnUri() {
		return returnUri;
	}

	public String check() {
		return crmPwdxService.checkCrmPwdx(crmPwdx);
	}


	public String login() {
		
		String result=check();
		
		if (result.equals("two")) {
			
			
			request.getSession().setAttribute("crmId", crmPwdx.getCrmId());
			request.getSession().setAttribute("flag", "login_success");
			
			CrmInfo crmInfo=new CrmInfo();
			crmInfo.setCrmId(crmPwdx.getCrmId());
			
			CrmInfoService crmInfoService=new CrmInfoService();
			crmInfo=crmInfoService.queryCrmInfo(crmInfo);
			if (crmInfo!=null) {
				request.getSession().setAttribute("crmName", crmInfo.getCrmName());
				request.getSession().setAttribute("crmTitle", crmInfo.getCrmTitle());
				request.getSession().setAttribute("crmRole", crmInfo.getCrmRole());
			}
			
			returnUri=request.getParameter("returnUri");
			System.out.println("Action："+returnUri);
			if (returnUri!=null) {
				return "return_back";
			}
			
			return "login_succ";
			
		}else if (result.equals("one")) {
			
			request.setAttribute("msg", "密码输入错误，请重新输入!跳转中...");
			return "login_err";
		}
		
			request.setAttribute("msg", "此帐号尚未注册!跳转中...");
			return "login_err";
	}
	
	
	public String logout() {
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.getSession().invalidate();
		
		return "logout";
	}
	
	
	public String modify() {
		
		if (crmPwdx.getCrmId()==null) {
			crmPwdx.setCrmId(request.getSession().getAttribute("crmId").toString());
		}
		crmPwdxService.modifyCrmPwdx(crmPwdx);
		return "modify";
	}
	
	
	public String register() {
		if (isContainChinese(crmPwdx.getCrmId())
			||isContainLetter(crmPwdx.getCrmId())
			||crmPwdx.getCrmId().length()!=3
			||crmPwdx.getCrmPwd().length()<3) {
			
			request.setAttribute("msg", "帐号由三个数字组成，密码不能少于三个字符，跳转中...");
			return "register_err";
			
		} else {
			
			String result=check();
			
			if (result.equals("zero")) {
				crmPwdxService.commitCrmPwdx(crmPwdx);
				request.setAttribute("msg", "您已注册成功，现在去登录！跳转中...");
				return "register_succ";
			} else {
				request.setAttribute("msg", "此帐号已注册！跳转中...");
				return "register_err";
			}
		}
	}
	
	
	public String queryAll() {
		list=crmPwdxService.queryAllCrmPwdx();
		return "qry_all";
	}
	
	
	public String delete() {
		String crmId=request.getParameter("crmId");
		crmPwdx.setCrmId(crmId);
		crmPwdxService.deleteCrmPwdx(crmPwdx);
		CrmInfo crmInfo=new CrmInfo();
		crmInfo.setCrmId(crmId);
		CrmInfoService crmInfoService=new CrmInfoService();
		crmInfoService.deleteCrmInfo(crmInfo);
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
		crmPwdxService.deleteMulCrmPwdx(crmPwdxArr);
		CrmInfoService crmInfoService=new CrmInfoService();
		crmInfoService.deleteMulCrmInfo(crmInfoArr);
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
