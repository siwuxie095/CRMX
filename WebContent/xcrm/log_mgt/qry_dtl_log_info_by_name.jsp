<%@page import="com.crm.dao.impl.LogInfoDaoImpl"%>
<%@page import="com.crm.dao.LogInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志详细信息</title>
</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		
		
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/log_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
		     <a  href="<%= request.getContextPath() %>/xcrm/log_mgt/add_log_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
			<a href="<%= request.getContextPath() %>/xcrm/log_mgt/mod_log_info.jsp?logId=<s:property value="logInfo.logId"></s:property>&custName=<s:property value="logInfo.custName"></s:property>&ctcName=<s:property value="logInfo.ctcName"></s:property>&oppId=<s:property value="logInfo.oppId"></s:property>&ctcxStyle=<s:property value="logInfo.ctcxStyle"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
		  </div>
		<br/><br/>
		
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							基本信息
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td>
							<p class="text-right">日志编号</p>
						</td>
						<td>
							<div class="input-append">
								<input name="logId" value="<s:property value="logInfo.logId"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
						<tr class="warning">
						<td>
							<p class="text-right">日志主题</p>
						</td>
						<td>
							<div class="input-append">
								<input name="logThm" value="<s:property value="logInfo.logThm"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custName" value="<s:property value="logInfo.custName"></s:property>" type="text" readonly />
							</div>				
						</td>	
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">联系人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" value="<s:property value="logInfo.ctcName"></s:property>" type="text" readonly />
							</div>			
						</td>
						</tr>
						
						<tr class="info">
						<td>
							<p class="text-right">销售机会</p>
						</td>
						<td>
							<div class="input-append">
								<input name="oppId" value="<s:property value="logInfo.oppId"></s:property>" type="text" readonly />
							</div>			
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">联系方式</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcxStyle" value="<s:property value="logInfo.ctcxStyle"></s:property>" type="text" readonly />
							</div>			
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">联系日期</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcxDate" value="<s:property value="logInfo.ctcxDate"></s:property>" type="text" readonly />
							</div>			
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">联系详情</p>
						</td>
						<td>
							<div class="input-append">
								<textarea name="ctcxDetail" rows="2" readonly ><s:property value="logInfo.ctcxDetail"></s:property></textarea>
							</div>			
						</td>
					</tr>
						<tr class="info">
						<td>
							<p class="text-right">下次回访日期</p>
						</td>
						<td>
							<div class="input-append">
								<input name="nextVisitDate" value="<s:property value="logInfo.nextVisitDate"></s:property>" type="text" readonly />
							</div>			
						</td>
					</tr>
				</tbody>
				
			</table>
			
			</div>
			<div class="span3">
			</div>
		</div>
	</div>

</body>
</html>