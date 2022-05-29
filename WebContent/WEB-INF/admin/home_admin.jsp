<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.DAOAccount" %>
<%@ page import="dao.DAOResult" %>
<%@ page import="dao.DAOTransaction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản trị nội dung</title>

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
				<c:import url="/WEB-INF/admin/leftbar_admin.jsp" />
			</div>

			<div class="col-lg-9 row">
				<div class="col-md-6 col-sm-12">
					<table class="table table-bordered">
						<tr>
							<th class="text-center text-danger" colspan="2">Thành viên</th>
						</tr>
						<tr>
							<td>Tổng lượng thành viên</td>
							<td class="text-right"><%=new DAOAccount().getTotalAccount()%>
							</td>
						</tr>
						<tr>
							<td>Lượng thành viên đang online</td>
							<td class="text-right text-primary"><%=new DAOAccount().getTotalOnlineAccount()%>
							</td>
						</tr>
						<tr>
							<td>Lượng thành viên đang offline</td>
							<td class="text-right text-danger"><%=new DAOAccount().getTotalOfflineAccount()%>
							</td>
						</tr>
						<tr>
							<td>Lượng thành viên khác</td>
							<td class="text-right text-secondary"><%=new DAOAccount().getTotalOtherAccount()%>
							</td>
						</tr>
					</table>
				</div>

				<div class="col-md-6 col-sm-12">
					<table class="table table-bordered">
						<tr>
							<th class="text-center text-danger" colspan="2">Kết quả</th>
						</tr>
						<tr>
							<td>Tổng lượng kết quả</td>
							<td class="text-right"><%=new DAOResult().getTotalResult()%>
							</td>
						</tr>
						<tr>
							<td>Ngày kết quả gần nhất</td>
							<td class="text-right"><%=new DAOResult().getLatestDate()%>
							</td>
						</tr>
						<tr>
							<td>Tỉnh được tra cứu nhiều nhất</td>
							<td class="text-right"><%= new DAOTransaction().getMostCompany() %></td>
						</tr>
						<tr>
							<td>Tỉnh được tra cứu ít nhất</td>
							<td class="text-right"><%= new DAOTransaction().getLastCompany() %></td>
						</tr>
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



<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>	
	
<!-- Hien thi thong bao cap nhat du lieu -->
<script>
	var query = '${queryResult}';
	if (query != "") {
		$("#inform").modal("show");
	}
</script>

</body>
</html>