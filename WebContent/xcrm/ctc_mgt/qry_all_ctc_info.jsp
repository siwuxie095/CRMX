<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入 Struts2 标签库 -->
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全部联系人信息</title>

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>


	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
		<div class="btn-group table-bordered">
			<a  href="<%= request.getContextPath() %>/xcrm/ctc_mgt/add_ctc_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>

           <a href="#myModal" role="button" class="btn" data-toggle="modal"><span class="add-on"><i class="icon-search"></i></span>&nbsp;查找</a>

					<!-- Modal -->
					<div id="myModal" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
						style="display: none;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h5 id="myModalLabel">请输入联系人编号/联系人姓名：</h5>

						</div>
						<div class="modal-body">
							<form class="form-search" align="center" action="<%=request.getContextPath()%>/ctc_info_queryFuzzy.action"
					method="post" name="iForm">
								<input name="ctcQry" type="text" class="span9">
								<button type="submit" class="btn" onclick="return check(this);"><b>&nbsp;&nbsp;&nbsp;开始查找&nbsp;&nbsp;&nbsp;</b>
								</button>
							</form>

						</div>

					</div>
					<a href="<%= request.getContextPath() %>/ctc_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-repeat"></i></span>&nbsp;刷新</a>
					<% if(!crmRole.equals("comm")){ %>
					<a onclick="return checkNum();" class="btn"> <span class="add-on"><i class="icon-trash"></i></span>&nbsp;批量删除</a> 
					<% } %>
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
							姓名
						</th>
						<th>
							职务
						</th>
						<th>
							手机
						</th>
						<th>
							邮箱
						</th>
						<th>
							客户名称
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
							<label class="checkbox"><input type="checkbox" name="ctcId" value="<s:property value="ctcId"></s:property>" /></label>
						</td>
						<td>
							<a href="<%=request.getContextPath()%>/ctc_info_queryDtlById.action?ctcId=<s:property value="ctcId"></s:property>"><s:property value="ctcId"></s:property></a>
						</td>
						<td>
							<a href="<%=request.getContextPath()%>/ctc_info_queryDtlByName.action?ctcName=<s:property value="ctcName"></s:property>"><s:property value="ctcName"></s:property></a>
						</td>
						<td>
							<s:property value="ctcTitle"></s:property>
						</td>
						<td>
							<s:property value="ctcCel"></s:property>
						</td>
						<td>
							<s:property value="ctcMail"></s:property>
						</td>
						<td>
							<p><a  href="<%=request.getContextPath()%>/cust_info_queryDtlByName.action?custName=<s:property value="custName"></s:property>"><s:property value="custName"></s:property></a></p>
						</td>						
						<td>
							<a href="<%= request.getContextPath() %>/xcrm/ctc_mgt/mod_ctc_info.jsp?ctcId=<s:property value="ctcId"></s:property>&ctcName=<s:property value="ctcName"></s:property>&custName=<s:property value="custName"></s:property>" class="btn"> <span class="add-on"><i class="icon-edit"></i></span>&nbsp;编辑</a>
							<% if(!crmRole.equals("comm")){ %>
							<a href="<%= request.getContextPath() %>/ctc_info_delete.action?ctcId=<s:property value="ctcId"></s:property>&delMode=sgl" class="btn"> <span class="add-on"><i class=" icon-trash"></i></span>&nbsp;删除</a>
							<% } %>
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
			var num=$("input[name='ctcId']:checked").length;
			if(num==0){
				alert("您尚未选择！请选择后再删除！");
				return false;
			}else{
				var tip="您共选中 "+num+" 记录，确定要删除吗？";
				if(confirm(tip)){
					var checkArr=$("input[name='ctcId']:checked").val([]);
					var ctcIds="";
					 for(var i=0;i<checkArr.length;i++){  
						 if(i==checkArr.length-1){
			                	ctcIds += checkArr[i].value;
			                }else{
			                	 ctcIds += checkArr[i].value +"%23";
			                }
			            }  
					 document.location.href="<%= request.getContextPath() %>/ctc_info_deleteMul.action?ctcIds="+ctcIds+"&delMode=mul";
					return true;
				}else{
					return false;
				}
			}
		}
		
		
		
		
		function check(form) {
			if (document.forms.iForm.ctcQry.value == "") {
				alert("请输入后再查找！");
				document.forms.iForm.ctcQry.focus();
				return false;
			}
		}
		
	</script>




</body>
</html>