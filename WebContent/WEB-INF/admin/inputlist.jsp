<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page import="model.Result" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Company" %>
<%@ page import="dao.DAOCompany" %>

<!DOCTYPE html>
<html lang="vi-VN">
<head>
<meta charset="UTF-8">
<title>Danh sách kết quả</title>

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
				<div class="text-uppercase text-danger text-center">
					<b>Danh sách Kết quả cập nhật mới nhất</b>
				</div>
				<hr>

				<!--  Lay du lieu ve cong ty -->
				<%
				List<Company> company = new DAOCompany().getCompanyList();
				%>

				<!--  Tim kiem ket qua theo cong ty xo so va ngay thang -->
				<div class="row">
					<form action="results" method="POST">
						<input type="hidden" name="action" value="search" />
						<div class="row">
							<div class="form-group col-md-5">
								Đơn vị: <select class="form-control" name="company_id">
									<%
									for (int i = 0; i < company.size(); i++) {
									%>
									<option value="<%=company.get(i).getCompany_id()%>">
										<%
										out.print(company.get(i).getCompany_province());
										%>
									</option>
									<%}%>
								</select>
							</div>
							<div class="form-group col-md-5">
								Ngày quay thưởng: <input class="form-control" type="date"
									name="draw_date" />
							</div>
							<div class="form-group col-md-2">
								<br />
								<button class="btn btn-sm btn-primary form-control"
									style="width: 100%">Tìm kiếm</button>
							</div>
						</div>
					</form>
				</div>

				<!--  Hien thi cac ket qua da nhap -->
				<div class=" mt-3">
					<div id="mainTable">
						<table class="table-responsive table-sm table-hover">
							<tr>
								<th></th>
								<th>Id</th>
								<th>Tỉnh / Thành</th>
								<th>Mã KQ</th>
								<th>Ngày quay số</th>
								<th>Ngày cập nhật</th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach items="${inputtedList}" var="row">
							<tr>
								<td><input type="checkbox" name="result_id"
										class="" value="${row.getResult_id()}" /></td>
								<td>${row.getCompany_id()}</td>
								<td>${row.getCompany_province()}</td>
								<td>${row.getResult_id()}</td>
								<td>${row.getDraw_date()}</td>
								<td>${row.getPublished_date()}</td>
								<td class="col-1"><a href="results?action=view&result_id=${row.result_id}"><img
											style="width: 30%" src="images/view.png" alt="Xem" /></a></td>
								<td class="col-1"><a href="results?action=edit&result_id=${row.result_id}"><img
											style="width: 30%" src="images/edit.png" alt="Sửa" /></a></td>
								<td class="col-1"><img style="width: 30%" src="images/delete.png"
											onclick="confirmDelete(${row.result_id})"
											onMouseOver="this.style.cursor='pointer'" alt="Xóa" /></td>
							</tr>
							</c:forEach>
						</table>
							
							<!-- Phan phan trang -->
							<nav class="mt-4" aria-label="">
								<ul class="pagination justify-content-center">
									<li class="page-item" id="previousPage"><a
										class="page-link"
										href="results?action=getList&index=${index-1}"
										tabindex="-1">Trước</a></li>
									<li class="page-item"><a class="page-link" tabindex="-1">${totalResults}
											Kết quả - Trang ${index + 1}/${totalPages}</a></li>
									<li class="page-item" id="nextPage"><a class="page-link"
										href="results?action=getList&index=${index+1}">Sau</a></li>
								</ul>
							</nav>
							
							<div>
								<button id="deleteMulti" name="action"
									onclick="confirmDeletes()" class="btn-sm btn-delete col-3"
									style="float: right; "></button>
								<a href="admin?action=inputResult"><input
									class="btn btn-sm btn-primary col-3" style="float: right;"
									value="Thêm mới" /></a>
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
        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">Đóng</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal hien thi thong bao confirm xoa 1 du lieu-->
<div class="modal fade" id="deleteOneItem" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Xác nhận xóa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Bạn thật sự muốn xóa id : <span id="idToDelete"></span> ?
      </div>
	  <div class="row modal-footer">
			<form action="results" id="delete" method="POST">
				<input type="hidden" name="action" value="delete" /> 
				<input type="hidden" name="result_id" id="resultId" value="" />
				<button type="submit" class="btn btn-primary" style="width: 25%">Đồng ý</button>
				<button type="button" class="btn btn-info" data-dismiss="modal" style="width: 25%">Hủy</button>
			</form>
		</div>
	</div>
  </div>
</div>


<!-- Popup confirm xoa nhieu dong du lieu-->
<div class="modal fade" id="deleteItems" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Xác nhận</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Bạn thật sự muốn xóa id : <span id="idsToDelete"></span> ?
      </div>
				<div class="row modal-footer">
					<form action="results" id="delete"
						method="POST">
						<input type="hidden" name="action" value="deleteMulti" /> 
						<input type="hidden" name="result_id" id="resultIds" value=""/>
						<button type="submit" class="btn btn-primary" style="width: 25%">Đồng ý</button>
						<button type="button" class="btn btn-info" data-dismiss="modal"
							style="width: 25%">Hủy</button>
					</form>
				</div>
			</div>
  </div>
</div>

<!--Xac nhan xoa nhieu phan tu -->
<script>
	function confirmDeletes() {
	getId();	
	$("#deleteItems").modal("show");
	}
</script>


<!-- Thu vien cac Script -->	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	
		

<!--Xac nhan xoa 1 phan tu -->
<script>
	function confirmDelete(result_id) {
	$("#deleteOneItem").modal("show");
	$("#idToDelete").text(result_id);
	$("#resultId").val(result_id);
	}
</script>


<!-- Lay thong tin id can xoa  -->
<script>
	function getId() {
		var values = [];
		$('input[type=checkbox]:checked').each(function() {
			if (this.checked) {
				values.push($(this).val());
			}
		});
		$("#idsToDelete").text(values.join(" - "));
		$("#resultIds").val(values.join(","));
	}
</script>

<!--Show / hide nut xoa nhieu phan tu -->
<script>
	var countChecked = function() {
	  var n = $("input:checked").length;
	  const deleteButton = $("#deleteMulti");
	  
	  $("#deleteMulti").text("Xóa "+ n+ " kết quả");
	  
	  if (n == 0) { 
		  $("#deleteMulti").prop("disabled", true);
	  } else if (n > 0) {$("#deleteMulti").prop("disabled", false);}
	};
	
	countChecked();
	$("input[type=checkbox]").on("click", countChecked );
</script>

<!-- Hien thi thong bao cap nhat du lieu thanh cong / that bai  -->
<script>
	var data = '${queryResult}';
	if (data != '') {
		$("#inform").modal("show");
	}
</script>

<!-- Hien thi thong bao neu khong co ket qua tuong ung -->	
<script>
	var inputList = ${inputtedList};
	if (inputList == "") {
		$("#content").text("Không tìm được kết quả");
		$("#mainTable").hide();
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