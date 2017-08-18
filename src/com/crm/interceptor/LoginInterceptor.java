package com.crm.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		
		HttpServletRequest request=ServletActionContext.getRequest();
		Object obj=request.getSession().getAttribute("crmId");
		
		String path=request.getRequestURI();
		
		String actionPath=path.substring(6, path.length()-7);
		
		System.out.println("拦截器："+actionPath);
		
		request.setAttribute("return_uri", actionPath);
		
		if (obj!=null) {
			return invocation.invoke();
		} else {
			return "login_none";
		}
		
	}

}
