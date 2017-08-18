<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系人详细信息</title>
</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/ctc_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
			<a  href="<%= request.getContextPath() %>/xcrm/ctc_mgt/add_ctc_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
			<a  href="<%= request.getContextPath() %>/xcrm/ctc_mgt/mod_ctc_info.jsp?ctcId=<s:property value="ctcInfo.ctcId"></s:property>&ctcName=<s:property value="ctcInfo.ctcName"></s:property>&custName=<s:property value="ctcInfo.custName"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>	
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
								<input name="ctcId" value="<s:property value="ctcInfo.ctcId"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">姓名</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" value="<s:property value="ctcInfo.ctcName"></s:property>" type="text" readonly />			
							</div> 
						</td>
					</tr>
					
					
					<tr class="success">
						<td>
							<p class="text-right">职务</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcTitle" value="<s:property value="ctcInfo.ctcTitle"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					
					
					
					<tr class="error">
						<td>
							<p class="text-right">手机</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcCel" value="<s:property value="ctcInfo.ctcCel"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">电话</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcTel" value="<s:property value="ctcInfo.ctcTel"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					
					<tr class="warning">
						<td>
							<p class="text-right">传真</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcFax" value="<s:property value="ctcInfo.ctcFax"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">邮箱</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcMail" value="<s:property value="ctcInfo.ctcMail"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					
					
					
					<tr class="error">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custName" value="<s:property value="ctcInfo.custName"></s:property>" type="text" readonly />
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
					<tr class="info">
						<td>
							<p class="text-right">省份</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcProv" value="<s:property value="ctcInfo.ctcProv"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">城市</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcCity" value="<s:property value="ctcInfo.ctcCity"></s:property>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">详细地址</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcAddr" value="<s:property value="ctcInfo.ctcAddr"></s:property>" type="text" readonly />
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
					<tr class="error">
						<td>
							<p class="text-right">备注</p>
						</td>
						<td>
							<div class="input-append">
							<textarea name="ctcRmk" rows="2" readonly><s:property value="ctcInfo.ctcRmk"></s:property></textarea>
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