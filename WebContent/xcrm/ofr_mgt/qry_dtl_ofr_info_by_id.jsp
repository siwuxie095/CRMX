<%@page import="com.crm.dao.impl.OfrInfoDaoImpl"%>
<%@page import="com.crm.dao.OfrInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报价单明细</title>
</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>


<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/ofr_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>	
		    <a  href="<%= request.getContextPath() %>/xcrm/ofr_mgt/add_ofr_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
		   <a href="<%= request.getContextPath() %>/xcrm/ofr_mgt/mod_ofr_info.jsp?ofrId=<s:property value="ofrInfo.ofrId"></s:property>&custName=<s:property value="ofrInfo.custName"></s:property>&ctcName=<s:property value="ofrInfo.ctcName"></s:property>&oppId=<s:property value="ofrInfo.oppId"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
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
							<p class="text-right">报价单号</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ofrId" value="<s:property value="ofrInfo.ofrId"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">报价单名</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ofrName" value="<s:property value="ofrInfo.ofrName"></s:property>" type="text" readonly />			
							</div> 
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户名称</p>
						</td>
					    <td>
							<div class="input-append">
								<input name="custName" value="<s:property value="ofrInfo.custName"></s:property>" type="text" readonly />
							</div>				
				</td>
				</tr>	    
					<tr class="error">
						<td>
							<p class="text-right">联系人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" value="<s:property value="ofrInfo.ctcName"></s:property>" type="text" readonly />
							</div>				
				</td>			
					</tr>
								
					<tr class="info">
						<td>
							<p class="text-right">销售机会</p>
						</td>
						<td>
							<div class="input-append">
								<input name="oppId" value="<s:property value="ofrInfo.oppId"></s:property>" type="text" readonly />
							</div>				
						</td>
						
					</tr>
					
					<tr class="warning">
						<td>
							<p class="text-right">报价单状态</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ofrStatus" value="<s:property value="ofrInfo.ofrStatus"></s:property>" type="text" readonly />
							</div>				
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">报价单有效期</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ofrVali" value="<s:property value="ofrInfo.ofrVali"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">整单折扣</p>
						</td>
						<td>
							<div class="input-append">
								<input name="saleDisc" value="<s:property value="ofrInfo.saleDisc"></s:property>" type="text" readonly />			
							</div> 
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">合计</p>
						</td>
						<td>
							<div class="input-append">
								<input name="saleSum" value="<s:property value="ofrInfo.saleSum"></s:property>" type="text" readonly />			
							</div> 
						</td>
					</tr>
					
					<% if(!crmRole.equals("comm")){ %>
					<tr class="warning">
					
						<td>
							<p class="text-right">销售负责人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="crmName" value="<s:property value="ofrInfo.crmName"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<% } %>
									
				</tbody>	
					</table>
					
			</div>
			<div class="span3">
			</div>

		</div>
	</div>
</body>
</html>