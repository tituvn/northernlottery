<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page import="dao.DAOAccount" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản trị người dùng</title>

<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!--  CSS style -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="shortcut icon" href="images/favicon.ico" />

<!-- Nhap script kiem tra thong tin  -->
<script src="script/validate.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<c:import url="/views/header.jsp" />
		</div>
		<div class="row mt-4">
			<div class="col-lg-3">
				<c:import url="/WEB-INF/admin/leftbar_admin.jsp" />
			</div>

			<div class="col-lg-9">
				<div class="table-responsive">
					<div class="text-center"
						style="text-transform: uppercase; color: red;">
						<b>Danh sách thành viên</b>
					</div>
					<hr>

					<!--Tim kiem thong tin nguoi dung-->
					<div class="row">
						<div class="row">
							<form action="accounts" method="POST" class="form-row">
								<input type="hidden" name="action" value="search" />
								<div class="form-group col-md-5">
									Username: <input type="text" class="form-control" id="username"
										name="username" value=""/>
								</div>
								<div class="form-group col-md-5">
									Số điện thoại: <input type="text" id="phone" name="phone"
										class="form-control" pattern="[0-9]+"
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" value=""/>
								</div>
								<div class="form-group col-md-2">
									<br />
									<button class="btn btn-primary" style="width: 100%;"
										type="submit" id="search" disabled>Tìm kiếm</button>
								</div>
							</form>
						</div>
						<div id="content" class="text-danger d-none">
							<br />
							<p>Không tìm được kết quả</p>
						</div>
					</div>

					<!--Hien thi thong tin nguoi dung -->
					<div class="">
						<div id="mainTable">
							<table class="table-responsive table-sm table-hover">
								<div class="text-truncate">
								<tr>
									<th class="">Id</th>
									<th class="">Username</th>
									<th class="">Status</th>
									<th class="col-2">Họ và tên</th>
									<th class="col-2">Email</th>
									<th class="">Điện thoại</th>
									<th class="">Vai trò</th>
									<th class="">Xác thực</th>
									<th class=""></th>
									<th class=""></th>
									<th class=""></th>
								</tr>
						</div>

						<c:forEach items="${accountList}" var="acc">
							<div class="text-truncate">
								<tr>
									<td class="">${acc.getAccount_id()}</td>
									<td class="">${acc.getUsername()}</td>
									<td class=""><c:set var="onl"
											value="${acc.getOnline()}" /> <c:choose>
											<c:when test="${(onl).equals('1')}">
												<span class="text-primary">Active</span>
											</c:when>
											<c:when test="${(onl).equals('0')}">
												<span class="text-danger">Offline</span>
											</c:when>
											<c:otherwise>
												<span>---</span>
											</c:otherwise>
										</c:choose></td>
									<td class="col-2">${acc.getFullName()}</td>
									<td class="col-2">${acc.getEmail()}</td>
									<td class="">${acc.getPhone()}</td>
									<td class="">${acc.getRole()}</td>
									<td class=""><c:set var="veri"
											value="${acc.getVerified()}" /> <c:choose>
											<c:when test="${(veri).equals('1')}">
												<span class="text-primary">OK</span>
											</c:when>
											<c:when test="${(veri).equals('0')}">
												<span class="text-danger">---</span>
											</c:when>
											<c:otherwise>
												<span>---</span>
											</c:otherwise>
										</c:choose></td>
									<td><a
										href="accounts?action=edit&account_id=${acc.getAccount_id()}">
											<img style="width: 15px" src="images/edit.png" />
									</a></td>
									<td><a
										href="accounts?action=resetPass&account_id=${acc.getAccount_id()}">
											<img style="width: 15px" src="images/reset.png" />
									</a></td>
									<td><img style="width: 15px" src="images/delete.png"
										onclick="showMess(${acc.getAccount_id()})"
										onMouseOver="this.style.cursor='pointer'" /></td>
								</tr>
							</div>
						</c:forEach>
					</table>
						
						<nav class="mt-4" aria-label="">
								<ul class="pagination justify-content-center">
									<li class="page-item" id="previousPage"><a
										class="page-link"
										href="accounts?action=pagination&index=${index-1}&username=${username}&phone=${phone}"
										tabindex="-1">Trước</a></li>
									<li class="page-item"><a class="page-link" tabindex="-1">${totalAccounts}
											Tài khoản - Trang ${index + 1}/${totalPages}</a></li>
									<li class="page-item" id="nextPage"><a class="page-link"
										href="accounts?action=search&index=${index+1}&username=${username}&phone=${phone}">Sau</a></li>
								</ul>
							</nav>

					</div>
					<div class="d-none">
						<form id="deleteConfirm" action="accounts" method="post">
							<input type="hidden" name="action" value="delete" /> <input
								type="hidden" id="deleteId" name="account_id" value="" />
						</form>
					</div>
				</div>
			</div>
		</div>
	
	<div class="">
		<c:import url="/views/footer.jsp" />
	</div>
</div>	
	


	<!-- Cac noi dung lien quan toi script va thong bao khong the hien trong html-->
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

<!-- Popup confirm xoa du lieu-->
<div class="modal fade" id="deleteItem" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Xác nhận</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Bạn thật sự muốn xóa id = <span id="idToDelete"></span> ?
        <input type="hidden" id="deleteDelete" value=""/>
      </div>
      <div class="row modal-footer">
        <button type="button" class="btn btn-primary" onclick="deleteItem()" style="width:25%">Đồng ý</button>
        <button type="button" class="btn btn-info" data-dismiss="modal" style="width:25%">Hủy</button>
      </div>
    </div>
  </div>
</div>


<!-- Thu vien cac Script -->	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	
	
<div id="info"></div>
	<!-- An nut tim kiem neu khong co input -->
	<script>
	$("input[name=username]").change(function() { 
		if($(this).val() == "") {        
	        $("#search").prop("disabled", true);
	    } else {
	        $("#search").prop("disabled", false);
	    }
	});
	
	$("input[name=phone]").change(function() { 
		if($(this).val() == "") {        
		        $("#search").prop("disabled", true);
		    } else {
		        $("#search").prop("disabled", false);
		    }
		});
</script>

	<!-- Hien thi thong bao neu khong co ket qua tuong ung -->
	<script>
	var accList = ${accountList};
	if (accList == "") {
		//$("#content").text("Không tìm được kết quả");
		$("#content").removeClass("d-none");
		$("#content").addClass("d-block");
		$("#mainTable").hide();
	}
</script>

<!--Xac nhan xoa 1 phan tu -->
	<script>
	function showMess(id) {
		var idToDelete = id;
		$("#idToDelete").text(idToDelete);
		localStorage.setItem('idToDelete', idToDelete);
		$('#deleteItem').modal('show');
	}
	</script>
	
<script>
	function deleteItem() {
		var deleteId = localStorage.getItem('idToDelete');
		$("#deleteId").val(deleteId);
		$("#deleteConfirm").submit();
	}
</script>

<!-- Thong bao -->
<script>
	var query = '${queryResult}';
	if (query != ""){
		$('#inform').modal('show');
	}
</script>

<!-- deactive nut phan trang -->
<script>
	var index = ${index};
	var totalPages = ${totalPages};
	
	if (index == 0) {
		$("#previousPage").addClass("disabled");
	}
	
	if ((index+1) == totalPages) {
		$("#nextPage").addClass("disabled");
	}
	
</script>

</body>
</html>