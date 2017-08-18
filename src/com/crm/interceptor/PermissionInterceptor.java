package com.crm.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class PermissionInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		
		HttpServletRequest request=ServletActionContext.getRequest();
		Object obj=request.getSession().getAttribute("crmRole");
		
		if (obj!=null) {
			return invocation.invoke();
		} else {
			request.setAttribute("msg", "请先添加个人信息再进行操作，跳转中...<br />");
			return "lack_info";
		}
		
		
	}

}
