<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售机会明细</title>
</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>




<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/opp_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
			<a  href="<%= request.getContextPath() %>/xcrm/opp_mgt/add_opp_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
			<a href="<%= request.getContextPath() %>/xcrm/opp_mgt/mod_opp_info.jsp?oppId=<s:property value="oppInfo.oppId"></s:property>&custName=<s:property value="oppInfo.custName"></s:property>&ctcName=<s:property value="oppInfo.ctcName"></s:property>&prodSort=<s:property value="oppInfo.prodSort"></s:property>&oppSrc=<s:property value="oppInfo.oppSrc"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
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
							<p class="text-right">编号</p>
						</td>
						<td>
							<div class="input-append">
								<input name="oppId" value="<s:property value="oppInfo.oppId"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">销售机会</p>
						</td>
						<td>
							<div class="input-append">
								<input name="oppName" value="<s:property value="oppInfo.oppName"></s:property>" type="text" readonly />			
							</div> 
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custName" value="<s:property value="oppInfo.custName"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">联系人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" value="<s:property value="oppInfo.ctcName"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">产品分类</p>
						</td>
						<td>
							<div class="input-append">
								<input name="prodSort" value="<s:property value="oppInfo.prodSort"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">销售阶段</p>
						</td>
						<td>
							<div class="input-append">
								<input name="saleStg" value="<s:property value="oppInfo.saleStg"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">机会来源</p>
						</td>
						<td>
							<div class="input-append">
								<input name="oppSrc" value="<s:property value="oppInfo.oppSrc"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">预计成交金额</p>
						</td>
						<td>
							<div class="input-append">
								<input name="preSaleSum" value="<s:property value="oppInfo.preSaleSum"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">预计成交日期</p>
						</td>
						<td>
							<div class="input-append">
								<input name="preDealDate" value="<s:property value="oppInfo.preDealDate"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">可能性</p>
						</td>
						<td>
							<div class="input-append">
								<input name="succPer" value="<s:property value="oppInfo.succPer"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<% if(!crmRole.equals("comm")){ %>
					<tr class="success">
					
						<td>
							<p class="text-right">销售负责人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="crmName" value="<s:property value="oppInfo.crmName"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<% } %>
				</tbody>
				
				<thead>
					<tr>
						<th>
							备注信息
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="error">
						<td>
							<p class="text-right">备注</p>
						</td>
						<td>
							<div class="input-append">
							<textarea name="oppRmk" rows="2" readonly><s:property value="oppInfo.oppRmk"></s:property></textarea>
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