<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi_VN">
<head>
<meta charset="UTF-8">
<title>Xem kết quả</title>

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
<!--  Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!--  CSS style -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="shortcut icon" href="images/favicon.ico" />
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
					<table class="table table-sm align-middle border">
						<tr>
							<div class="text-nowrap text-uppercase text-center">
								<b>xổ số ${result.getCompany_province()}</b>
							</div>
						</tr>
						<tr>
							<div class="text-nowrap text-center">
								<fmt:parseDate value="${result.getDraw_date()}"
									pattern="yyyy-MM-dd" var="parsedDate" type="date" />
								<fmt:setLocale value="vi_VN" />
								<fmt:formatDate value="${parsedDate}" type="date"
									pattern="EEEE, dd/MM/yyyy" />
							</div>
						</tr>

						<tr>
							<th scope="row" class="text-nowrap formhover">Ký tự</th>
							<td>
								<div style="width: 100%"
									class="text-center text-uppercase formhover">${result.getChar_1()}
									- ${result.getChar_2()} - ${result.getChar_3()} -
									${result.getChar_4()} - ${result.getChar_5()} -
									${result.getChar_6()}</div>
							</td>
						</tr>
						<tr class="text-danger">
							<th scope="row" class="text-nowrap  formhover">Đặc biệt</th>
							<td>
								<div style="font-size: 1.5rem;" class="text-center formhover">
									<b>${result.getNumber_1()}</b>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="text-nowrap  formhover">Giải nhất</th>
							<td>
								<div class="text-center formhover">${result.getNumber_2()}</div>
							</td>
						</tr>
						<tr>
							<th class="text-nowrap  formhover">Giải nhì</th>
							<td>
								<div>
									<div class="text-center formhover size50">${result.getNumber_3()}</div>
									<div class="text-center formhover size50">${result.getNumber_4()}</div>
								</div>
							</td>
						</tr>

						<tr>
							<th scope="rowgroup" class="align-middle formhover">Giải ba</th>
							<td>
								<div>
									<div class="text-center formhover size33">${result.getNumber_5()}</div>
									<div class="text-center formhover size33">${result.getNumber_6()}</div>
									<div class="text-center formhover size33">${result.getNumber_7()}</div>
									<div class="text-center formhover size33">${result.getNumber_8()}</div>
									<div class="text-center formhover size33">${result.getNumber_9()}</div>
									<div class="text-center formhover size33">${result.getNumber_10()}</div>
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row" class="align-middle formhover">Giải tư</th>
							<td>
								<div>
									<div class="text-center formhover size25">${result.getNumber_11()}</div>
									<div class="text-center formhover size25">${result.getNumber_12()}</div>
									<div class="text-center formhover size25">${result.getNumber_13()}</div>
									<div class="text-center formhover size25">${result.getNumber_14()}</div>
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row" class="align-middle formhover">Giải năm</th>
							<td>
								<div>
									<div class="text-center formhover size33">${result.getNumber_15()}</div>
									<div class="text-center formhover size33">${result.getNumber_16()}</div>
									<div class="text-center formhover size33">${result.getNumber_17()}</div>
									<div class="text-center formhover size33">${result.getNumber_18()}</div>
									<div class="text-center formhover size33">${result.getNumber_19()}</div>
									<div class="text-center formhover size33">${result.getNumber_20()}</div>
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row" class="align-middle formhover">Giải sáu</th>
							<td>
								<div>
									<div class="text-center formhover size33">${result.getNumber_21()}</div>
									<div class="text-center formhover size33">${result.getNumber_22()}</div>
									<div class="text-center formhover size33">${result.getNumber_23()}</div>
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row" class="align-middle formhover">Giải bảy</th>
							<td>
								<div>
									<div class="text-center formhover size25">${result.getNumber_24()}</div>
									<div class="text-center formhover size25">${result.getNumber_25()}</div>
									<div class="text-center formhover size25">${result.getNumber_26()}</div>
									<div class="text-center formhover size25">${result.getNumber_27()}</div>
								</div>
							</td>
						</tr>
					</table>
				</div>

				<div>
					<input onclick="confirmDelete(${result.getResult_id()})"
						class="btn btn-sm btn-danger" style="float: right; width: 10%"
						value="Xóa" /> <a
						href="results?action=edit&result_id=${result.getResult_id()}"><input
						class="btn btn-sm btn-primary"
						style="float: right; width: 10%; margin-right: 4px;" value="Sửa" /></a>
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

<!--Xac nhan xoa 1 phan tu -->
<script>
	function confirmDelete(result_id) {
	$("#deleteOneItem").modal("show");
	$("#idToDelete").text(result_id);
	$("#resultId").val(result_id);
	}
</script>

<!-- Hien thi thong bao cap nhat du lieu -->
<script>
	var query = '${queryResult}';
	if (query != "") {
		$("#inform").modal("show");
	}
</script>
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>		
	
	
</body>
</html>