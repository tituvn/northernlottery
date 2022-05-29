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
					<h5 class="text-center text-uppercase text-danger">Quy trình lĩnh thưởng xổ số dành cho người may mắn trúng
						giải</h5>
					<p>
						Xổ số là một trò chơi quay số ngẫu nhiên nhưng mang lại nhiều giải
						thưởng có giá trị. Nhưng có nhiều người chơi lại không biết quy
						trình lĩnh thưởng như thế nào khi mình đã trúng xổ số. Chính vì
						thế trong bài viết này, <a href="#">northernlottery.com</a> sẽ
						giúp người chơi có cái nhìn tổng quan hơn và hiểu sâu hơn về các
						vấn đề liên quan đến nhận thưởng khi trúng xổ số.
					</p>
					<h6>Phương thức xác định vé số trúng thưởng hợp lệ</h6>
					<p>Với thời đại công nghệ số như hiện nay, người chơi chỉ cần
						cầm điện thoại lên là có thể đối chiếu nhanh chóng và chính xác
						kết quả xổ số. Tỷ lệ đối chiếu kết quả các giải theo công bố là
						chính xác tuyệt đối, kể cả giải độc đắc có giá trị hàng tỷ đồng.</p>
					<p>Tuy nhiên, có những trường hợp đáng tiếc xảy ra là tấm vé
						người chơi mang đến lãnh thưởng lại được xác nhận là không hợp lệ.
						Vậy vé số trúng thưởng hợp lệ phải đủ những điều kiện gì?</p>

					<p>Theo quy định của công ty XSKT thì vé số hợp lệ phải đáp ứng
						đầy đủ những điều kiện sau:</p>
					<p>
						<b>1. Hiện trạng của lá vé số trúng giải</b>
					</p>
					<p>Theo quy định, vé số trúng giải phải được ghi nhận phát hành
						từ công ty xổ số kiến thiết, toàn bộ thông tin phải khớp với ngày
						quay và kỳ quay thưởng, các chữ số in trên vé không được tẩy xóa,
						sửa chữa, phải rõ ràng.</p>
					<p>Tấm vé số phải còn nguyên vẹn, không rách nát.</p>
					<p>Đặc biệt, tất cả vé số của XSMN, XSMB hay XSMT đều phải còn
						trong thời hạn lãnh thưởng được quy định trong thông tư
						75/2013/TT-BTC.</p>

					<p>
						<b>2. Thời gian niêm yết nhận thưởng, trả thưởng</b>
					</p>
					<p>Hạn mức thời gian lãnh tiền thưởng trong trường hợp tờ vé số
						trúng giải là 30 ngày, được tính kể từ ngày xác nhận trúng. Nếu
						người chơi để quá thời hạn, các vé số trúng thưởng sẽ không còn
						giá trị lĩnh thưởng với bất kỳ lý do gì.</p>
					<p>
						<b>3. Quy định các địa điểm lĩnh thưởng xổ số </b>
					</p>
					<p>Có rất nhiều người chơi tham gia lần đầu khi trúng thưởng
						đều không biết phải đến đâu, tìm ai để lĩnh thưởng. Vé số được
						phát hành do các công ty xổ số đặt tại các tỉnh thành, do đó khi
						bạn trúng số hãy liên hệ hoặc đến trực tiếp công ty xổ số tại tỉnh
						thành đó để lĩnh thưởng.</p>

					<p>Khi đi nhận thưởng người chơi phải mang theo CMND, hộ chiếu
						và các giấy tờ liên quan khác theo yêu cầu của công ty XSKT. Tiền
						nhận thưởng sẽ được công ty chịu trách nhiệm chi trả bằng hình
						thức chuyển khoản qua ngân hàng hoặc trao tay trực tiếp, phụ thuộc
						vào mong muốn người trúng giải.</p>
					<p>Thông tin của người trúng luôn được bảo mật một cách tuyệt
						đối, không để lộ bất kỳ tin tức nào từ các công ty xổ số trừ khi
						người chơi cho phép.</p>

					<p>
						<b>4. Cách tính thuế TNCN khi trúng thưởng </b>
					</p>
					<p>Người trúng thưởng xổ số có giá trị giải thưởng trên 10
						triệu đồng phải có nghĩa vụ nộp thuế thu nhập cá nhân vào ngân
						sách nhà nước.</p>
					<p>
						Cách thức tính số tiền phải nộp thuế như sau: <b>số tiền vượt
							mức x thuế suất 10%. </b>
					</p>
					<p>Ví dụ, bạn trúng thưởng 15 triệu đồng thì tiền thuế TNCN
						phải nộp là (15.000.000 -10.000.000)x10% = 500.000 đồng.</p>
					<p>Quy trình lĩnh thưởng xổ số kiến thiết và những điều cần lưu
						ý trong quá trình nhận thưởng đã được thể hiện chi tiết trong bài
						viết này. Hy vọng mọi thông tin trên sẽ giúp bạn đọc hiểu hơn về
						XSKT trong bài viết.</p>
					<p>Trúng thưởng vé xổ số truyền thống hiện nay không phải là
						trường hợp hiếm hoi. Có rất nhiều người do may mắn đã trúng được
						những giải thưởng không hề nhỏ. Hi vọng bài viết có thể giải đáp
						các băn khoăn, thắc mắc đó về thủ tục lãnh thưởng. Nếu còn những
						điều khúc mắc, hãy liên hệ ngay với chúng tôi nhé.
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

