<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全部销售机会</title>

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<div class="container-fluid">


	<div class="row-fluid">
		<div class="span12">
		<div class="btn-group table-bordered">
			<a  href="<%= request.getContextPath() %>/xcrm/opp_mgt/add_opp_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
            <a href="<%= request.getContextPath() %>/opp_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-repeat"></i></span>&nbsp;刷新</a>
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
							编号
						</th>
						<th>
							销售机会
						</th>
						<th>
							销售阶段
						</th>
						<th>
							机会来源
						</th>
						<th>
							预计成交金额
						</th>
						<th>
							预计成交日期
						</th>
						<th>
							可能性
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
							<label class="checkbox"><input type="checkbox" name="oppId" value="<s:property value="oppId"></s:property>" /></label>
							</s:if>
							<s:else>
							<label class="checkbox"><input type="checkbox" name="oppId" value="<s:property value="oppId"></s:property>" disabled="disabled" /></label>
							</s:else>
						</td>
						<td>
							<a href="<%=request.getContextPath()%>/opp_info_queryDtlById.action?oppId=<s:property value="oppId"></s:property>"><s:property value="oppId"></s:property></a>
						</td>
						<td>
							<a href="<%=request.getContextPath()%>/opp_info_queryDtlByName.action?oppName=<s:property value="oppName"></s:property>"><s:property value="oppName"></s:property></a>
						</td>
						<td>
							<s:property value="saleStg"></s:property>
						</td>
						<td>
							<s:property value="oppSrc"></s:property>
						</td>
						<td>
							<s:property value="preSaleSum"></s:property>
						</td>
						<td>
							<s:property value="preDealDate"></s:property>
						</td>						
						<td>
						   <s:property value="succPer"></s:property>
						</td>
						
						
						
						
						<% if(!crmRole.equals("comm")){ %>
						<td>
							<s:property value="crmName"></s:property>
						</td>
						<% } %>
						
						
						
						
						<td>
							<% if(!crmRole.equals("comm")){ %>
							<a href="<%= request.getContextPath() %>/opp_info_assign.action?oppId=<s:property value="oppId"></s:property>" class="btn"> <span class="add-on"><i class="icon-user"></i></span>&nbsp;分配</a>
							<% } %>
							
							<s:if test="crmName==crmNameX">
							<a href="<%= request.getContextPath() %>/xcrm/opp_mgt/follow_opp_info.jsp?custName=<s:property value="custName"></s:property>&ctcName=<s:property value="ctcName"></s:property>&oppId=<s:property value="oppId"></s:property>" class="btn"> <span class="add-on"><i class="icon-pencil"></i></span>&nbsp;跟进</a>
							<a href="<%= request.getContextPath() %>/xcrm/opp_mgt/mod_opp_info.jsp?oppId=<s:property value="oppId"></s:property>&custName=<s:property value="custName"></s:property>&ctcName=<s:property value="ctcName"></s:property>&prodSort=<s:property value="prodSort"></s:property>&oppSrc=<s:property value="oppSrc"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
						    <a href="<%= request.getContextPath() %>/opp_info_delete.action?oppId=<s:property value="oppId"></s:property>&delMode=sgl" class="btn"> <span class="add-on"><i class=" icon-trash"></i></span>&nbsp;删除</a>
						    </s:if>
						</td>
					</tr>
				</tbody>
				</s:iterator>
			</table>
		</div>
	</div>
	</div>
</body>


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
			var num=$("input[name='oppId']:checked").length;
			if(num==0){
				alert("您尚未选择！请选择后再删除！");
				return false;
			}else{
				var tip="您共选中 "+num+" 记录，确定要删除吗？";
				if(confirm(tip)){
					var checkArr=$("input[name='oppId']:checked").val([]);
					var oppIds="";
					 for(var i=0;i<checkArr.length;i++){  
						 if(i==checkArr.length-1){
			                	oppIds += checkArr[i].value;
			                }else{
			                	 oppIds += checkArr[i].value +"%23";
			                }
			            }  
					 document.location.href="<%= request.getContextPath() %>/opp_info_deleteMul.action?oppIds="+oppIds+"&delMode=mul";
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




</html>