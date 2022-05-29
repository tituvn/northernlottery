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
				<div class="text-justify">
					<h3 class="text-center">
						<a href="#" class="text-uppercase text-danger">www.northernlottery.com</a>
					</h3>
					<h4 class="text-center">Hệ thống phân phối vé xổ số kiến thiết miền bắc</h4> 
					<h4 class="text-center">Hệ thống hoạt động uy tín và phát triển</h4>
					<h4 class="text-center">Tường thuật trực tiếp kết quả xổ số</h4>
					<p class="text-justify">
					Hệ thống Số 1 tại Việt Nam, đứng
					đầu Google nhiều từ khóa liên quan đến "xo so" "xổ số", "xổ số trực
					tiếp", "đổi số trúng đặc biệt" ... với hàng triệu người dùng thường
					xuyên. </p>
					
					<h3 class="text-center text-danger">ĐỔI SỐ TRÚNG</h3>
					<p class="text-justify">Nhận
					đổi số trúng các giải, khả năng tài chính tốt nhất (hỗ trợ nhanh
					chóng các giải trúng lớn và Giải Đặc Biệt).</p>
					<p> Thanh toán 1 lần bằng tiền mặt VNĐ, SJC hoặc chuyển
					khoản...</p> 
					<p>Bất kỳ giải nào và số lượng bao nhiêu tờ!</p> 
					<p>Nhận tiền ngay
					không cần những thủ tục phức tạp, không phải chờ đợi, giao tận nơi.</p>
					
					<h3 class="text-center text-danger">ĐỔI SỐ TRÚNG ĐẶC BIỆT (ĐỘC ĐẮC) </h3>
					<h6 class="text-center">Nhanh nhất - Uy tín - Bảo mật & Tận
					nơi theo yêu cầu</h6> 
					
					<p><h4>Nhanh nhất!</h4> 30 phút sau khi nhận cuộc gọi
					trúng số trong nội thành, 1 tiếng đối với các khu vực ngoại
					thành và các tỉnh thành khác thuộc khối xổ số miền bắc.</p>
					<p><h4>Uy tín, bảo
					mật!</h4> Tuyệt đối bảo mật thông tin người trúng xổ số.</p> 
					<p><h4>Thanh toán tận
					nơi an toàn!</h4> Thanh toán tại chi nhánh đại lý vé số gần nhất hoặc
					tại nhà riêng của khách hàng hoặc tại Ngân Hàng do khách hàng chỉ
					định. </p>
					<p><h4>Phương thức linh động!</h4> Thanh toán 100% tiền VNĐ mệnh giá lớn
					(tiền mặt theo qui chuẩn bó 1.000 tờ có niêm phong của ngân hàng)
					hoặc chuyển khoản. </p>
					<p><h4>Tư vấn - Hỗ trợ</h4> Hỗ trợ gởi tiền vào ngân hàng an toàn,
					linh động & phù hợp lý nhất theo nhu cầu của từng khách hàng.</p> 
					<p><h4>Hoa hồng thấp
					nhất</h4> Hỗ trợ trực tiếp tận nơi nhanh nhất đối với đại lý vé số
					trong ngày có phát hành cặp vé Đặc Biệt. <p>
					
					<h5 class="text-center text-uppercase"> Đ/c: Hoàn Kiếm, Hà Nội - Hotline: Hotline: 18006688 </h5> 
					<p class="text-center">(Có chỗ đậu xe hơi)</p>
					<p class="text-center">Giờ làm
					việc từ 7h30' đến 20h30' tất cả các ngày trong tuần.</p>
					
					<p>Khi bạn trúng xổ số giải
					lớn hoặc có tổng giá trị các tờ vé trúng lớn hãy liên hệ với chúng
					tôi! </p>
					<p>Chuyên Nghiệp - An Toàn & Đơn Giản Nhất - Đảm bảo cho niềm vui
					trọn vẹn!... </p>
					<p>Kính chúc quý khách may mắn phát tài!...
					</p>
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

