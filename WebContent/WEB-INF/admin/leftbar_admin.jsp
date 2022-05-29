<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
<!--  Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!--  CSS style -->
<link rel="stylesheet" type="text/css" href="main.css">
<link rel="shortcut icon" href="favicon.ico" />
</head>
<body>
	<div class="list-group">
		<ul class="list-group">
			<li class="list-group-item bg-success" data-target="#member">Quản trị thành viên</li>
			<li>
				<div id="member">
						<a href="accounts?action=showaccount"
							class="list-group-item list-group-item-action">Danh sách thành viên </a> 
				</div>
			<li>
			<li class="list-group-item bg-success" data-target="#result">Quản trị kết quả xổ số</li>
			<li>
				<div id="result">
					<a href="results?action=getList"
						class="list-group-item list-group-item-action">Danh sách đã nhập</a> 
					<a href="admin?action=inputResult"
						class="list-group-item list-group-item-action">Nhập kết quả xổ số mới</a> 
					<a href="results?action=viewResult"
						class="list-group-item list-group-item-action">Xem kết quả xổ  số</a> 
					<a href="companies?action=showlist"
						class="list-group-item list-group-item-action">Danh sách Công ty xổ số</a>
				</div>
			</li>
			<li class="list-group-item bg-success" data-target="#transaction">Quản trị Dò số</li>
			<li>
				<div id="transaction">
					<a href="admin?action=history"
						class="list-group-item list-group-item-action">Danh sách Dò số</a> 
				</div>
			</li>
		</ul>
	</div>



<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>