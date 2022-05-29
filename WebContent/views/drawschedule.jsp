<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
				<div>
					<h6 class="text-center text-uppercase text-danger">Lịch quay
						thưởng hàng ngày</h6>
				</div>
				<table class="table table-border responsive table-sm">
					<tr>
						<th class="text-nowrap">Ngày</th>
						<th class="text-center text-nowrap">Hà Nội</th>
						<th class="text-center text-nowrap">Hải Phòng</th>
						<th class="text-center text-nowrap">Bắc Ninh</th>
						<th class="text-center text-nowrap">Nam Định</th>
						<th class="text-center text-nowrap">Quảng Ninh</th>
						<th class="text-center text-nowrap">Thái Bình</th>
					</tr>
					<tr>
						<td>Thứ Hai</td>
						<td class="text-center bg-warning">18:00</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Thứ Ba</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="text-center bg-warning">18:00</td>
						<td></td>
					</tr>
					<tr>
						<td>Thứ Tư</td>
						<td></td>
						<td></td>
						<td class="text-center bg-warning">18:00</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Thứ Năm</td>
						<td class="text-center bg-warning">18:00</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Thứ Sáu</td>
						<td></td>
						<td class="text-center bg-warning">18:00</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Thứ Bảy</td>
						<td></td>
						<td></td>
						<td></td>
						<td class="text-center bg-warning">18:00</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Chủ Nhật</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="text-center bg-warning">18:00</td>
					</tr>

				</table>


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
        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">Close</button>
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

