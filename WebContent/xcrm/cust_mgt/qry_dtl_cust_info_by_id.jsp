<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户详细信息</title>
</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/cust_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
			<a  href="<%= request.getContextPath() %>/xcrm/cust_mgt/add_cust_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
			<a  href="<%= request.getContextPath() %>/xcrm/cust_mgt/mod_cust_info.jsp?custId=<s:property value="custInfo.custId"></s:property>&custName=<s:property value="custInfo.custName"></s:property>&custInd=<s:property value="custInfo.custInd"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>	
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
							<p class="text-right">客户编号</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custId" value="<s:property value="custInfo.custId"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custName" value="<s:property value="custInfo.custName"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户状态</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custStatus" value="<s:property value="custInfo.custStatus"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">客户类型</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custType" value="<s:property value="custInfo.custType"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">客户级别</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custLvl" value="<s:property value="custInfo.custLvl"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">所属行业</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custInd" value="<s:property value="custInfo.custInd"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>

				</tbody>
				<thead>
					<tr>
						<th>
							地址信息
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="success">
						<td>
							<p class="text-right">省份</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custProv" value="<s:property value="custInfo.custProv"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">城市</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custCity" value="<s:property value="custInfo.custCity"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">详细地址</p>
						</td>
						<td>
							<div class="input-append">
								<input  class="form-control" name="custAddr" value="<s:property value="custInfo.custAddr"></s:property>" type="text" readonly/>
							</div>
						</td>
					</tr>
				</tbody>
				<thead>
					<tr>
						<th>
							备注信息
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="warning">
						<td>
							<p class="text-right">备注</p>
						</td>
						<td>
							<div class="input-append">
							<textarea class="form-control" name="custRmk" rows="2" readonly><s:property value="custInfo.custRmk"></s:property></textarea>
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