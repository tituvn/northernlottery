<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="java.util.*" %>
<%@ page import="dao.DAOCompany" %>
<%@ page import="model.Company" %>
<!DOCTYPE html>
<html>
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
				<!-- Do ket qua -->
				<div class="d-none" id="checkResult">
					<div class="bg-info btn-lg" style="text-indent: 1em;">Kết quả
						dò số</div>

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

					<!-- Ket qua do so -->
					<div class="text-center text-danger d-none" id="win">
						<h5>Xin chúc mừng!...</h5>
						<h5>Vé số của bạn đã trúng ${transaction.getFinalPrize()}.</h5>
						<h5>
							Tổng giá trị giải thưởng nhận được là:
							<fmt:formatNumber value="${transaction.getTotalPrize()}"
								currencyCode="vi" />
							đồng.
						</h5>
					</div>
					<div class="text-center d-none" id="nowin">
						<h5>${nowin}</h5>
					</div>
					<div class="text-center d-none mt-3" id="error">
						<h6>${error}</h6>
					</div>
					<div>
						<br />
						<br />
					</div>
				</div>
				<div>
					<div class="">
						<div class="bg-warning btn-lg" style="text-indent: 1em">Dò
							vé số Online - May mắn mỗi ngày!...</div>
						<%
						List<Company> company = new DAOCompany().getCompanyList();
						%>

						<form action="ticket" method="post">
							<input type="hidden" name="action" value="checkTicket" />
							<div class="row">
								<div class="col-6 form-group">
									<label class="col-form-label" for="draw_date">Ngày mở
										thưởng</label> <input class="form-control" type="date"
										name="draw_date" required oninvalid="validateInfo(this)" />
								</div>
								<div class="col-6 form-group">
									<label class="col-form-label" for="company_id">Tỉnh</label>
									<div class="">
										<select class="form-control" name="company_id" id="company_id"
											required oninvalid="validateInfo(this)">
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
								</div>
							</div>
							<div class="row">
								<div class="col-6 form-group">
									<label class="col-form-label" for="ticketNo">Số dự
										thưởng</label> <input class="form-control" type="text"
										name="ticket_number" minlength="5" maxlength="5" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-6 form-group">
									<label class="col-form-label" for="ticketChar">Ký tự vé
										số</label> <input class="form-control" type="text" name="ticket_char" />
								</div>
							</div>
							<button class="col-2 btn btn-sm btn-primary" style="float: right"
								style="">Dò kết quả</button>
						</form>
					</div>
				</div>
				
				<!-- Lich su do so -->
				<div id="recent" class="mt-4">
					<div class="g-1">
						<h6 class="text-success">Hoạt động dò số gần đây nhất</h6>
						<table class="responsive">
							<tr>
								<th scope="col" class="col-2">Ngày dò xố</th>
								<th scope="col" class="col-2">Đài</th>
								<th scope="col" class="col-1">Số</th>
								<th scope="col" class="col-2">Ngày quay số</th>
								<th scope="col" class="col-3">Kết quả</th>
								<th scope="col" class="text-center col-3">Giải thưởng</th>
							</tr>
							<c:forEach items="${transactions}" var="tran">
								<tr>
									<td class="col-2">${tran.getTransaction_date()}</td>
									<td class="col-2">${tran.getCompany_province()}</td>
									<td class="col-1">${tran.getTicket_number()}</td>
									<td class="col-2">${tran.getDraw_date()}</td>
									<td class="col-3">${tran.getFinalPrize()}</td>
									<td class="col-2"><fmt:formatNumber value="${tran.getTotalPrize()}"
											currencyCode="vi" /></td>

								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<c:import url="/views/footer.jsp" />
		</div>
	</div>
<!-- Tra ve ket qua -->
<script>
	var checkResult = '${transaction}';
	if (checkResult != "") {
		$("#checkResult").removeClass("d-none");
	}
</script>

<!-- Khong hien hoat dong gan day khi co ket qua check-->
<script>
	var recent = '${transactions}';
	if (recent == "") {
		$("#recent").addClass("d-none");
	}
</script>


<!-- Neu xay ra loi ko co ket qua du thuong -->
<script>
	var error = '${error}';
	if (error != "") {
		$("#infoBoard").hide();
		$("#error").removeClass("d-none");
		$("#checkResult").removeClass("d-none");
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