<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.DAOAccount" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" type="text/css" href="css/registerform.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="shortcut icon" href="images/favicon.ico" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- Javascript -->
<script src="script/validate.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<c:import url="/views/header.jsp" />
		</div>
		<div class="row">
			<div class="col-md-3 mt-4">
				<c:import url="/views/leftbar.jsp" />
			</div>

			<div class="col-md-9">
				<div class="register">
					<div class="row">
						<div class="col-md-3 register-left">
							<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
							<h4>Đăng nhập để sử dụng các tính năng thú vị hơn!</h4>
							<a href="home?action=login"><input type="submit" name=""
								value="Đăng nhập" /></a><br />
						</div>
						<div class="col-md-9 register-right">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<h3 class="register-heading">Đăng ký thành viên</h3>
									<form action="register" method="post">
										<input type="hidden" name="action" value="doRegister"/>
										<div class="row register-form">
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Họ và Tên" name="fullName"
														value="${account.fullName}" required
														oninvalid="validateRegister(this)"
														oninput="validateRegister(this)" />
												</div>
												<div class="form-group">
													<input type="text" class="form-control" placeholder="Email"
														name="email" value="${account.email}" id="email" required
														oninvalid="checkEmail()" oninput="checkEmail()" />
												</div>
												
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Tên đăng nhập" name="username"
														value="${account.username}" required
														oninvalid="validateRegister(this)" />
												</div>
												<div class="form-group">
													<input type="text" minlength="10" maxlength="10"
														class="form-control" placeholder="Điện thoại" name="phone"
														value="${account.phone}" pattern="[0-9]+" required
														oninvalid="validateRegister(this)" />
												</div>
												<!-- 
												<div class="form-group">
													<input type="password" class="form-control" id="password"
														placeholder="Mật khẩu" name="password" value="" required
														oninvalid="checkPattern()" oninput="checkPattern()" />
												</div>
												<div class="form-group">
													<input type="password" class="form-control"
														id="re-password" placeholder="Nhập lại mật khẩu"
														name="re-password" value="" required
														oninvalid="checkRepass()" oninput="checkRepass()" />
												</div>
												 -->
												<button type="submit" class="btnRegister">Đăng ký</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="row">
				<c:import url="/views/footer.jsp" />
			</div>
		</div>

		<!-- Cac noi dung lien quan toi script va thong bao khong the hien trong html-->
		<!-- Popup thong bao -->
		<div class="modal fade" id="inform" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thông báo</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">${queryResult}</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Thu vien cac Script -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>


		<!-- Hien thi thong bao cap nhat du lieu -->
		<script>
		var query = '${queryResult}';
		if (query != "") {
			$("#inform").modal("show");
		}
	</script>

		<!-- Kiem tra tinh hop le cua email -->
		<script>
		function checkEmail(){	
			var email = $("#email").val().toLowerCase();
			
			const regex = /^[A-Za-z0-9._%+-]+@([A-Za-z0-9-]+\.)+([A-Za-z0-9]{2,4})$/;
			var result = regex.test(email);
			var length=email.length;
			
			//$("#info").text(email +" "+result +" " +length);
				
			if (result) {
				document.getElementById("email").setCustomValidity('');
			} else {
				document.getElementById("email").setCustomValidity(
						"Email có định dạng: name@domain.xxx");
			}
		};
	</script>

		<!-- Kiem tra tinh hop le cua password nhap vao -->
		<script>
		function checkPattern(){	
			var password = $("#password").val();
			
			const regex = /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
			var checkPass = regex.test(password);
			
			//$("#info").text(password +" "+result +" " +length);
			if (checkPass) {
				document.getElementById("password").setCustomValidity('');
				return true;
			} else {
				document.getElementById("password").setCustomValidity("Mật khẩu dài ít nhất 8 kí tự, bao gồm: \n"
						+"- ít nhất 1 chữ thường, \n"
						+"- ít nhất 1 chữ Hoa,\n"
						+"- ít nhất 1 số");
				return false;
			}
		};
	</script>

		<!-- Kiem tra retype password -->
		<script>
		function checkRepass(){
			var password1 = $("#password").val();
			var password2 = $("#re-password").val();
			
			//$("#info").text(password1 +" " +password2);
			if (password2=='') {
				document.getElementById("re-password").setCustomValidity("Vui lòng nhập thông tin");
			} else if (password2 == password1) {
				document.getElementById("re-password").setCustomValidity('');
			} else {
					document.getElementById("re-password").setCustomValidity("Mật khẩu không khớp");
				}
		};
	</script>
</body>
</html>