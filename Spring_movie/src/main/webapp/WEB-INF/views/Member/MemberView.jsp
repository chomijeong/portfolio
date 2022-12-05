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

    <title>내정보</title>
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
                        <h1 class="h3 mb-0 text-gray-800" style="text-align: center;"></h1>
                    </div>

                    <!-- Content Row -->
						<div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">프로필이미지</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath }/resources/mprofileUpLoad/${MemberView.mprofile}" alt="">
                                        <!-- Profile picture help block-->
                                        <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                        <!-- Profile picture upload button-->
                                        <button class="btn btn-primary" type="button">Upload new image</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">내정보</div>
                                    <div class="card-body">
                                        <form>
                                            <!-- Form Group (username)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputUsername">아이디</label>
                                                <input class="form-control" id="inputUsername" type="text" value="${MemberView.mid }" readonly="readonly">
                                            </div>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (first name)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPw">비밀번호</label>
                                                    <input class="form-control" id="inputPw" type="password"  value="${MemberView.mpw }" readonly="readonly">
                                                </div>
                                                <!-- Form Group (last name)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputName">이름</label>
                                                    <input class="form-control" id="inputName" type="text" value="${MemberView.mname }" readonly="readonly">
                                                </div>
                                            </div>
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (organization name)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputBirth">생년월일</label>
                                                    <input class="form-control" id="inputBirth" type="date" value="${MemberView.mbirth }" readonly="readonly">
                                                </div>
                                                <!-- Form Group (location)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputEmail">이메일</label>
                                                    <input class="form-control" id="inputEmail" type="email" value="${MemberView.memail }" readonly="readonly">
                                                </div>
                                            </div>
                                            <!-- 우편번호-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputPostcode">우편번호</label>
                                                <input class="form-control" id="inputPostcode" type="text" value="${MemberView.mpostcode }" readonly="readonly">
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputaddr">주소</label>
                                                <input class="form-control" id="inputaddr" type="text" value="${MemberView.maddr }" readonly="readonly">
                                            </div>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (phone number)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputmdetailAddr">상세주소</label>
                                                    <input class="form-control" id="inputmdetailAddr" type="text"  value="${MemberView.mdetailAddr }" readonly="readonly">
                                                </div>
                                                <!-- Form Group (birthday)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputmextraAddr">상세주소</label>
                                                    <input class="form-control" id="inputmextraAddr" type="text"  value="${MemberView.mextraAddr }" readonly="readonly">
                                                </div>
                                            </div>
                                            <!-- Save changes button-->
                                            <div style="text-align: center;">
                                            <button class="btn btn-primary" type="button">정보수정</button>
                                        	</div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>



                    <!-- Content Row -->


                    <!-- Content Row -->


                </div>
                <!-- /.container-fluid -->

            </div>
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
</html>