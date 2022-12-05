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

    <title>MovieHome</title>
	 <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
		<%@ include file="includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
				
                <!-- Topbar -->
				<%@ include file="includes/TopBar.jsp" %>
                <!-- End of Topbar -->
				
				
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">메인페이지 - Main.jsp</h1>
                    </div>
						<h2 class="h3 mb-0 text-gray-800">로그인 아이디 : ${sessionScope.LoginMid }</h2>
                        <h2 class="h3 mb-0 text-gray-800">로그인 프로필 : ${sessionScope.LoginProfile }</h2>
                    <!-- Content Row -->
					 <img class="img-profile"
                                   src="${pageContext.request.contextPath }/resources/img/pngwing.com (15).png">
                    <!-- Content Row -->


                    <!-- Content Row -->


                </div>
                <!-- /.container-fluid -->

            </div>
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

        </div>
        <!-- End of Content Wrapper -->

    </div>
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
var checkMsg = '${msg}';
console.log(checkMsg);


if(checkMsg.length > 0){

	alert(checkMsg);
	
}
</script>


<script type="text/javascript">
console.log("${reserinfo.recode}");
if("${reserinfo.recode}".length > 0){
	$("#reserMsg_mvposter").attr("src","${reserinfo.mvposter}");
	$("#reserMsg_recode").text("예매코드 : "+"${reserinfo.recode}");
	$("#reserMsg_mvname").text("영화 : "+"${reserinfo.mvname}");
	$("#reserMsg_thname").text("극장 : "+"${reserinfo.thname}"+" ${reserinfo.scroom}");
	$("#reserMsg_scdate").text("일시 : "+"${reserinfo.scdate}");
	$("#reserMsg_reamount").text("인원 : "+"${reserinfo.reamount}"+"명");
	$("#ReservationModal").modal('show');
	
	
	
	
}






</script>


</html>