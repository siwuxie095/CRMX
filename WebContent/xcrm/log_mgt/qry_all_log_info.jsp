<%@page import="com.crm.dao.impl.LogInfoDaoImpl"%>
<%@page import="com.crm.dao.LogInfoDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人日志记录</title>

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
			<a  href="<%= request.getContextPath() %>/xcrm/log_mgt/add_log_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
            <a href="<%= request.getContextPath() %>/log_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-repeat"></i></span>&nbsp;刷新</a>
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
							日志编号
						</th>
						<th>
							日志主题
						</th>
						<th>
							客户名称
						</th>
						<th>
							联系人
						</th>
						<th>
							联系方式
						</th>
						<th>
							联系日期
						</th>
						<th>
							联系详情
						</th>
						<th>
							下次回访日期
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				
				
				<s:iterator value="list">
				<tbody>
					<tr>
						<td>
							<label class="checkbox"><input type="checkbox" name="logId" value="<s:property value="logId"></s:property>" /></label>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/log_info_queryDtlById.action?logId=<s:property value="logId"></s:property>"><s:property value="logId"></s:property></a>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/log_info_queryDtlByName.action?logThm=<s:property value="logThm"></s:property>"><s:property value="logThm"></s:property></a>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/cust_info_queryDtlByName.action?custName=<s:property value="custName"></s:property>"><s:property value="custName"></s:property></a>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/ctc_info_queryDtlByName.action?ctcName=<s:property value="ctcName"></s:property>"><s:property value="ctcName"></s:property></a>
						</td>
						<td>
							<s:property value="ctcxStyle"></s:property>
						</td>
						<td>
							<s:property value="ctcxDate"></s:property>
						</td>						
						<td>
						 	<s:property value="ctcxDetail"></s:property>
						</td>
						<td>
							<s:property value="nextVisitDate"></s:property>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/xcrm/log_mgt/mod_log_info.jsp?logId=<s:property value="logId"></s:property>&custName=<s:property value="custName"></s:property>&ctcName=<s:property value="ctcName"></s:property>&oppId=<s:property value="oppId"></s:property>&ctcxStyle=<s:property value="ctcxStyle"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
						    <a href="<%= request.getContextPath() %>/log_info_delete.action?logId=<s:property value="logId"></s:property>&delMode=sgl" class="btn"> <span class="add-on"><i class=" icon-trash"></i></span>&nbsp;删除</a>

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
					this.checked = true;
				});
				isCheckAll = true;
			}
		}
		
		
		
		function checkNum(){
			var num=$("input[name='logId']:checked").length;
			if(num==0){
				alert("您尚未选择！请选择后再删除！");
				return false;
			}else{
				var tip="您共选中 "+num+" 记录，确定要删除吗？";
				if(confirm(tip)){
					var checkArr=$("input[name='logId']:checked").val([]);
					var logIds="";
					 for(var i=0;i<checkArr.length;i++){  
						 if(i==checkArr.length-1){
			                	logIds += checkArr[i].value;
			                }else{
			                	 logIds += checkArr[i].value +"%23";
			                }
			            }  
					 document.location.href="<%= request.getContextPath() %>/log_info_deleteMul.action?logIds="+logIds+"&delMode=mul";
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