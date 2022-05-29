<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="java.util.*"%>
<%@ page import="dao.DAOCompany"%>
<%@ page import="model.Company"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Northern Lottery Company</title>

<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="shortcut icon" href="images/favicon.ico" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- Javascript -->
<script src="script/validate.js"></script>
</head>
<body>
	<div class="container g-1">
		<div class="row">
			<c:import url="/views/header.jsp" />
		</div>
		<div class="row mt-4">
			<div class="col-md-3">
				<c:import url="/views/leftbar.jsp" />
			</div>

			<div class="col-md-9">
				<div id="noInfo" class="d-none">
					<h6>Chưa có hoạt động nào.</h6>
				</div>

				<div class="" id="showInfo">
					
					<div class="">
						<h6 class="text-danger text-uppercase text-center">Lịch sử dò
							số</h6>
						<hr>
						<table class="responsive">
							<tr>
								<th scope="col"></th>
								<th scope="col" class="col-2 text-center">Ngày dò xố</th>
								<th scope="col" class="col-2">Đài</th>
								<th scope="col" class="col-1">Số</th>
								<th scope="col" class="text-center col-2">Ngày quay số</th>
								<th scope="col" class="col-3">Kết quả</th>
								<th scope="col" class="text-center col-3">Giải thưởng</th>
							</tr>
							<c:forEach items="${transactions}" var="tran">
								<tr>
									<td><input type="hidden" name="transaction_id"
										id="${tran.getTransaction_id()}"
										value="${tran.getTransaction_id()}" /></td>
									<td class="text-center">${tran.getTransaction_date()}</td>
									<td>${tran.getCompany_province()}</td>
									<td>${tran.getTicket_number()}</td>
									<td class="text-center">${tran.getDraw_date()}</td>
									<td>${tran.getFinalPrize()}</td>
									<td><fmt:formatNumber value="${tran.getTotalPrize()}"
											currencyCode="vi" /></td>

								</tr>
							</c:forEach>
						</table>

						<!-- Phan phan trang -->
						<nav class="mt-4" aria-label="">
							<ul class="pagination justify-content-center">
								<li class="page-item" id="previousPage"><a
									class="page-link"
									href="user?action=history&account_id=${account_id}&index=${index-1}"
									tabindex="-1">Trước</a></li>
								<li class="page-item"><a class="page-link" tabindex="-1">${totalTransactions}
										Kết quả - Trang ${index + 1}/${totalPages}</a></li>
								<li class="page-item" id="nextPage"><a class="page-link"
									href="user?action=history&account_id=${account_id}&index=${index+1}">Sau</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- 
				<div style="float: right">
					<button class="btn btn-sm btn-primary" onclick="confirmMulti()"
						id="deleteBtn" value="" style="width: 100%">Xóa</button>
				</div>
 				-->
			</div>
		</div>

		<div class="row">
			<c:import url="/views/footer.jsp" />
		</div>
	</div>

	<!-- Modal hien thi thong bao confirm xoa du lieu-->
	<div class="modal fade" id="deleteItems" tabindex="-1" role="dialog"
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
					Bạn thật sự muốn xóa id : <span id="idToDelete"></span> ? <input
						type="hidden" id="deleteDelete" name="transaction_id" value="" />
				</div>
				<div class="row modal-footer">
					<form method="post">
						<input type="hidden" name="action" value="deleteTrans" /> <input
							type="hidden" name="transaction_id" value="" id="transToDelete" />
						<input type="submit" class="btn btn-primary" style="width: 25%"
							value="Đồng ý" />
						<button type="button" class="btn btn-info" data-dismiss="modal"
							style="width: 25%">Hủy</button>
					</form>
				</div>
			</div>
		</div>
	</div>

<!--Xac nhan xoa nhieu phan tu -->
	<script>
	function confirmMulti() {
	getId();	
	$("#deleteItems").modal("show");
	}
</script>


	<!-- Hien thi neu khong co hoat dong do so -->
	<script>
	var info = '${transactions}';
	if (info == "") {
		$("#noInfo").removeClass("d-none");
		$("#showInfo").addClass("d-none");
	}
</script>

	<!--Show / hide nut xoa nhieu phan tu -->
	<script>
	var countChecked = function() {
	  var n = $("input:checked").length;
	  const deleteButton = $("#deleteBtn");
	  
	  $("#deleteBtn").text("Xóa "+ n+ " kết quả");
	  
	  if (n == 0) { 
		  $("#deleteBtn").prop("disabled", true);
	  } else if (n > 0) {$("#deleteBtn").prop("disabled", false);}
	};
	
	countChecked();
	$("input[type=checkbox]").on("click", countChecked);
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
		$("#idToDelete").text(values.join(" - "));
		$("#transToDelete").val(values.join(","));
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