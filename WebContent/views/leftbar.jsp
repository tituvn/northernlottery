<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ page import="java.util.*" %>
<%@ page import="dao.DAOCompany" %>   
<%@ page import="model.Company" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhập kết quả xổ số</title>

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
<!--  Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!--  CSS style -->
<link rel="stylesheet" type="text/css" href="main.css">
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body>

	<% List<Company> companies = new DAOCompany().getCompanyList(); %>
	<c:set var="role" value='<%= session.getAttribute("role") %>'/>

	<div class="list-group">
		<ul class="list-group">
			<c:if test="${role =='admin'}">
				<a class="text-decoration-none" href="admin?action=adminHome">
				<li class="list-group-item bg-info list-group-item list-group-item-action">Admin Home</li></a>
			</c:if>
			<li class="list-group-item bg-info" data-toggle="collapse"
				data-target="#company">Xổ số miền Bắc</li>
			<li>
				<div id="company">
					<%
					for (int i = 0; i < companies.size(); i++) {
					%>
					<a href="index?action=getProvinceResult&company_id=<%=companies.get(i).getCompany_id()%>"
						class="list-group-item list-group-item-action"> <%=companies.get(i).getCompany_province()%></a>
					<%
					}
					%>
				</div>
			</li>
		</ul>
	</div>
	<div>
		<c:import url="/calendar/calendar.html"/>
	</div>
	 	
	

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>