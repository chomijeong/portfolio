<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>내정보</title>
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

<script src="https://kit.fontawesome.com/2f771efc6f.js"
	crossorigin="anonymous"></script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="../includes/SideBar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="../includes/TopBar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->

					<!-- Content Row -->

					<div class="row">

						<div class="col-xl-3">
							<!-- Profile picture card-->
							<div class="card mb-4">
								<div class="card-body text-center">
									<!-- Profile picture image-->
									<img class="img-account-profile mb-2"
										style="width: 180px; hight: auto;" src="${MovieView.mvposter}"
										alt="">
									<!-- Profile picture help block-->
								</div>
							</div>
						</div>
						<br>
						<div class="col-xl-9">
							<!-- Account details card-->
							<form>
								<div class="card mb-4" style="padding-bottom: 10px;">
									<div class="card-header"style="background-color: red;">${MovieView.mvname }</div>
									<div class="card-body1" style="background-color: white;">

										<!-- Form Group (username)-->
										<div class="mb-3">예매율 ${MovieView.reservationRatio }% | <i class="fa-regular fa-thumbs-up text-primary">${MovieView.goodRvcommend }</i> | <i class="fa-regular fa-thumbs-down text-danger">${MovieView.badRvcommend }</i></div>
										<div class="mb-3">감독 : ${MovieView.mvpd }</div>
										<div class="mb-3">배우 : ${MovieView.mvactor }</div>
										<!-- Form Row-->
										<div class="mb-3">장르 : ${MovieView.mvgenre } | 연령/시간
											${MovieView.mvage } ${MovieView.mvtime }</div>
										<div class="mb-3">개봉날짜 : ${MovieView.mvopen }</div>
										<!-- Save changes button-->
										<div style="text-align: center; margin-bottom: 6px;">
											<a class="btn btn-primary" href="MovieReservationPage?mvcode=${MovieView.mvcode }">예매하기</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="row text-gray-100 text-lg">

						<div class="col-xl-12">

							<div class="card-header" style="color: black; background-color: red; border: 0px;">REVIEW</div>
							<br>

							<div class="card-body">
								<div class="row">
								<c:forEach items="${Reviewsel }" var="review">
									
									<div class="col-xl-4">
										
										<div class="card mb-4" style="padding-bottom: 10px;">

											<div class="card-header" style="text-align: center; background-color: red; color: black;">${review.rvmid }</div>

											<div class="card-body" style="background-color: white;">

												<div class="row" style="margin-top: 20px;">

													<div class="col-3">
														<div class="mb-3" style="text-align: center;">
															
															
															<c:choose>
															<c:when test="${review.mstate != 2 }">
														
															<img style="width: 50px;"class="img-profile rounded-circle" src="${pageContext.request.contextPath }/resources/mprofileUpLoad/${review.mprofile}">
															</c:when>
															<c:otherwise>
															<img style="width: 50px;"class="img-profile rounded-circle" src="${review.mprofile}">
															
															</c:otherwise>
															</c:choose>

														
														</div>
													</div>
													<div class="col-7">
														<div class="text-gray-900">
															<div class="p-2 font-weight-bold text-lg text-center">${review.rvcontents }</div>

														</div>
													</div>
													<div class="col-1">
														<c:choose>
															<c:when test="${review.rvcommend == 1 }">
																<i class="fa-regular fa-thumbs-up text-primary"></i>


															</c:when>

															<c:otherwise>
																<i class="fa-regular fa-thumbs-down text-danger"></i>

															</c:otherwise>


														</c:choose>


													</div>

												</div>
												<br>
												<div class="col-xl-12">


													<div
														class="text-xs font-weight-bold text-gray-900 mb-1 text-center">${review.rvdate}</div>

												</div>

											</div>

										</div>
										
									</div>

								</c:forEach>
								</div>
							</div>

						</div>


					</div>

				</div>
			</div>
		</div>



















	</div>














	<!-- Content Row -->


	<!-- Content Row -->



	<!-- /.container-fluid -->


	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer bg-black">
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

<!-- Page level plugins -->
<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script
	src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>





</html>