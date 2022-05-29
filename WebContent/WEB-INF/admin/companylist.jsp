<%@ page import="java.util.*"%>
<%@ page import="model.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Công ty xổ số</title>

<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--  Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

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
				<!-- Chinh sua thong tin cong ty xo so -->
				<div id="editCompany" class="mt-3">
					<c:if test="${command ==  'true' }">
						<div class="text-uppercase text-center text-danger">
							<b>Chỉnh sửa thông tin</b>
						</div>
						<form action="companies" method="POST">
							<div class="table-responsive">
								<input type="hidden" name="action" value="editCompany" />
								<table class="table-sm table-responsive">
									<tr>
										<th class="text-center text-nowrap">Mã công ty</th>
										<th class="text-center text-nowrap">Tên công ty</th>
										<th class="text-center text-nowrap">Tỉnh / Thành phố</th>
										<th class="text-center text-nowrap">Địa chỉ</th>
										<th></th>
									</tr>
									<tr>
										<td class="col-1"><input class="form-control" type="text" name="company_id"
											value="${company.getCompany_id()}"
											readonly /></td>
										<td><input class="form-control" type="text" name="company_name"
											value="${company.getCompany_name()}"/></td>
										<td><input class="form-control" type="text" name="company_province"
											value="${company.getCompany_province()}" /></td>
										<td><input class="form-control" type="text" name="company_address"
											value="${company.getCompany_address()}"/></td>
										<td class="col-1"><button class="btn-sm" type="submit">
												<img class="img-fluid" src="images/save.png" alt="Lưu" />
											</button></td>
									</tr>
								</table>
								<br />
							</div>
						</form>
					</c:if>
				</div>

				<!-- Them moi cong ty xo so -->
				<div id="addNewCompany" style="display: none" class="mt-3">
					<div class="text-uppercase text-danger text-center">
						<b>Thêm Công ty xổ số</b>
					</div>
					<form action="companies" method="POST">
						<div class="table-responsive">
							<input type="hidden" name="action" value="addCompany" />
							<table class="table-sm">
								<tr>
									<th class="text-center text-nowrap col-3">Tên công ty</th>
									<th class="text-center text-nowrap col-3">Tỉnh / Thành phố</th>
									<th class="text-center text-nowrap col-4">Địa chỉ</th>
								</tr>
								<tr>
									<td><input class="form-control" type="text" name="company_name"
										required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" /></td>
									<td><input class="form-control" type="text" name="company_province"
										required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" /></td>
									<td><input class="form-control" type="text" name="company_address"
										required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" /></td>
									<td class="col-1"><button class="btn-sm" type="submit">
											<img class="img-fluid" style="text-align: left; width:40%"
												src="images/save.png" alt="Lưu" />
										</button></td>
								</tr>
							</table>
							<br />
						</div>
					</form>
				</div>

				<!-- Hien thi danh sach cong ty xo so  -->
				<div class="table-responsive">
					<div class="text-center text-uppercase text-danger">
						<b>Danh sách các công ty xổ số</b>
					</div>
					<hr>
					<div>
						<button class="btn btn-primary btn-sm col-2" style="float: right;"
							onclick="addCompany()">Thêm mới</button>
					</div>
					
					<table class="table-responsive table-sm table-hover">
						<tr>
							<th>ID</th>
							<th>Tỉnh / Thành </th>
							<th>Tên Công ty</th>
							<th>Địa chỉ</th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach items="${listCompanies}" var="row">
						<tr>
							<td>${row.getCompany_id()}</td>
							<td>${row.getCompany_province()}</td>
							<td>${row.getCompany_name()}</td>
							<td>${row.getCompany_address()}</td>
							<td class="col-1"><a
								href="companies?action=getCompany&company_id=${row.company_id}"><img
								style="width: 30%; text-align: left" src="images/edit.png"
								alt="Sửa" /></a></td>
							<td class="col-1"><img style="width: 30%; text-align: left" src="images/delete.png"
								alt="Xóa" onclick="confirmDelete(${row.company_id})"
								onMouseOver="this.style.cursor='pointer'" /></td>
						</tr>
						</c:forEach>
					</table>
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

	<!--  Show / hide area of input new company or searching -->
	<script>
	function addCompany() {
		document.getElementById("addNewCompany").style="display:block";
		document.getElementById("editCompany").style="display:none";
		document.body.scrollTop = 0; 
		document.documentElement.scrollTop = 0;
	}
</script>


	<!-- Modal hien thi thong bao confirm xoa 1 du lieu-->
	<div class="modal fade" id="deleteOneItem" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Xác nhận xóa</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					Bạn thật sự muốn xóa id : <span id="idToDelete"></span> ?
				</div>
				<div class="row modal-footer">
					<form action="companies" id="delete" method="POST">
						<input type="hidden" name="action" value="delete" /> <input
							type="hidden" name="company_id" id="companyId" value="" />
						<button type="submit" class="btn btn-primary" style="width: 25%">Đồng
							ý</button>
						<button type="button" class="btn btn-info" data-dismiss="modal"
							style="width: 25%">Hủy</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Confirmation before deleting company -->
	<!--Xac nhan xoa 1 phan tu -->
	<script>
	function confirmDelete(result_id) {
	$("#deleteOneItem").modal("show");
	$("#idToDelete").text(result_id);
	$("#companyId").val(result_id);
	}
</script>

	<!-- Hien thi thong bao cap nhat du lieu -->
	<script>
	var query = '${queryResult}';
	if (query != "") {
		$("#inform").modal("show");
	}
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>