<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.DAOAccount" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>


<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

			<div class=" col-md-9">
				<div class="">
					<div class="text-uppercase text-center text-danger">
						<h6 class="">Đổi mật khẩu</h6>
						<hr>
					</div>
					<div class="text-center text-info">${firstMessage}</div>
					<div class="">
						<form action="user" method="POST">
							<div class="row d-flex justify-content-center">
								<input type="hidden" name="account_id" value="${account_id}"/>
								<div class="row col-7">
									<label class="col-form-label" for="oldPass">Mật khẩu
										đang dùng</label> <input type="password" class="form-control" id="oldPass"
										placeholder="" name="oldPass" value="" required
										oninvalid="checkOldPass()" oninput="checkOldPass()" />
								</div>
								<div class="row col-7">
									<label class="col-form-label" for="newPassword">Mật
										khẩu mới</label> <input type="password" class="form-control"
										id="newPassword" placeholder="" name="newPassword" value=""
										required oninvalid="checkNewPass()" oninput="checkNewPass()" />
								</div>

								<div class="row col-7">
									<label class="col-form-label" for="newPassword">Nhập
										lại Mật khẩu mới</label> <input type="password" class="form-control"
										id="re-newPassword" placeholder="" name="re-newPassword"
										value="" required oninvalid="checkRepass()"
										oninput="checkRepass()" />
								</div>
								<div class="row col-7 text-sm text-danger text-center">${error}</div>
								<div class="row col-7 mt-3">
									<button type="submit" class="btn btn-sm btn-primary" name="action" value="changePassConfirm">Đổi mật khẩu</button>
								</div>
							</div>
						</form>
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


<!-- Hien thi thong bao cap nhat du lieu -->
<script>
	var query = '${queryResult}';
	if (query != "") {
		$("#inform").modal("show");
	}
</script>

<!-- Kiem tra tinh hop le cua password cu nhap vao -->
<script>
	function checkOldPass(){	
		var password = $("#oldPass").val();
			
		const regex = /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
		var checkPass = regex.test(password);
			
		//$("#info").text(password +" "+result +" " +length);
		if (checkPass) {
			document.getElementById("oldPass").setCustomValidity('');
			return true;
		} else {
			document.getElementById("oldPass").setCustomValidity("Mật khẩu dài ít nhất 8 kí tự, bao gồm: \n"
				+"- ít nhất 1 chữ thường, \n"
				+"- ít nhất 1 chữ Hoa,\n"
				+"- ít nhất 1 số");
		return false;
		}
	};
</script>

<!-- Kiem tra tinh hop le cua password moi nhap vao -->
<script>
	function checkNewPass(){	
		var password = $("#newPassword").val();
			
		const regex = /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
		var checkPass = regex.test(password);
			
		//$("#info").text(password +" "+result +" " +length);
		if (checkPass) {
			document.getElementById("newPassword").setCustomValidity('');
			return true;
		} else {
			document.getElementById("newPassword").setCustomValidity("Mật khẩu dài ít nhất 8 kí tự, bao gồm: \n"
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
		var password1 = $("#newPassword").val();
		var password2 = $("#re-newPassword").val();
			
			//$("#info").text(password1 +" " +password2);
		if (password2=='') {
				document.getElementById("re-newPassword").setCustomValidity("Vui lòng nhập thông tin");
			} else if (password2 == password1) {
				document.getElementById("re-newPassword").setCustomValidity('');
			} else {
					document.getElementById("re-newPassword").setCustomValidity("Mật khẩu không khớp");
				}
		};
	</script>
</body>
</html>