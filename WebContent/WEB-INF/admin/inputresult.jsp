<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="dao.DAOCompany" %>
<%@ page import="model.Company" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhập kết quả xổ số</title>

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

			<!--  Lay du lieu ve cong ty -->
			<%
			List<Company> company = new DAOCompany().getCompanyList();
			%>

			<div class="col-lg-9">
				<div class="g-0">
					<div
						style="text-transform: uppercase; text-align: center; color: red;">
						<b>Nhập kết quả xổ số</b>
					</div>
					<hr>
					<form action="results" method="POST" class="g-1 needs-validation" id="addResult" onsubmit="return validate()" >
						<input type="hidden" name="action" value="addResult" />
						<div class="form-group row g-0">
							<label class="col-form-label col-4 col-md-2" for="company_id">Tỉnh
								/ Thành phố</label>
							<div class="col-4 g-0">
								<select class="form-control" name="company_id" id="company_id">
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
						
						<div class="form-group row g-0">
							<label class="col-form-label col-4 col-md-2 text-nowrap">Ngày
								mở thưởng</label>
							<div class="col-4 g-0">
								<input class="form-control" type="date" id="inputDate"
									name="draw_date" required oninvalid="validateInfo(this)" oninput="validateInfo(this)"/>
							</div>
						</div>
						
						
						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 col-sm-10 text-nowrap">Ký
								tự</label>
							<div class="col-sm-12 col-md-10 row g-0">
								<div class="col-2">
									<input class="form-control" type="text" name="char_1"
										minlength="3" maxlength="4" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_2"
										minlength="3" maxlength="4" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_3"
										minlength="3" maxlength="4" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_4"
										minlength="3" maxlength="4" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_5"
										minlength="3" maxlength="4" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_6"
										minlength="3" maxlength="4" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Đặc
								biệt</label>
							<div class="col-md-10 col-sm-12 g-0">
								<input class="form-control " type="text" name="Number_1"
									class="size100" minlength="5" maxlength="5" pattern="[0-9]+"
									required oninvalid="validateInfo(this)"
									oninput="validateInfo(this)" />
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Giải
								nhất</label>
							<div class="col-md-10 col-sm-12 g-0">
								<input class="form-control " type="text" name="Number_2"
									class="size100" minlength="5" maxlength="5" pattern="[0-9]+"
									required oninvalid="validateInfo(this)"
									oninput="validateInfo(this)" />
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Giải
								nhì</label>
							<div class="col-md-10 col-sm-12 row g-0">
								<div class="col-6">
									<input class="form-control " type="text" name="Number_3"
										minlength="5" maxlength="5" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-6">
									<input class="form-control " type="text" name="Number_4"
										minlength="5" maxlength="5" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Giải
								ba</label>
							<div class="col-md-10 col-sm-12 row g-0">
								<div class="col-md-12 col-sm-12 row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_5"
											minlength="5" maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_6"
											minlength="5" maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_7"
											minlength="5" maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>

								</div>
								<div class="col-md-12 col-sm-12 row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_8"
											minlength="5" maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_9"
											minlength="5" maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_10"
											minlength="5" maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
								</div>

							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Giải
								tư</label>
							<div class="col-md-10 col-sm-12 row g-0">
								<div class="col-3">

									<input class="form-control" type="text" name="Number_11"
										minlength="4" maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_12"
										minlength="4" maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_13"
										minlength="4" maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_14"
										minlength="4" maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Giải
								năm</label>
							<div class="col-md-10 col-sm-12 row g-0">
								<div class="col-md-12 col-sm-12 row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_15"
											minlength="4" maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_16"
											minlength="4" maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_17"
											minlength="4" maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>

								</div>


								<div class="col-md-12 col-sm-12 row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_18"
											minlength="4" maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_19"
											minlength="4" maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_20"
											minlength="4" maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
								</div>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Giải
								sáu</label>
							<div class="col-md-10 col-sm-12 row g-0">
								<div class="col-4">
									<input class="form-control" type="text" name="Number_21"
										minlength="3" maxlength="3" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-4">
									<input class="form-control" type="text" name="Number_22"
										minlength="3" maxlength="3" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-4">
									<input class="form-control" type="text" name="Number_23"
										minlength="3" maxlength="3" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>


						<div class="form-group row g-0">
							<label class="col-form-label col-md-2 text-nowrap">Giải
								bảy</label>
							<div class="col-md-10 col-sm-12 row g-0">
								<div class="col-3">
									<input class="form-control" type="text" name="Number_24"
										minlength="2" maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_25"
										minlength="2" maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_26"
										minlength="2" maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_27"
										minlength="2" maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>

  
						<div class="g-2">
							<a href="results?action=getList"><input
								class="btn btn-sm btn-danger" style="float: right; width: 15%;"
								value="Hủy" /></a> 
								<button class="btn btn-sm btn-primary"
								style="float: right; width: 15%; margin-right: 5px">
								 Lưu </button>

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
        Không thể nhập vào kết quả cho ngày trong tương lai.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal" style="width:25%">Đóng</button>
      </div>
    </div>
  </div>
</div>


<!-- Thu vien cac Script -->	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	

<!-- Validate form ve ngay thang nhap -->
<script>
	function validate(){
		var inputDate = $("#inputDate").val();
		var today = new Date().toJSON().slice(0, 10);
		
		var d1 = Date.parse(inputDate);  	//ngay nhap
		var d2 = Date.parse(today);		//ngay he thong
		
		if (d1 - d2 > 0 ) {
			$("#inform").modal("show");
			return false;
		} else {
			return true}
	}
</script>

	
</body>
</html>