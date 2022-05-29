<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hướng dẫn dò số</title>

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
			<c:import url="header.jsp" />
		</div>
		<div class="row mt-4">
			<div class="col-lg-3">
				<c:import url="/views/leftbar.jsp" />
			</div>

			<div class="col-lg-9 row">
				<div class="text-center">
					<img class="img-fluid" alt="Vé số" src="images/ticket.png">
				</div>
				<div class="mt-3 text-justify">
					<h3>Cách dò vé số trúng thưởng</h3>
					<p>Trước khi dò số cần kiểm tra các thông tin trên vé số: tỉnh,
						ngày mở thưởng trên vé số có trùng với tỉnh và ngày trên kết quả
						xổ số không. Tiếp theo là xem số dự thưởng của là số mấy.</p>
					<p>
						Trong hình ảnh trên, các giá trị tương ứng là: <br />- Tỉnh: Hà
						Nội <br />- Ngày mở thưởng: 1/5/2022 <br />- Số dự thưởng:
						079600
					</p>
					<p>
						<b>Lưu ý: </b> <br />
						<i>- Vé số phải còn nguyên hình, nguyên khổ không rách rời,
							chắp vá, tẩy xóa, bị viết vẽ lên.</i> <br />
						<i>- Đối với vé số miền bắc cần chú ý thêm ký hiệu, tương ứng
							là 20VU. Trong trường hợp vé số trúng Giải Đặc biệt và ký hiệu
							trên vé trùng với ký hiệu ở kết quả XSMB thì sẽ được nhận thêm 50
							triệu từ mã giải đặc biệt.</i>
					</p>
					<h5>Danh sách giải thưởng như sau:</h5>
					<div>
						<table class="table table-border responsive text-left">
							<tr>
								<th class="col-2">Giải</th>
								<th class="col-5">Điều kiện</th>
								<th class="col-3">Giá trị trúng thưởng</th>
								<th class="col-2">Số lượng trúng</th>
							</tr>
							<tr>
								<td>Giải bảy</td>
								<td>2 số cuối vé số trùng 1 trong 4 số giải 7</td>
								<td>Mỗi giải nhận 40.000 VND</td>
								<td>60.000 giải</td>
							</tr>
							<tr>
								<td>Giải sáu</td>
								<td>3 số cuối vé số trùng 1 trong 3 số giải 6</td>
								<td>Mỗi giải nhận 100.000 VND</td>
								<td>4.500 giải</td>
							</tr>
							<tr>
								<td>Giải năm</td>
								<td>4 số cuối vé số trùng 1 trong 6 số giải 5</td>
								<td>Mỗi giải nhận 200.000 VND</td>
								<td>900 giải</td>
							</tr>
							<tr>
								<td>Giải tư</td>
								<td>4 số cuối vé số trùng 1 trong 4 số giải 4</td>
								<td>Mỗi giải nhận 400.000 VND</td>
								<td>600 giải</td>
							</tr>
							<tr>
								<td>Giải ba</td>
								<td>5 số cuối vé số trùng 1 trong 6 số giải 3</td>
								<td>Mỗi giải nhận 1.000.000 VND</td>
								<td>90 giải</td>
							</tr>
							<tr>
								<td>Giải nhì</td>
								<td>5 số cuối vé số trùng 1 trong 2 số giải 2</td>
								<td>Mỗi giải nhận 5.000.000 VND</td>
								<td>30 giải</td>
							</tr>
							<tr>
								<td>Giải nhất</td>
								<td>5 số cuối vé số trùng số giải 1</td>
								<td>Mỗi giải nhận 10.000.000 VND</td>
								<td>15 giải</td>
							</tr>
							<tr>
								<td>Giải Đặc biệt</td>
								<td>5 số cuối vé số trùng số giải đặc biệt</td>
								<td>Mỗi giải nhận 1.000.000.000 VND</td>
								<td>3 giải</td>
							</tr>
							<tr class="text-secondary">
								<td>Giải phụ Đặc biệt</td>
								<td>Vé số trùng 4 số cuối liên tiếp của giải đặc biệt</td>
								<td>Mỗi giải nhận 20.000.000 VND</td>
								<td>12 giải</td>
							</tr>
							<tr class="text-secondary">
								<td>Giải khuyến khích</td>
								<td>Vé số chỉ sai một số ở bất kỳ hàng nào trong giải đặc
									biệt trừ vé đã trúng giải phụ đặc biệt</td>
								<td>Mỗi giải nhận 40.000 VND</td>
								<td>15.000 giải</td>
							</tr>

						</table>

					</div>
					<div>
						<p>Lưu ý: Số tiền trúng giải thưởng bạn nhận được chưa trừ
							thuế thu nhập cá nhân (TNCN) theo luật nước Việt Nam.</p>
					</div>

				</div>
			</div>
		</div>


		<div class="row">
			<c:import url="/views/footer.jsp" />
		</div>
	</div>


	
</body>
</html>