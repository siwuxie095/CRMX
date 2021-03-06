<%@page import="com.crm.entity.extd.CrmPwdx"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.crm.utils.HibernateUtils"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.crm.dao.impl.CrmPwdxDaoImpl"%>
<%@page import="com.crm.dao.CrmPwdxDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%

	String crmId=session.getAttribute("crmId").toString();
	
	Session sessionx=HibernateUtils.getCurrentSession();
	Transaction tx=sessionx.beginTransaction();
	
	CrmPwdxDao crmPwdxDao=new CrmPwdxDaoImpl();
	
	CrmPwdx crmPwdx=new CrmPwdx();
	
	crmPwdx.setCrmId(crmId);
	
	String str=crmPwdxDao.get(crmPwdx).getCrmPwd();

%>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
				  <form class="form-horizontal"
			action="<%=request.getContextPath()%>/xcrm/crm_mgt/mod_crm_pwdx_cfm.jsp" method="post" name="iForm">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							输入原密码
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td>
							<p class="text-right">帐号</p>
						</td>
						<td>
							<div class="input-append">
								<input name="crmId" value="<%= crmId %>" type="text" readonly />
							</div>
						</td>
					</tr>
						<tr class="warning">
						<td>
							<p class="text-right">密码</p>
						</td>
						<td>
							<div class="input-append">
								<input name="crmPwd" type="password" />
							</div>
						</td>
					</tr>		
				</tbody>
				
			</table>
					<div class="control-group">
						<div class="controls">
							 <button class="btn" type="submit" onclick="return check(this);">确认</button> &nbsp;&nbsp; <a href="<%= request.getContextPath() %>/xcrm/nav/index.jsp"><button class="btn" type="button">取消</button></a>
						</div>
					</div>
			</form>
			</div>
			<div class="span3">
			</div>
		</div>
	</div>
	
	
	
	
	<script type="text/javascript">
	
	function check(form) {
		if (document.forms.iForm.crmPwd.value == "") {
			alert("请输入原密码！");
			document.forms.iForm.crmPwd.focus();
			return false;
		}
		
		if (document.forms.iForm.crmPwd.value != <%= str %>) {
			alert("原密码输入错误！");
			document.forms.iForm.crmPwd.focus();
			return false;
		}
	}
	
	</script>
	
	
	
	
</body>
</html>