<%@page import="org.hibernate.Transaction"%>
<%@page import="com.crm.utils.HibernateUtils"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.crm.dao.OppInfoDao"%>
<%@page import="com.crm.dao.impl.OppInfoDaoImpl"%>
<%@page import="com.crm.dao.impl.LogInfoDaoImpl"%>
<%@page import="com.crm.dao.LogInfoDao"%>
<%@page import="com.crm.dao.impl.CtcInfoDaoImpl"%>
<%@page import="com.crm.dao.CtcInfoDao"%>
<%@page import="com.crm.dao.impl.CustInfoDaoImpl"%>
<%@page import="com.crm.dao.CustInfoDao"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.crm.utils.HibernateUtils"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.crm.dao.impl.OppInfoDaoImpl"%>
<%@page import="com.crm.dao.OppInfoDao"%>
<%@page import="com.crm.dao.impl.OfrInfoDaoImpl"%>
<%@page import="com.crm.dao.OfrInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建日志记录</title>
<%-- <link href="<%= request.getContextPath() %>/xcrm/opp_mgt/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">  --%> 
<link href="<%= request.getContextPath() %>/xcrm/date_css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%
	Session sessionx=HibernateUtils.getCurrentSession();
	Transaction tx=sessionx.beginTransaction();
	
	LogInfoDao logInfoDao=new LogInfoDaoImpl();
	
	List<Object> list=logInfoDao.getAllId();
	Object[] objArr=list.toArray();
	String[] str=new String[list.size()];
	
	for(int i=0;i<list.size();i++){
		str[i]=objArr[i].toString();
	}
	

	String custName=request.getParameter("custName");
	String ctcName=request.getParameter("ctcName");
	String oppId=request.getParameter("oppId");
%>



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/log_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
		    </div>
		<br/><br/>
		
				  <form class="form-horizontal"
			action="<%=request.getContextPath()%>/log_info_add.action" method="post" name="iForm">
			
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
							<p class="text-right">日志编号</p>
						</td>
						<td>
							<div class="input-append">
							
							
							<%
							String logId="";
							boolean flagx=false;
							for(int i=1;i<1000;i++){
								
								if(i<10){
									logId="LOG00"+i;
								}
								if(i>=10 && i<100){
									logId="LOG0"+i;
								}
								if(i>=100 && i<1000){
									logId="LOG"+i;
								}
								
								if(str.length==0){
									break;
								}else{
									for(int j=0;j<str.length;j++){
										if(logId.equals(str[j])){
											break;
										}
										
										while(j==str.length-1){
											if(logId!=str[j]){
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
							
							
								<input name="logId" value="<%= logId %>" type="text" readonly />
							</div>
						</td>
					</tr>
						<tr class="warning">
						<td>
							<p class="text-right">日志主题</p>
						</td>
						<td>
							<div class="input-append">
								<input name="logThm" type="text" />
							</div>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户名称</p>
						</td>
						<td>
							<div class="input-append">
								<input name="custName" value="<%= custName %>" type="text" readonly />
							</div>				
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">联系人</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" value="<%= ctcName %>" type="text" readonly />
							</div>			
						</td>
					</tr>
						
						<tr class="info">
						<td>
							<p class="text-right">销售机会</p>
						</td>
						<td>
							<div class="input-append">
								<input name="oppId" value="<%= oppId %>" type="text" readonly />
							</div>			
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">联系方式</p>
						</td>
						<td>
							<select name="ctcxStyle" class="form-control"> <option value="电话">电话</option> <option value="上门">上门</option> </select>
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">联系日期</p>
						</td>
						<td>
							 <div class="input-append date form_datetime" data-date="" 
              				  data-date-format="yyyy MM dd" data-link-format="yyyy-mm-dd" data-link-field="dtp_input1">
                  			  <input  value=""  size="16" type="text" readonly>
                 			   <span class="add-on"><i class="icon-remove"></i></span>
								<span class="add-on"><i class="icon-calendar"></i></span>
              				  </div>
                			<input type="hidden" id="dtp_input1" name="ctcxDate" value="" />
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">联系详情</p>
						</td>
						<td>
							<div class="input-append">
							<textarea name="ctcxDetail" rows="2"></textarea>
							</div>
						</td>
					</tr>
						<tr class="info">
						<td>
							<p class="text-right">下次回访日期</p>
						</td>
						<td>
							 <div class="input-append date form_datetime" data-date="" 
              				  data-date-format="yyyy MM dd" data-link-format="yyyy-mm-dd" data-link-field="dtp_input2">
                  			  <input  value=""  size="16" type="text" readonly>
                 			   <span class="add-on"><i class="icon-remove"></i></span>
								<span class="add-on"><i class="icon-calendar"></i></span>
              				  </div>
                			<input type="hidden" id="dtp_input2" name="nextVisitDate" value="" />
						</td>
					</tr>
				</tbody>
				

			</table>
					<div class="control-group">
						<div class="controls">
							 <button class="btn" type="submit" onclick="return check(this);">保存</button> &nbsp;&nbsp; <a href="<%= request.getContextPath() %>/xcrm/log_mgt/qry_all_log_info.jsp"><button class="btn" type="button">取消</button></a>
						</div>
					</div>
			</form>
			
			</div>
			<div class="span3">
			</div>
		</div>
	</div>
	
	
	
	
<%-- <script type="text/javascript" src="<%= request.getContextPath() %>/xcrm/opp_mgt/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script> --%>
<%-- <script type="text/javascript" src="<%= request.getContextPath() %>/xcrm/opp_mgt/bootstrap/js/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="<%= request.getContextPath() %>/xcrm/date_js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/xcrm/date_js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
         weekStart: 0,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
         minView: 2,
        forceParse: 0
       
    });
    
	
</script>



<script type="text/javascript">

function check(form) {
	if (document.forms.iForm.logThm.value == "") {
		alert("请输入日志主题！");
		document.forms.iForm.logThm.focus();
		return false;
	}
	if (document.forms.iForm.ctcxDate.value == "") {
		alert("请输入联系日期！");
		document.forms.iForm.ctcxDate.focus();
		return false;
	}
	if (document.forms.iForm.ctcxDetail.value == "") {
		alert("请输入联系详情！");
		document.forms.iForm.ctcxDetail.focus();
		return false;
	}
	if (document.forms.iForm.nextVisitDate.value == "") {
		alert("请输入下次回访日期！");
		document.forms.iForm.nextVisitDate.focus();
		return false;
	}
}



</script>

</body>
</html>