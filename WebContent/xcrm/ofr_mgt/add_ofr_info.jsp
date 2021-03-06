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
<title>新建报价单</title>
 
<%-- <link href="<%= request.getContextPath() %>/xcrm/opp_mgt/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">  --%> 
<link href="<%= request.getContextPath() %>/xcrm/date_css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%
	Session sessionx=HibernateUtils.getCurrentSession();
	Transaction tx=sessionx.beginTransaction();
	
	OfrInfoDao ofrInfoDao=new OfrInfoDaoImpl();
	
	List<Object> list=ofrInfoDao.getAllId();
	Object[] objArr=list.toArray();
	String[] str=new String[list.size()];
	
	for(int i=0;i<list.size();i++){
		str[i]=objArr[i].toString();
	}
	
	
	
	CustInfoDao custInfoDao=new CustInfoDaoImpl();
	
	List<Object> listx=custInfoDao.getAllName();
	Object[] objArrx=listx.toArray();
	String[] strx=new String[listx.size()];
	
	for(int i=0;i<listx.size();i++){
		strx[i]=objArrx[i].toString();
	}
	
	
	CtcInfoDao ctcInfoDao=new CtcInfoDaoImpl();
	
	List<Object> listy=ctcInfoDao.getAllName();
	Object[] objArry=listy.toArray();
	String[] stry=new String[listy.size()];
	
	for(int i=0;i<listy.size();i++){
		stry[i]=objArry[i].toString();
	}
	
	
	OppInfoDao oppInfoDao=new OppInfoDaoImpl();
	
	List<Object> listz=oppInfoDao.getAllId();
	Object[] objArrz=listz.toArray();
	String[] strz=new String[listz.size()];
	
	for(int i=0;i<listz.size();i++){
		strz[i]=objArrz[i].toString();
	}
	
	

	int numbera=1;
	int numberb=1;
	int numberc=1;

%>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		    <a  href="<%= request.getContextPath() %>/xcrm/ofr_mgt/qry_all_ofr_info.jsp" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>	
		</div>
		<br/><br/>
		  <form class="form-horizontal"
			action="<%=request.getContextPath()%>/ofr_info_add.action"
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
							<p class="text-right">报价单号</p>
						</td>
						<td>
							<div class="input-append">
							
							
							<%
							String ofrId="";
							boolean flagx=false;
							for(int i=1;i<1000;i++){
								
								if(i<10){
									ofrId="OFR00"+i;
								}
								if(i>=10 && i<100){
									ofrId="OFR0"+i;
								}
								if(i>=100 && i<1000){
									ofrId="OFR"+i;
								}
								
								if(str.length==0){
									break;
								}else{
									for(int j=0;j<str.length;j++){
										if(ofrId.equals(str[j])){
											break;
										}
										
										while(j==str.length-1){
											if(ofrId!=str[j]){
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
							
							
							
								<input name="ofrId" value="<%= ofrId %>" type="text" readonly />
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td>
							<p class="text-right">报价单名</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ofrName" type="text" />			
							</div> 
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">客户名称</p>
						</td>
					    <td>
							<div class="input-append">
								<select name="custName" class="form-control"> 
								<% for(int i=0;i<strx.length;i++){ %>
								<option value="<%= strx[i]%>"><%out.print("["+numbera+"] "+strx[i]); %></option> 
								<% numbera++; } %>
								</select>
							</div>				
						</td>
					</tr>	    
					<tr class="error">
						<td>
							<p class="text-right">联系人</p>
						</td>
						<td>
							<div class="input-append">
								<select name="ctcName" class="form-control"> 
								<% for(int i=0;i<stry.length;i++){ %>
								<option value="<%= stry[i]%>"><%out.print("["+numberb+"] "+stry[i]); %></option> 
								<% numberb++; } %>
								</select>
							</div>			
						</td>		
					</tr>
								
					<tr class="info">
						<td>
							<p class="text-right">销售机会</p>
						</td>
						<td>
							<div class="input-append">
								<select name="oppId" class="form-control"> 
								<% for(int i=0;i<strz.length;i++){ %>
								<option value="<%= strz[i]%>"><%out.print("["+numberc+"] "+strz[i]); %></option> 
								<% numberc++; } %>
								</select>
							</div>			
						</td>
					</tr>
					
					<tr class="warning">
						<td>
							<p class="text-right">报价单状态</p>
						</td>
						<td>
							<select name="ofrStatus" class="form-control"><option value="已创建">已创建</option><option value="已审批">已审批</option><option value="已拒绝">已拒绝</option></select>							
						</td>
					</tr>
					<tr class="success">
						<td>
							<p class="text-right">报价单有效期</p>
						</td>
						<td>
							 <div class="input-append date form_datetime" data-date="" 
              				  data-date-format="yyyy MM dd" data-link-format="yyyy-mm-dd" data-link-field="dtp_input1">
                  			  <input  value=""  size="16" type="text" readonly>
                 			   <span class="add-on"><i class="icon-remove"></i></span>
								<span class="add-on"><i class="icon-calendar"></i></span>
              				  </div>
                			<input type="hidden" id="dtp_input1" name="ofrVali" value="" />
						</td>
					</tr>
					<tr class="error">
						<td>
							<p class="text-right">整单折扣</p>
						</td>
						<td>
							<div class="input-append">
								<input name="saleDisc" type="text" />			
							</div> 
						</td>
					</tr>
					<tr class="info">
						<td>
							<p class="text-right">合计</p>
						</td>
						<td>
							<div class="input-append">
								<input name="saleSum" type="text" />			
							</div> 
						</td>
					</tr>
									
				</tbody>	
					</table>
					
					 <div class="control-group">
						<div class="controls">
							 <button class="btn" type="submit" onclick="return check(this);">保存</button> &nbsp;&nbsp; <a href="<%= request.getContextPath() %>/xcrm/ofr_mgt/qry_all_ofr_info.jsp"><button class="btn" type="button">取消</button></a>
						</div>
					</div>
			</form>
			</div>
			<div class="span3">
			</div>

		</div>
	</div>
</body>


	
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
	if (document.forms.iForm.ofrName.value == "") {
		alert("请输入报价单名！");
		document.forms.iForm.ofrName.focus();
		return false;
	}
	if (document.forms.iForm.ofrVali.value == "") {
		alert("请输入报价单有效期！");
		document.forms.iForm.ofrVali.focus();
		return false;
	}
	if (document.forms.iForm.saleDisc.value == "") {
		alert("请输入整单折扣！");
		document.forms.iForm.saleDisc.focus();
		return false;
	}
	if (document.forms.iForm.saleSum.value == "") {
		alert("请输入合计！");
		document.forms.iForm.saleSum.focus();
		return false;
	}
}



</script>


</html>