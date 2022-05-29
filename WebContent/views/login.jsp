<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

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
		<div class="row mt-4">
			<div class="col-md-3">
				<c:import url="/views/leftbar.jsp" />
			</div>

			<div class="row col-md-9">
				<div class="text-center">
					<div>
						<h5 class="">
							Đăng nhập hoặc <a href="home?action=register">Đăng kí</a>
						</h5>
					</div>
					<div class="nav justify-content-center mt-4">
						<div class="nav-item col-md-3">
							<a href="#" class="btn btn-primary" style="width: 100%;"> <i
								class="fa fa-facebook"></i> <span class="hidden-xs">Facebook</span>
							</a>
						</div>
						<div class="nav-item col-md-3">
							<a href="#" class="btn btn-info" style="width: 100%;"> <i
								class="fa fa-twitter visible-xs"></i> <span class="hidden-xs">Twitter</span>
							</a>
						</div>
						<div class="nav-item col-md-3">
							<a href="#" class="btn btn-danger" style="width: 100%;"> <i
								class="fa fa-google-plus visible-xs"></i> <span
								class="hidden-xs">Google+</span>
							</a>
						</div>
					</div>

					<div class="justify-content-center">
						<br /> <span class="">Hoặc</span>
					</div>

					<div class="row justify-content-center mt-3">
						<div class="col-md-6">
							<form class="form-group" action="login" autocomplete="off"
								method="post">
								<div class="input-group">
									<input type="text" class="form-control" name="username"
										placeholder="Tên đăng nhập" oninvalid="validateRegister(this)" required>
								</div>

								<div class="input-group">
									<input type="password"
										class="form-control" name="password" placeholder="Mật khẩu" 
										id="password" oninvalid="checkPattern()" required>
								</div>
								<span class="help-block text-danger" id="queryResult"></span>

								<div class="mt-3">
									<label class="checkbox"> <input type="checkbox"
										value="yes" name="remember"> Ghi nhớ đăng nhập
									</label>
								</div>
								<button class="btn btn-primary" style="width: 100%"
									type="submit">Đăng nhập</button>
							</form>
						</div>
					</div>
					<div class="row ">
						<a href="home?action=forgotpass">Quên mật khẩu?</a>
					</div>
				</div>
			</div>





		</div>

		<div class="row">
			<c:import url="/views/footer.jsp" />
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

	<!-- Kiem tra tinh hop le cua password nhap vao -->
	<script>
		function checkPattern() {
			var password = $("#password").val();

			const regex = /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
			var checkPass = regex.test(password);

			//$("#info").text(password +" "+result +" " +length);
			if (checkPass) {
				document.getElementById("password").setCustomValidity('');
				return true;
			} else {
				document.getElementById("password").setCustomValidity(
						"Mật khẩu dài ít nhất 8 kí tự, bao gồm: \n"
								+ "- ít nhất 1 chữ thường, \n"
								+ "- ít nhất 1 chữ Hoa,\n" + "- ít nhất 1 số");
				return false;
			}
		};
	</script>
	
	<script>
		var queryResult = '${queryResult}';
		if (queryResult != ''){
			$("#queryResult").text(queryResult);
		}
	</script>
</body>
</html>