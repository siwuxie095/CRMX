<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.crm.utils.HibernateUtils"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.crm.dao.impl.CtcInfoDaoImpl"%>
<%@page import="com.crm.dao.CtcInfoDao"%>
<%@page import="com.crm.dao.CustInfoDao"%>
<%@page import="com.crm.dao.impl.CustInfoDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建联系人</title>

<link href="<%= request.getContextPath() %>/xcrm/css/main.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/xcrm/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/xcrm/js/distpicker.data.js"></script>
<script src="<%= request.getContextPath() %>/xcrm/js/distpicker.js"></script>

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>


	<%
	
		Session sessionx=HibernateUtils.getCurrentSession();
		Transaction tx=sessionx.beginTransaction();
		
		CtcInfoDao ctcInfoDao=new CtcInfoDaoImpl();
		
		int num=ctcInfoDao.getNum();
		
		List<Object> list=ctcInfoDao.getAllId();
		
		Object[] objArr=list.toArray();
		
		String str[]=new String[list.size()];
		
		for(int i=0;i<list.size();i++){
			str[i]=objArr[i].toString();
		}
	
		
		
		CustInfoDao custInfoDao=new CustInfoDaoImpl();
		
		int numx=custInfoDao.getNum();
		
		List<Object> listx=custInfoDao.getAllName();
		
		Object[] objArrx=listx.toArray();
		
		String strx[]=new String[listx.size()];
		
		for(int i=0;i<listx.size();i++){
			strx[i]=objArrx[i].toString();
		}
		
	%>







	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		
		  <a  href="<%= request.getContextPath() %>/ctc_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
		  <br/><br/>
				  <form class="form-horizontal"
			action="<%=request.getContextPath()%>/ctc_info_add.action"
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
							<p class="text-right">编号</p>
						</td>
						<td>
							<div class="input-append">
							
							
							<%
							String ctcId="";
							boolean flagx=false;
							for(int i=1;i<1000;i++){
								
								if(i<10){
									ctcId="CTC00"+i;
								}
								if(i>=10 && i<100){
									ctcId="CTC0"+i;
								}
								if(i>=100 && i<1000){
									ctcId="CTC"+i;
								}
								
								if(str.length==0){
									break;
								}else{
									for(int j=0;j<str.length;j++){
										if(ctcId.equals(str[j])){
											break;
										}
										
										while(j==str.length-1){
											if(ctcId!=str[j]){
												flagx=true;
												break;
											}
										}
										
									}
									
									
									if(flagx){
										break;
									}
								}
								
							}
							
							%>
							
							
							
								<input name="ctcId" value="<%= ctcId %>"  type="text" readonly />
							</div>
						</td>
					</tr>
						<tr class="warning">
						<td>
							<p class="text-right">姓名</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" type="text" />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">职务</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcTitle" type="text" />
							</div>
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">手机</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcCel" type="text" />
							</div>
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">电话</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcTel" type="text" />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">传真</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcFax" type="text" />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">邮箱</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcMail" type="text" />
							</div>
						</td>
					</tr>



					<tr class="error">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							
							<div class="input-append">
								<input name="custName" type="text" /> <a href="#myModal" role="button" class="btn" data-toggle="modal">&nbsp;查找&nbsp;</a>

										<!-- Modal -->
					<div id="myModal" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true" style="display: none;">

						<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
						<h5 id="myModalLabel">请输入客户编号/客户名称：</h5>
						</div>

						<div class="modal-body">
							<form class="form-search" align="center" action="<%=request.getContextPath()%>/cust_info_queryFuzzy.action"
					method="post" name="iForm">
								<input name="custQry" type="text" class="span9">
								<button type="submit" class="btn" onclick="return checkx(this);"><b>&nbsp;&nbsp;&nbsp;开始查找&nbsp;&nbsp;&nbsp;</b>
								</button>
							</form>
						</div>


					</div>
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
									<td><select name="ctcProv" class="form-control" id="province7"></select></td>
								</tr>
								<tr class="error">
								<td><label class="sr-only" for="city7"><p class="text-right">城市</p></label></td> 
								<td><select name="ctcCity" class="form-control" id="city7"></select></td>
								</tr>
					<tr class="info">
						<td>
							<p class="text-right">详细地址</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcAddr" type="text" />
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
							<textarea name="ctcRmk" rows="2"></textarea>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
					<div class="control-group">
						<div class="controls">
							 <button class="btn" type="submit" onclick="return check(this);">保存</button> &nbsp;&nbsp; <a href="<%= request.getContextPath() %>/xcrm/ctc_mgt/qry_all_ctc_info.jsp"><button class="btn" type="button">取消</button></a>
						</div>
					</div>
			</form>
			</div>
			<div class="span3">
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	
	function check(form) {
		if (document.forms.iForm.ctcName.value == "") {
			alert("请输入姓名！");
			document.forms.iForm.ctcName.focus();
			return false;
		}
		if (document.forms.iForm.ctcTitle.value == "") {
			alert("请输入职务！");
			document.forms.iForm.ctcTitle.focus();
			return false;
		}
		if (document.forms.iForm.ctcCel.value == "") {
			alert("请输入手机！");
			document.forms.iForm.ctcCel.focus();
			return false;
		}
		if (document.forms.iForm.ctcMail.value == "") {
			alert("请输入邮箱！");
			document.forms.iForm.ctcMail.focus();
			return false;
		}
		if (document.forms.iForm.custName.value == "") {
			alert("请输入客户名称！");
			document.forms.iForm.custName.focus();
			return false;
		}
		
		
		var custName = document.forms.iForm.custName.value;
		var list = new Array();
		
		<% for (int k = 0; k < strx.length; k++) { %>
		
			list[<%=k%>] ='<%=strx[k]%>';
		
		<% } %>
		
		if(list.length==0){
			alert("数据库中无此客户，请先添加该客户！");
			return false;
		}else{
			
		for(var i=0;i<list.length;i++){
			if(custName==list[i]){
				return true;
			}
			while(i==list.length-1){
				if(custName!=list[i]){
					alert("数据库中无此客户，请先添加该客户！");
					return false;
				}
			}
			
		}	
		}
	}
	
	
	
	
	
	function checkx(form){
		if (document.forms.iForm.custQry.value == "") {
			alert("请输入后再查找！");
			document.forms.iForm.custQry.focus();
			return false;
		}else{
			var custQry=document.forms.iForm.custQry.value;
			 document.location.href="<%= request.getContextPath() %>/queryCustInfoServlet?custQry="+custQry;
			 return true;
		}
		
		
	}
	
	
	</script>
	
	
</body>
</html>