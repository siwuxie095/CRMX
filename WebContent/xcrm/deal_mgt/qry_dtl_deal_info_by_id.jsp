<%@page import="com.crm.dao.impl.DealInfoDaoImpl"%>
<%@page import="com.crm.dao.DealInfoDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合同订单明细</title>
</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>




<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/deal_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
			<a  href="<%= request.getContextPath() %>/xcrm/deal_mgt/add_deal_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
			<a href="<%= request.getContextPath() %>/xcrm/deal_mgt/mod_deal_info.jsp?dealId=<s:property value="dealInfo.dealId"></s:property>&custName=<s:property value="dealInfo.custName"></s:property>&ctcName=<s:property value="dealInfo.ctcName"></s:property>&oppId=<s:property value="dealInfo.oppId"></s:property>&ofrId=<s:property value="dealInfo.ofrId"></s:property>&prodSort=<s:property value="dealInfo.prodSort"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
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
							<p class="text-right">合同编号</p>
						</td>
						<td>
							<div class="input-append">
								<input name="dealId" value="<s:property value="dealInfo.dealId"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">合同主题</p>
						</td>
						<td>
							<div class="input-append">
								<input name="dealThm" value="<s:property value="dealInfo.dealThm"></s:property>" type="text" readonly />			
							</div> 
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custName" value="<s:property value="dealInfo.custName"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					
					<tr class="error">
						<td>
							<p class="text-right">联系人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" value="<s:property value="dealInfo.ctcName"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					
					<tr class="info">
						<td>
							<p class="text-right">销售机会</p>
						</td>
						<td>
							<div class="input-append">
								<input name="oppId" value="<s:property value="dealInfo.oppId"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">报价单号</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ofrId" value="<s:property value="dealInfo.ofrId"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					
					<tr class="success">
						<td>
							<p class="text-right">产品分类</p>
						</td>
						<td>
							<div class="input-append">
								<input name="prodSort" value="<s:property value="dealInfo.prodSort"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>	
					
					<tr class="error">
						<td>
							<p class="text-right">订单状态</p>
						</td>
						<td>
							<div class="input-append">
								<input name="dealStatus" value="<s:property value="dealInfo.dealStatus"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>

					<tr class="info">
						<td>
							<p class="text-right">签约日期</p>
						</td>
						<td>
							<div class="input-append">
								<input name="dealDate" value="<s:property value="dealInfo.dealDate"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					
					<tr class="warning">
						<td>
							<p class="text-right">交付日期</p>
						</td>
						<td>
							<div class="input-append">
								<input name="overDate" value="<s:property value="dealInfo.overDate"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>	
					
					<tr class="success">
						<td>
							<p class="text-right">合计</p>
						</td>
						<td>
							<div class="input-append">
								<input name="saleSum" value="<s:property value="dealInfo.saleSum"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<% if(!crmRole.equals("comm")){ %>
					<tr class="error">
					
						<td>
							<p class="text-right">销售负责人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="crmName" value="<s:property value="dealInfo.crmName"></s:property>" type="text" readonly />
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