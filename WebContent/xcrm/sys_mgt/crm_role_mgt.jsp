<%@page import="com.crm.dao.impl.CrmInfoDaoImpl"%>
<%@page import="com.crm.dao.CrmInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%	if(!crmRole.equals("root")){ %>
	<jsp:forward page="/xcrm/nav/index.jsp"></jsp:forward>
<%	
	}

	String currentUri=request.getRequestURI();

%>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">

            <a href="<%= request.getContextPath() %>/crm_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-repeat"></i></span>&nbsp;刷新</a>
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
							帐号
						</th>
						<th>
							姓名
						</th>
						<th>
							职务
						</th>
						<th>
							权限
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<s:iterator value="list">
				<s:if test="crmId!='admin'">
				<tbody>
					<tr>
						<td>
							<label class="checkbox"><input type="checkbox" name="crmId" value="<s:property value="crmId"></s:property>" /></label>
						</td>
						
						<td>
							<s:property value="crmId"></s:property>
						</td>
						<td>
							<s:property value="crmName"></s:property>
						</td>
						<td>
							<s:property value="crmTitle"></s:property>
						</td>
						<td>
							<s:property value="crmRole"></s:property>
						</td>
						<td>
							<s:if test="crmRole=='comm'">
						    <a href="<%= request.getContextPath() %>/crm_info_modify.action?crmId=<s:property value="crmId"></s:property>&crmName=<s:property value="crmName"></s:property>&crmTitle=客户经理&crmRole=plus&modMode=byAdmin" class="btn"> <span class="add-on"><i class=" icon-arrow-up"></i></span>&nbsp;升职</a>
						    </s:if>
						    <s:elseif test="crmRole=='plus'">
						    <a href="<%= request.getContextPath() %>/crm_info_modify.action?crmId=<s:property value="crmId"></s:property>&crmName=<s:property value="crmName"></s:property>&crmTitle=销售人员&crmRole=comm&modMode=byAdmin" class="btn"> <span class="add-on"><i class=" icon-arrow-down"></i></span>&nbsp;降职</a>
						    </s:elseif>
						     <a href="<%= request.getContextPath() %>/crm_info_delete.action?crmId=<s:property value="crmId"></s:property>&delMode=sgl&rtnUri=<%= currentUri %>" class="btn"> <span class="add-on"><i class=" icon-trash"></i></span>&nbsp;删除</a>
						</td>
					</tr>
				</tbody>
				</s:if>
				</s:iterator>
			</table>
		</div>
		<div class="span3">
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
					this.checked = true;
				});
				isCheckAll = true;
			}
		}
		
		
		
		function checkNum(){
			var num=$("input[name='crmId']:checked").length;
			if(num==0){
				alert("您尚未选择！请选择后再删除！");
				return false;
			}else{
				var tip="您共选中 "+num+" 记录，确定要删除吗？";
				if(confirm(tip)){
					var checkArr=$("input[name='crmId']:checked").val([]);
					var crmIds="";
					 for(var i=0;i<checkArr.length;i++){  
						 if(i==checkArr.length-1){
			                	crmIds += checkArr[i].value;
			                }else{
			                	 crmIds += checkArr[i].value +"%23";
			                }
			            }  
					 document.location.href="<%= request.getContextPath() %>/crm_info_deleteMul.action?crmIds="+crmIds+"&delMode=mul&rtnUri=<%= currentUri %>";
					return true;
				}else{
					return false;
				}
			}
		}
		
		
	
	</script>
	
	
	
</body>
</html>