<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="shortcut icon" href="images/favicon.ico" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
	<c:set var="id" value='<%=session.getAttribute("id")%>' />
				<c:set var="fullName" value='<%=session.getAttribute("fullName")%>' />
				
	<div class="">
		<nav class="navbar navbar-expand-md navbar-light bg-color">
			<a href="home?action=homepage" class="navbar-brand"> <img
				src="images/sitelogo.png" height="40" alt="Northern Lottery">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#myBar" aria-controls="myBar" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="myBar">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a href="home?action=homepage"
						class="nav-item nav-link active">Trang chủ</a></li>
					<li class="nav-item"><a href="ticket?action=view"
						class="nav-item nav-link active">Dò Vé số</a></li>
					<li class="nav-item"><a href="home?action=aboutus"
						class="nav-item nav-link active">Về chúng tôi</a></li>
				</ul>

				
				<div id="showLinks">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
						<li class="nav-item"><a class="nav-item nav-link active"
							href="home?action=login">Đăng nhập</a></li>
						<li class="nav-item"><a href="home?action=register"
							class="nav-item nav-link active">Đăng ký</a></li>
					</ul>
				</div>
				
				<div class="d-none" id="showFullName">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle active" data-toggle="dropdown" href="#"
							href="#" role="button" aria-haspopup="true" aria-expanded="true">Xin chào, ${fullName}</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="user?action=viewaccount">Thông
									tin thành viên</a> <a class="dropdown-item"
									href="user?action=changepass&account_id=${id}">Đổi mật khẩu</a>
								<a class="dropdown-item"
									href="user?action=history&account_id=${id}">Lịch sử dò số</a> <a
									class="dropdown-item" href="logout?action=logout">Thoát</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>



<!-- Thu vien cac Script -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>






<!-- Hien thi menu theo dang nhap -->
 
<script>
	var name = '<%= session.getAttribute("fullName") %>';
	if (name == "null") {
		//$('#showFullName').hide();
		$('#showLinks').show();
	} else {
		//$('#showFullName').show();
		//$('#showLinks').hide();
		
		$('#showFullName').removeClass("d-none");
		$('#showLinks').hide();
	}
</script>


<!-- Hien thi menu theo role -->
<script>
	var role = '<%= session.getAttribute("role") %>';
	if (role == "admin") {
		$('#adminRole').show();
		$('#userRole').hide();
	} else if (role == "user"){
		$('#adminRole').hide();
		$('#userRole').show();
	} else {	
		$('#adminRole').hide();
		$('#userRole').hide();
	}
</script>
 
	 
</body>
</html>