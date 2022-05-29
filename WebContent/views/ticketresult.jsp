<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="java.util.*" %>
<%@ page import="dao.DAOCompany" %>
<%@ page import="dao.DAOResult" %>
<%@ page import="model.Company" %>
<%@ page import="model.Result" %>
<!DOCTYPE html>
<html lang="vi_VN">
<head>
<meta charset="UTF-8">
<title>Northern Lottery Company</title>

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
	<div class="container g-1">
		<div class="row">
			<c:import url="/views/header.jsp" />
		</div>
		<div class="row mt-4">
			<div class="col-md-3">
				<c:import url="/views/leftbar.jsp" />
			</div>

			<div class="col-md-9">
				<div>
					<div class="bg-warning align-middle btn-sm text-uppercase"
						style="text-indent: 1em; height: 2em">
						<h5>Kết quả dò số</h5>
					</div>

					<div id="infoBoard">
						<table class="table table-borderless col-6">
							<tr>
								<td>Truy vấn dò kết quả vé số</td>
								<td>${transaction.getCompany_province()}</td>
							</tr>
							<tr>
								<td>Mở thưởng ngày</td>
								<td>${transaction.getDraw_date()}</td>
							</tr>
							<tr>
								<td>Dãy số dự thưởng</td>
								<td>${transaction.getTicket_number()}</td>
							</tr>
						</table>
					</div>

					<div class="text-center text-danger d-none" id="win">
						<h5>Xin chúc mừng!...</h5>
						<h5>Vé số của bạn đã trúng ${transaction.getFinalPrize()}</h5>
						<h5>
							Tổng giá trị giải thưởng nhận được là:
							<fmt:formatNumber value="${transaction.getTotalPrize()}"
								currencyCode="vi" />
							VND
						</h5>
					</div>
					<div class="text-center d-none" id="nowin">
						<h5>${nowin}</h5>
					</div>
					<div class="text-center d-none mt-3" id="error">
						<h6>${error}</h6>
					</div>
				</div>

			</div>
			<div class="row">
				<c:import url="/views/footer.jsp" />
			</div>
		</div>


<!-- Thu vien cac Script -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>	

<!-- Neu xay ra loi ko co ket qua du thuong -->
<script>
	var error = '${error}';
	if (error != "") {
		$("#infoBoard").hide();
		$("#error").removeClass("d-none");
	}
</script>
		
<!-- Truong hop trung thuong -->
<script>
	var win = '${win}';
	if (win != "") {
		$("#win").removeClass("d-none");
	}
</script>

<!-- Truong hop khong trung -->
<script>
	var nowin = '${nowin}';
	if (nowin != "") {
		$("#nowin").removeClass("d-none");
	}
</script>				
				
</body>
</html>