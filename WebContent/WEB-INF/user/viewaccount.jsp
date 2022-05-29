<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.*" %>
<%@ page import="dao.DAOAccount" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản trị người dùng</title>

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
			<div class="col-lg-3">
				<c:import url="/views/leftbar.jsp" />
			</div>

			<div class="col-lg-9">
				<div>
					<p class="text-uppercase text-danger text-center">Thông tin thành viên</p>
					<hr>
					<form class="" action="user" method="post">
						<input type="hidden" name="action" value="updateInfo" />
						<input type="hidden" name="account_id" value="${acc.getAccount_id()}"/>
						<div>
							<div class="form-group row">
								<label class="col-form-label col-3" for="username">Tên
									đăng nhập</label>
								<div class="col-9">
									<input class="form-control" type="text"
										value="${acc.getUsername()}" name="username" readonly required oninvalid="validateInfo(this)"/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-3" for="fullName">Họ và
									tên</label>
								<div class="col-9">
									<input class="form-control" type="text"
										value="${acc.getFullName()}" name="fullName" required oninvalid="validateInfo(this)"/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-3" for="email">Email</label>
								<div class="col-9">
									<input class="form-control" type="text"
										value="${acc.getEmail()}" name="email" readonly required oninvalid="validateInfo(this)"/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-3" for="phone">Điện
									thoại</label>
								<div class="col-9">
									<input class="form-control" type="text"
										value="${acc.getPhone()}" name="phone" required oninvalid="validateInfo(this)"/>
								</div>
							</div>
							
							<!-- Lay danh sach vai tro -->
							<% List<String> roleList = new DAOAccount().getRoleList(); %>
							<c:if test='${acc.getRole() == "admin"}'>
								<div class="form-group row" id="roleSelection">
									<label class="col-form-label col-3" for="role">Vai trò</label>
									<div class="col-9">
										<select class ="form-control" name="role" id="role">
											<%
											for (int i = 0; i < roleList.size(); i++) {
											%>
											<option value="<%=roleList.get(i)%>"
												id="<%=roleList.get(i)%>">
												<%=roleList.get(i)%>
											</option>
											<%}%>
										</select>
									</div>
								</div>
							</c:if>

							<div class="row" style="float: right">
								<div class="col">
									<button class="btn btn-sm btn-primary" style="width: 100%"
										type="submit">Lưu</button>
								</div>
								<div class="col">
									<a href="user?action=changepass&account_id=${acc.getAccount_id()}"><b><input
											class="btn btn-sm btn-info"
											style="width: 100%; color: white;" value="Đổi mật khẩu"
											readonly /></b></a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<c:import url="/views/footer.jsp" />
		</div>
	</div>


<!-- Popup thong bao du lieu-->
<div class="modal fade" id="inform" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Thông báo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ${queryResult}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal" style="width:25%">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Thong bao -->
<script>
	var query = '${queryResult}';
	if (query != ""){
		$('#inform').modal('show');
	}
</script>

<!-- Hien thi phan lua chon vai tro --> 
<script>
	var roleSelect = '${acc.getRole()}';
	$("#"+roleSelect+"").attr('selected','selected');
</script>
	
	
</body>
</html>