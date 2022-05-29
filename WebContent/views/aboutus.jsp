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

			<div class="col-md-9 row">
				<div class="text-justify">
				<h5 class="text-danger">Địa chỉ tin cậy - Đội ngũ vận hành chuyên nghiệp</h5>
				<p>Là trang web xổ số uy tín,
					<a href="#">www.nothernlottery.com</a> đã trở thành địa chỉ tin cậy đối với đông
					đảo khách hàng. Với đội ngũ chuyên nghiệp, <a href="#">www.nothernlottery.com</a>
					đã đem đến cho người dùng kết quả xổ số miền bắc nhanh và chính xác
					nhất, các công cụ thống kê xổ số cực kỳ hữu ích.</p>
				
				<p><a href="#">www.nothernlottery.com</a> - trang web xổ số lâu năm. Từ nhiều năm nay, <a href="#">www.nothernlottery.com</a> là
				website quen thuộc được người chơi xổ số khắp cả nước theo
				dõi. Kết quả xổ số kiến thiết miền bắc được chúng tôi cập nhật một cách đầy đủ và
				nhanh chóng. Là website thống kê và cập nhật thông tin xổ số lớn
				nhất Việt Nam. 
				</p> 
				
				<p><a href="#">www.nothernlottery.com</a>cung cấp: Thông tin về kết
				quả xổ số miền bắc: trực tiếp từng giải 1 nhanh nhất và
				chính xác, các công
				cụ thống kê chính xác, trực quan, dễ hiểu, hữu ích với người chơi xổ
				số.</p>
				<p>
				<h5 class="text-danger">Dịch vụ đa dạng</h5>
				Ngoài ra tại đây chúng tôi còn cập nhật những tin tức xổ số nóng
				hổi, <a href="#">Dịch vụ dò kết quả</a>, <a href="#">Đại lí vé số</a> và <a href="#">Đổi thưởng</a>. 
				Khách hàng có thể đăng ký thành viên miễn phí để có thể tham
				khảo thông tin nhiều hơn. </p>
				<p>
				Chỉ cần một cú
				click chuột đăng ký, bạn có thể dễ dàng kích hoạt tài khoản ngay lập
				tức thông qua email tự động. <a href="#">www.nothernlottery.com</a> diễn đàn
				đang chờ đón bạn đến để cùng nhau trao đổi, thảo
				luận và cùng giành chiến thắng. Vui lòng liên hệ
				với chúng tôi theo địa chỉ sau: Email: <a href="#">contact@nothernlottery.com</a> hoặc 
				<a href="#">Skype: northernlottery </a></p>
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


</body>
</html>