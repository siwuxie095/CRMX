<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑联系人</title>

<link href="<%= request.getContextPath() %>/xcrm/css/main.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/xcrm/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/xcrm/js/distpicker.data.js"></script>
<script src="<%= request.getContextPath() %>/xcrm/js/distpicker.js"></script>

</head>
<body>
<%@ include file="/xcrm/bootstrap/nav.jsp" %>

<%

	String ctcId=request.getParameter("ctcId");
	String ctcName=request.getParameter("ctcName");
	String custName=request.getParameter("custName");

%>






<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span6">
		<div class="btn-group table-bordered">
		 <a  href="<%= request.getContextPath() %>/ctc_info_queryAll.action" class="btn"> <span class="add-on"><i class="icon-arrow-left"></i></span>&nbsp;返回列表</a>
		 <a  href="<%= request.getContextPath() %>/xcrm/ctc_mgt/add_ctc_info.jsp" class="btn"> <span class="add-on"><i class="icon-plus"></i></span>&nbsp;新建</a>
		 </div>
		 <br/><br/>
				  <form class="form-horizontal"
			action="<%=request.getContextPath()%>/ctc_info_modify.action"
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
								<input name="ctcId" value="<%= ctcId %>" type="text" readonly />
							</div>
						</td>
					</tr>
						<tr class="warning">
						<td>
							<p class="text-right">姓名</p>
						</td>
						<td>
							<div class="input-append">
								<input name="ctcName" value="<%= ctcName %>" type="text" readonly />
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
								<input name="custName" value="<%= custName %>" type="text" readonly />
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
					    <button class="btn" type="submit" onclick="return check(this);">保存</button> &nbsp;&nbsp;&nbsp; <a href="<%= request.getContextPath() %>/xcrm/ctc_mgt/qry_all_ctc_info.jsp"><button class="btn" type="button">取消</button></a>
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
	}
	
	
	
	</script>
	
</body>
</html>