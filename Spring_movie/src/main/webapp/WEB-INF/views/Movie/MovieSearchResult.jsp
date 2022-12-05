<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>검색결과 페이지</title>
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
		<%@ include file="../includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
				
                <!-- Topbar -->
				<%@ include file="../includes/TopBar.jsp" %>
                <!-- End of Topbar -->
				
				
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">검색결과페이지</h1>
                    </div>
						
                    <!-- Content Row -->
					<div class="row text-gray-100 text-lg">

						<div class="col-xl-12">

							<div class="card-header" style="color: black; background-color: red; border: 0px;">영화 검색 목록</div>
							<br>				


                    <!-- Content Row -->
				<div class="row">
				<c:forEach items="${searchList }" var="movie">
                 
                 
                 <div class="col-xl-3">
  
                <div class="card mb-4" style="padding-bottom: 10px;">
                 
                <div class="card-header mm font-weight-bold" style="background-color: red;">
                <a class="mm" href="${pageContext.request.contextPath }/MovieView?mvcode=${movie.mvcode}">${movie.mvname}</a>
                </div>

                 
				 <div class="card-body" style="background-color: white;">
				 
                     <!-- Profile picture image-->
                <a href="MovieView?mvcode=${movie.mvcode}"><img class="img-fluid" src="${movie.mvposter}" alt="${movie.mvname }"></a>

                </div> 
               
                </div>
                
                </div> 
                
                 
                 </c:forEach>
                 
                 </div>
				</div>
				</div>
                    <!-- Content Row -->
					
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">예매 가능한 영화 검색 목록</h1>
                    </div>	
					
				<div class="row text-gray-100 text-lg">

						<div class="col-xl-12">

							<div class="card-header" style="color: black; background-color: red; border: 0px;">영화 검색 목록</div>
							<br>				


                    <!-- Content Row -->
				<div class="row">
				<c:forEach items="${searchReMvList }" var="movie">
                 
                 
                 <div class="col-xl-3">
  
                <div class="card mb-4" style="padding-bottom: 10px;">
                 
                <div class="card-header mm font-weight-bold" style="background-color: red;">
                <a class="mm" href="${pageContext.request.contextPath }/MovieView?mvcode=${movie.mvcode}">${movie.mvname}</a>
                </div>

                 
				 <div class="card-body" style="background-color: white;">
				  <form>
                     <!-- Profile picture image-->
                <a href="MovieView?mvcode=${movie.mvcode}"><img class="img-fluid" src="${movie.mvposter}" alt="${movie.mvname }"></a>
                
               <p>
               <div class="card-footer1 mb-1" style="background-color: white;">
               <div class="text-xs font-weight-bold text-gray-900 mb-1 text-center">
                예매율 ${movie.reservationRatio}% | <i class="fa-regular fa-thumbs-up text-primary">${movie.goodRvcommend}</i> | <i class="fa-regular fa-thumbs-down text-danger">${movie.badRvcommend}</i>
                </div>  
                <div class="text-xs font-weight-bold text-gray-900 mb-1 text-center">
                ${movie.mvopen} 개봉
                </div>  
				
                
                </div>
                <div style="text-align: center;">
                
                 <a class="btn btn-primary" href="MovieReservationPage?mvcode=${movie.mvcode }">예매하기</a>
                </div> 
                </form>
                </div>
                
                </div> 
                 </div>
                 
                 </c:forEach>
                 
                 </div>
				</div>
				</div>
					
                <!-- /.container-fluid -->

 
            <!-- End of Main Content -->
			</div>
			</div>
			
			
			</div>
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
var checkMsg = '${msg}';
console.log(checkMsg);


if(checkMsg.length > 0){
	
	alert(checkMsg);
	
}
</script>


</html>