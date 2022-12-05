<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css"
	rel="stylesheet">

</head>

<body id="page-top">
	 <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
		<%@ include file="/WEB-INF/views/includes/AdminSideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
				
                <!-- Topbar -->
				<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp" %>
                <!-- End of Topbar -->
				
				
                <!-- Begin Page Content -->
                <div class="container-fluid">
				<h1 style="color: white;">관리자 페이지</h1>
	
	</div>
	</div>
	</div>
		<!-- Content Row -->


	</div>
	<!-- /.container-fluid -->


	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer bg-black font-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto font-white">
				<span>Copyright &copy; Your Website 2022</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->


	<!-- End of Content Wrapper -->


	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

</body>


<!-- Bootstrap core JavaScript-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script
	src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
</html>