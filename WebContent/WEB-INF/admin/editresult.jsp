<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa kết quả</title>

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
				<div class="">
					<div
						style="text-transform: uppercase; text-align: center; color: red;">
						<b>Sửa kết quả xổ số</b>
					</div>
					<hr>
					<form action="results" method="POST" id="inputResult">
						<input type="hidden" name="action" value="saveEdit" /> <input
							type="hidden" name="result_id" value="${result.getResult_id()}" />
						<input type="hidden" name="company_id"
							value="${result.getCompany_id()}" />

						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Tỉnh
								Thành</label>
							<div class="col-4">
								<input class="form-control" type="text" name="company_province"
									value="${result.getCompany_province()}" readonly />
							</div>
						</div>


						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Ngày mở
								thưởng</label>
							<div class="col-4">
								<input class="form-control" type="date" name="draw_date" id="inputDate"
									value="${result.getDraw_date()}" required
									oninvalid="validateInfo(this)" oninput="validateInfo(this)" readonly/>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Ký tự</label>
							<div class="row col-10 g-0">
								<div class="col-2">
									<input class="form-control" type="text" name="char_1"
										class="size16" value="${result.getChar_1()}" minlength="3"
										maxlength="4" required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" />

								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_2"
										class="size16" value="${result.getChar_2()}" minlength="3"
										maxlength="4" required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_3"
										class="size16" value="${result.getChar_3()}" minlength="3"
										maxlength="4" required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_4"
										class="size16" value="${result.getChar_4()}" minlength="3"
										maxlength="4" required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" />
								</div>
								<div class="col-2">

									<input class="form-control" type="text" name="char_5"
										class="size16" value="${result.getChar_5()}" minlength="3"
										maxlength="4" required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" />
								</div>
								<div class="col-2">
									<input class="form-control" type="text" name="char_6"
										class="size16" value="${result.getChar_6()}" minlength="3"
										maxlength="4" required oninvalid="validateInfo(this)"
										oninput="validateInfo(this)" />
								</div>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Đặc biệt</label>
							<div class="col-10">
								<input class="form-control" type="text" name="Number_1"
									class="size100" value="${result.getNumber_1()}" minlength="5"
									maxlength="5" pattern="[0-9]+" required
									oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</td>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Giải nhất</label>
							<div class="col-10">
								<input class="form-control" type="text" name="Number_2"
									class="size100" value="${result.getNumber_2()}" minlength="5"
									maxlength="5" pattern="[0-9]+" required
									oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Giải nhì</label>
							<div class="col-10 row g-0">
								<div class=col-6>
									<input class="form-control" type="text" name="Number_3"
										class="size50" value="${result.getNumber_3()}" minlength="5"
										maxlength="5" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class=col-6>
									<input class="form-control" type="text" name="Number_4"
										class="size50" value="${result.getNumber_4()}" minlength="5"
										maxlength="5" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Giải ba</label>
							<div class="col-10 row g-0">
								<div class="row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_5"
											class="size33" value="${result.getNumber_5()}" minlength="5"
											maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_6"
											class="size33" value="${result.getNumber_6()}" minlength="5"
											maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_7"
											class="size33" value="${result.getNumber_7()}" minlength="5"
											maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
								</div>
								<div class="row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_8"
											class="size33" value="${result.getNumber_8()}" minlength="5"
											maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_9"
											class="size33" value="${result.getNumber_9()}" minlength="5"
											maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_10"
											class="size33" value="${result.getNumber_10()}" minlength="5"
											maxlength="5" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
								</div>
							</div>
						</div>


						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Giải tư</label>
							<div class="col-10 row g-0">
								<div class="col-3">
									<input class="form-control" type="text" name="Number_11"
										class="size25" value="${result.getNumber_11()}" minlength="4"
										maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_12"
										class="size25" value="${result.getNumber_12()}" minlength="4"
										maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_13"
										class="size25" value="${result.getNumber_13()}" minlength="4"
										maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_14"
										class="size25" value="${result.getNumber_14()}" minlength="4"
										maxlength="4" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>


						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Giải năm</label>
							<div class="col-10 row g-0">
								<div class="row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_15"
											class="size33" value="${result.getNumber_15()}" minlength="4"
											maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">


										<input class="form-control" type="text" name="Number_16"
											class="size33" value="${result.getNumber_16()}" minlength="4"
											maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">

										<input class="form-control" type="text" name="Number_17"
											class="size33" value="${result.getNumber_17()}" minlength="4"
											maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
								</div>
								<div class="row g-0">
									<div class="col-4">
										<input class="form-control" type="text" name="Number_18"
											class="size33" value="${result.getNumber_18()}" minlength="4"
											maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_19"
											class="size33" value="${result.getNumber_19()}" minlength="4"
											maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
									<div class="col-4">
										<input class="form-control" type="text" name="Number_20"
											class="size33" value="${result.getNumber_20()}" minlength="4"
											maxlength="4" pattern="[0-9]+" required
											oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
									</div>
								</div>
							</div>
						</div>


						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Giải sáu</label>
							<div class="col-10 row g-0">
								<div class="col-4">
									<input class="form-control" type="text" name="Number_21"
										class="size33" value="${result.getNumber_21()}" minlength="3"
										maxlength="3" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-4">
									<input class="form-control" type="text" name="Number_22"
										class="size33" value="${result.getNumber_22()}" minlength="3"
										maxlength="3" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-4">
									<input class="form-control" type="text" name="Number_23"
										class="size33" value="${result.getNumber_23()}" minlength="3"
										maxlength="3" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>

						<div class="form-group row g-0">
							<label class="col-form-label col-2 text-nowrap">Giải bảy</label>
							<div class="col-10 row g-0">
								<div class="col-3">
									<input class="form-control" type="text" name="Number_24"
										class="size25" value="${result.getNumber_24()}" minlength="2"
										maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_25"
										class="size25" value="${result.getNumber_25()}" minlength="2"
										maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_26"
										class="size25" value="${result.getNumber_26()}" minlength="2"
										maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
								<div class="col-3">
									<input class="form-control" type="text" name="Number_27"
										class="size25" value="${result.getNumber_27()}" minlength="2"
										maxlength="2" pattern="[0-9]+" required
										oninvalid="validateInfo(this)" oninput="validateInfo(this)" />
								</div>
							</div>
						</div>


						<div style="float: right">
							<input onclick="confirmDelete(${result.getResult_id()})"
								class="btn btn-sm btn-danger" style="float: right; width: 30%;"
								value="Xóa" readonly /> 
								<input class="btn btn-sm btn-primary"
								style="float: right; width: 30%; margin-right: 5%" onclick="confirmDate()"
								value="Lưu" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<c:import url="/views/footer.jsp" />
		</div>
	</div>

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
					<form action="results" id="delete" method="POST">
						<input type="hidden" name="action" value="delete" /> <input
							type="hidden" name="result_id" id="resultId" value="" />
						<button type="submit" class="btn btn-primary" style="width: 25%">Đồng
							ý</button>
						<button type="button" class="btn btn-info" data-dismiss="modal"
							style="width: 25%">Hủy</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal hien thi thong bao confirm cap nhat du lieu-->
	<div class="modal fade" id="confirmDating" tabindex="-1" role="dialog"
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
				<div class="modal-body">
					Kết quả đã tồn tại nhiều hơn 1 ngày.<br/> 
					Chỉnh sửa dữ liệu có thể ảnh hưởng tới kết quả các truy suất của khách hàng.<br/>
					Bạn có muốn lưu dữ liệu đã sửa ?
				</div>
				<div class="row modal-footer">
						<button type="submit" class="btn btn-primary" style="width: 25%" onclick="confirmSaving()">Đồng
							ý</button>
						<button type="button" class="btn btn-info" data-dismiss="modal"
							style="width: 25%">Hủy</button>
					
				</div>
			</div>
		</div>
	</div>

	<!-- Thu vien cac Script -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

<!--Xac nhan xoa 1 phan tu -->
	<script>
	function confirmDelete(result_id) {
	$("#deleteOneItem").modal("show");
	$("#idToDelete").text(result_id);
	$("#resultId").val(result_id);
	}
</script>

<!-- Thong bao cap nhat du lieu du lieu -->
<script>
	function confirmDate() {
		var inputDate = $("#inputDate").val();
		var today = new Date().toJSON().slice(0,10);
		
		var d1 = Date.parse(inputDate);
		var d2 = Date.parse(today);
		
		if ((d2 - d1) > 86400000) {
		$("#confirmDating").modal("show");
		} else {
			$("#inputResult").submit();
		}
	}
</script>

<script>
	function confirmSaving() {
		$("#inputResult").submit();
	}
</script>

</body>
</html>