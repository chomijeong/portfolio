<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>시작페이지</title>
	 <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" rel="stylesheet">

</head>

<body id="bg-gradient-primary" style="background-color: black;">

<div class="container shadow-lg my-5" style="padding-left: 10px; padding-right: 10px;">
		<div class="card o-hidden border-0 shadow-lg my-5" style="background-color: white;">
		<div class="card-header" style="background-color: red; text-align: center;">시작페이지</div>
			<div class="card-body p-0">
				<div class="row">
					<div class="col-6">
						<div class="p-5" style="text-align: center;">
							<button class="btn" style="background-color: black; height: 100px;" onclick="adminMain()">관리자페이지</button>
						</div>
					</div>
					

					<div class="col-6">
						<div class="p-5" style="text-align: center;">
							<button class="btn" style="background-color: black; height: 100px;" onclick="MovieMain()">일반회원페이지</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!-- Content Row -->
		<div class="card-body" style="text-align: center;">
		<img class="img-profile"
			src="${pageContext.request.contextPath }/resources/img/pngwing.com (15).png">
		<!-- Content Row -->
		</div>

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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


   


</body>


 <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>


<script type="text/javascript">
	function adminMain(){
		var confirmVal = confirm("확인");
		console.log(confirm);
		
		
		
		var inputPw = prompt("비밀번호 입력");
		console.log(inputPw);
		location.href = "AdminMain?inputPw="+inputPw;
		
		
	}
</script>
<script type="text/javascript">
	function MovieMain(){
		location.href="MovieMain";
		
		
	}



</script>



</html>