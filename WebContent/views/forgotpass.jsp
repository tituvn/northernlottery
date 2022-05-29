<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>

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
			<div class="col-md-2">
				<c:import url="/views/leftbar.jsp" />
			</div>

			<div class="row col-md-10">
						<div class="row justify-content-center" id="forgotPassword">
							<div class="col-md-6">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="text-center">
											<h4>
												<i class="fa fa-lock fa-4x"></i>
											</h4>
											<h2 class="text-center">Quên mật khẩu?</h2>
											<p>Bạn có thể yêu cầu cấp lại mật khẩu tại đây.</p>
											<div class="panel-body">
												<form class="form" action="accounts" method="post">
													<input type="hidden" name="action" value="resetByEmail"/>
													<fieldset>
														<div class="form-group">
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="glyphicon glyphicon-envelope color-blue"></i></span> 
																<input id="email" placeholder="Nhập email"
																	class="form-control" type="email" name="email"
																	oninvalid="checkEmail()" required>
															</div>
														</div>
														<div class="form-group">
															<input class="btn btn-lg btn-primary btn-block"
																value="Gửi mật khẩu mới" type="submit">
														</div>
													</fieldset>
												</form>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row justify-content-center d-none mt-3" id="error">
							<br/>
							<h5 class="text-center">${queryResult}</h5>
						</div>
			</div>

		</div>

		<div class="row">
			<c:import url="/views/footer.jsp" />
		</div>

	</div>
	
	<div>${queryResult}</div>
	
	
	<!--popup thong bao -->
	<script>
		var queryResult = '${queryResult}';
		if (queryResult != '') {
			$("#error").removeClass("d-none");
			$("#forgotPassword").addClass("d-none");
		}
	</script>

	<!-- Kiem tra tinh hop le cua email -->
	<script>
		function checkEmail() {
			var email = $("#email").val().toLowerCase();

			const regex = /^[A-Za-z0-9._%+-]+@([A-Za-z0-9-]+\.)+([A-Za-z0-9]{2,4})$/;
			var result = regex.test(email);
			var length = email.length;

			//$("#info").text(email +" "+result +" " +length);

			if (result) {
				document.getElementById("email").setCustomValidity('');
			} else {
				document.getElementById("email").setCustomValidity(
						"Email có định dạng: name@domain.xxx");
			}
		};
	</script>

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

</body>
</html>
