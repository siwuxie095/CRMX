<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑客户信息</title>

<link href="<%= request.getContextPath() %>/xcrm/css/main.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/xcrm/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/xcrm/js/distpicker.data.js"></script>
<script src="<%= request.getContextPath() %>/xcrm/js/distpicker.js"></script>


</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%
		String custId=request.getParameter("custId");
		String custName=request.getParameter("custName");
		String custInd=request.getParameter("custInd");
	%>



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/cust_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
			<a  href="<%= request.getContextPath() %>/xcrm/cust_mgt/add_cust_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
		</div>
		<br/><br/>
		  			<form class="form-horizontal"
			action="<%=request.getContextPath()%>/cust_info_modify.action"
					method="post" name="iForm">
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
								<input name="custId" value="<%= custId %>" type="text" readonly/>
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custName" value="<%= custName %>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户状态</p>
						</td>
						<td>
							<select name="custStatus" class="form-control"> <option value="潜在客户">潜在客户</option> <option value="意向客户">意向客户</option> <option value="成交客户">成交客户</option><option value="流失客户">流失客户</option></select>
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">客户类型</p>
						</td>
						<td>
							<select name="custType" class="form-control"> <option value="小型客户">小型客户</option><option value="中型客户">中型客户</option> <option value="大型客户">大型客户</option></select>
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">客户级别</p>
						</td>
						<td>
							<select name="custLvl" class="form-control"> <option value="S 级客户">S 级客户</option> <option value="A 级客户">A 级客户</option> <option value="B 级客户">B 级客户</option> <option value="C 级客户">C 级客户</option> <option value="D 级客户">D 级客户</option></select>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">所属行业</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custInd" value="<%= custInd %>" type="text" readonly />
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
				<tbody   data-toggle="distpicker">
							<tr class="success">
									<td><label  class="sr-only" for="province7"><p class="text-right">省份</p></label> </td>
									<td><select name="custProv" class="form-control" id="province7"></select></td>
								</tr>
								<tr class="error">
								<td><label class="sr-only" for="city7"><p class="text-right">城市</p></label></td> 
								<td><select name="custCity" class="form-control" id="city7"></select></td>
								</tr>
					<tr class="info">
						<td>
							<p class="text-right">详细地址</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custAddr" type="text" />
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
							<textarea name="custRmk" rows="2"></textarea>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
					<div class="control-group">
						<div class="controls">
						 <button class="btn" type="submit">保存</button> &nbsp;&nbsp;&nbsp;<a href="<%= request.getContextPath() %>/xcrm/cust_mgt/qry_all_cust_info.jsp"><button class="btn" type="button">取消</button></a>
						</div>
					</div>			
			</form>
			</div>
			<div class="span3">
			</div>
		</div>
	</div>
	
	

</body>
</html>