<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模糊查询结果</title>

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%
	String currentUri=request.getRequestURI();
%>



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/cust_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
			<a href="<%= request.getContextPath() %>/xcrm/cust_mgt/add_cust_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
			<a href="#myModal" role="button" class="btn" data-toggle="modal"><span class="add-on"><i class="icon-search"></i></span>&nbsp;查找</a>

					<!-- Modal -->
					<div id="myModal" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
						style="display: none;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h5 id="myModalLabel">请输入客户编号/客户名称：</h5>

						</div>
						<div class="modal-body">
							<form class="form-search" align="center" action="<%=request.getContextPath()%>/cust_info_queryFuzzy.action"
					method="post" name="iForm">
								<input name="custQry" type="text" class="span9">
								<button type="submit" class="btn" onclick="return check(this);"><b>&nbsp;&nbsp;&nbsp;开始查找&nbsp;&nbsp;&nbsp;</b>
								</button>
							</form>

						</div>

					</div>
			<a onclick="return checkNum();" class="btn"> <span class="add-on"><i class="icon-trash"></i></span>&nbsp;批量删除</a>
			</div>
			<br/><br/>
			<form class="form-horizontal"
			action="<%=request.getContextPath()%>/xcrm/cust_mgt/qry_cust_info.jsp"
					method="post" name="iForm">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							<label class="checkbox"><input type="checkbox" onclick="swapCheck()" /></label>
						</th>
						<th>
							客户编号
						</th>
						<th>
							客户名称
						</th>
						<th>
							客户状态
						</th>
						<th>
							客户类型
						</th>
						<th>
							客户级别
						</th>
						<th>
							所属行业
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
							
							<label class="checkbox"><input type="checkbox" name="custId" value="<s:property value="custId"></s:property>" /></label>
						</td>
						<td>
							<p><a  href="<%=request.getContextPath()%>/cust_info_queryDtlById.action?custId=<s:property value="custId"></s:property>"><s:property value="custId"></s:property></a></p>
						</td>
						<td>
							<p><a  href="<%=request.getContextPath()%>/cust_info_queryDtlByName.action?custName=<s:property value="custName"></s:property>"><s:property value="custName"></s:property></a></p>
						</td>
						<td>
							<s:property value="custStatus"></s:property>
						</td>
						<td>
							<s:property value="custType"></s:property>
						</td>
						<td>
							<s:property value="custLvl"></s:property>
						</td>
						<td>
							<s:property value="custInd"></s:property>
						</td>
						<td>
						<a href="<%= request.getContextPath() %>/xcrm/cust_mgt/mod_cust_info.jsp?custId=<s:property value="custId"></s:property>&custName=<s:property value="custName"></s:property>&custInd=<s:property value="custInd"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
						<% if(!crmRole.equals("comm")){ %>
						<a href="<%= request.getContextPath() %>/cust_info_delete.action?custId=<s:property value="custId"></s:property>&delMode=sgl&rtnUri=<%= currentUri %>" class="btn"> <span class="add-on"><i class=" icon-trash"></i></span>&nbsp;删除</a>
						<% } %>
						</td>
					</tr>
				</tbody>
				
				</s:iterator>
				
			</table>
			</form>
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
			var num=$("input[name='custId']:checked").length;
			if(num==0){
				alert("您尚未选择！请选择后再删除！");
				return false;
			}else{
				var tip="您共选中 "+num+" 记录，确定要删除吗？";
				if(confirm(tip)){
					var checkArr=$("input[name='custId']:checked").val([]);
					var custIds="";
					 for(var i=0;i<checkArr.length;i++){  
						 if(i==checkArr.length-1){
			                	custIds += checkArr[i].value;
			                }else{
			                	 custIds += checkArr[i].value +"%23";
			                }
			            }  
					 document.location.href="<%= request.getContextPath() %>/cust_info_deleteMul.action?custIds="+custIds+"&delMode=mul&rtnUri=<%= currentUri %>";
					return true;
				}else{
					return false;
				}
			}
		}
		
		
		function check(form) {
			if (document.forms.iForm.custQry.value == "") {
				alert("请输入后再查找！");
				document.forms.iForm.custQry.focus();
				return false;
			}
		}
		
	</script>



</body>
</html>