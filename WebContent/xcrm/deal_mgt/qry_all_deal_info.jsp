<%@page import="com.crm.dao.impl.DealInfoDaoImpl"%>
<%@page import="com.crm.dao.DealInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全部合同订单</title>

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%
	
	String crmName=session.getAttribute("crmName").toString();
	
			
%>


<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
		<div class="btn-group table-bordered">
			<a  href="<%= request.getContextPath() %>/xcrm/deal_mgt/add_deal_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
            <a href="<%= request.getContextPath() %>/deal_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-repeat"></i></span>&nbsp;刷新</a>
			<a onclick="return checkNum();" class="btn"> <span class="add-on"><i class="icon-trash"></i></span>&nbsp;批量删除</a>
			</div>
			<br/><br/>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							<label class="checkbox"><input type="checkbox" onclick="swapCheck()" /></label>
						</th>
						<th>
							合同编号
						</th>
						<th>
							合同主题
						</th>
						<th>
							客户名称
						</th>
						<th>
							签约日期
						</th>
						<th>
							合计
						</th>
						<% if(!crmRole.equals("comm")){ %>
						<th>
							销售负责人
						</th>
						<% } %>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<s:iterator value="list">
				<tbody>
					<tr>
						<td>
							
							<s:if test="crmName==crmNameX">
							<label class="checkbox"><input type="checkbox" name="dealId" value="<s:property value="dealId"></s:property>" /></label>
							</s:if>
							<s:else>
							<label class="checkbox"><input type="checkbox" name="dealId" value="<s:property value="dealId"></s:property>" disabled="disabled" /></label>
							</s:else>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/deal_info_queryDtlById.action?dealId=<s:property value="dealId"></s:property>"><s:property value="dealId"></s:property></a>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/deal_info_queryDtlByName.action?dealThm=<s:property value="dealThm"></s:property>"><s:property value="dealThm"></s:property></a>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/cust_info_queryDtlByName.action?custName=<s:property value="custName"></s:property>"><s:property value="custName"></s:property></a>
						</td>
						<td>
							<s:property value="dealDate"></s:property>
						</td>
						<td>
							<s:property value="saleSum"></s:property>
						</td>
						<% if(!crmRole.equals("comm")){ %>
						<td>
							<s:property value="crmName"></s:property>
						</td>
						<% } %>
						<td>
							<s:if test="crmName==crmNameX">
							<a href="<%= request.getContextPath() %>/xcrm/deal_mgt/mod_deal_info.jsp?dealId=<s:property value="dealId"></s:property>&custName=<s:property value="custName"></s:property>&ctcName=<s:property value="ctcName"></s:property>&oppId=<s:property value="oppId"></s:property>&ofrId=<s:property value="ofrId"></s:property>&prodSort=<s:property value="prodSort"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
						    <a href="<%= request.getContextPath() %>/deal_info_delete.action?dealId=<s:property value="dealId"></s:property>&delMode=sgl" class="btn"> <span class="add-on"><i class=" icon-trash"></i></span>&nbsp;删除</a>
						    </s:if>
						</td>
					</tr>
				</tbody>
				</s:iterator>
			</table>
		</div>
	</div>
	</div>
	
	
	
	<script type="text/javascript">
		//checkbox 全选/取消全选  
		var isCheckAll = false;
		function swapCheck() {
			if (isCheckAll) {
				$("input[type='checkbox']").each(function() {
					this.checked = false;
				});
				isCheckAll = false;
			} else {
				$("input[type='checkbox']").each(function() {
					if(!$(this).is(':disabled')){
						this.checked = true;
		            }
				});
				isCheckAll = true;
			}
		}
		
		
		
		function checkNum(){
			var num=$("input[name='dealId']:checked").length;
			if(num==0){
				alert("您尚未选择！请选择后再删除！");
				return false;
			}else{
				var tip="您共选中 "+num+" 记录，确定要删除吗？";
				if(confirm(tip)){
					var checkArr=$("input[name='dealId']:checked").val([]);
					var dealIds="";
					 for(var i=0;i<checkArr.length;i++){  
						 if(i==checkArr.length-1){
			                	dealIds += checkArr[i].value;
			                }else{
			                	 dealIds += checkArr[i].value +"%23";
			                }
			            }  
					 document.location.href="<%= request.getContextPath() %>/deal_info_deleteMul.action?dealIds="+dealIds+"&delMode=mul";
					return true;
				}else{
					return false;
				}
			}
		}
		
		
		
		
		function check(form) {
			if (document.forms.iForm.oppQry.value == "") {
				alert("请输入后再查找！");
				document.forms.iForm.oppQry.focus();
				return false;
			}
		}
		
	</script>
	
	
	
	
</body>
</html>