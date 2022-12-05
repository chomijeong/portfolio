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

    <title>관리자 회원 관리 목록</title>


	 <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" rel="stylesheet">

<script src="https://kit.fontawesome.com/2f771efc6f.js"
	crossorigin="anonymous"></script>

	<link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style type="text/css">
	
		.btn_dNone{
			display: none;
		}
	
	</style>
	
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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 회원관리 - AdminMember.jsp</h1>
                    </div>
                    <!-- Content Row -->
                    <!-- DataTables Example -->
                     <div class="card shadow mb-4" style="background-color: red; padding-bottom: 20px;">
                        <div class="card-header py-3 text-center" style="background-color: red;">
                            <h6>회원목록</h6>
                        </div>
                        <div class="card-body1" style="background-color: white;">
                            <div class="table-responsive">
                                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="background-color: white; border: 1px solid black; text-align: center;">
                                    <thead>
                                        <tr>
                                            <th style="color: black; min-width: 80px;">프로필이미지</th>
                                            <th style="color: black; min-width: 80px;">회원아이디</th>
                                            <th style="color: black; min-width: 80px;">회원이름</th>
                                            <th style="color: black; min-width: 80px;">회원이메일</th>
                                            <th style="color: black; min-width: 80px;"></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${mList }" var="Member">
                                        <tr class="font-weight-bold">
                                        	<td style="color: black; text-align: center;" class="align-middle">
                                        					<c:choose>
                                        						
															<c:when test="${Member.mbirth != null }">
														
															<img style="width: 50px;"class="img-profile rounded-circle" src="${pageContext.request.contextPath }/resources/mprofileUpLoad/${Member.mprofile}">
															</c:when>
															
															<c:otherwise>
															<img style="width: 50px;"class="img-profile rounded-circle" src="${Member.mprofile}">
														</c:otherwise>
                                        			</c:choose>
                                        	</td>
                                            <td style="color: black;" class="align-middle font-weight-bold" >
                                            	${Member.mid }
                                            </td>
                                            <td style="color: black;" class="align-middle">${Member.mname }</td>
                                            <td style="color: black;" class="align-middle">${Member.memail }</td>
                                            <td style="color: black;" class="align-middle text-center">                                          	
                                            	<c:choose>
                                            		<c:when test="${Member.mstate == '1' }">
                                            			<button class="btn btn-primary font-weight-bold" onclick="mState(this,'${Member.mid }')">계정사용</button>
                                            			
                                            		</c:when>
                                            		<c:when test="${Member.mstate == '0' }">
                                            			<button  class="btn btn-red font-weight-bold" onclick="mState(this,'${Member.mid }')">계정중지</button>
                                            		</c:when>                                           		
                                            	</c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                </table>
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

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
    
    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>    
    

	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>
	
	<script type="text/javascript">
		function mState(btnObj, mid){
			console.log("회원아이디 : " +mid);
			console.log($(btnObj).text());
			if($(btnObj).hasClass("btn-primary")){
				var mstate = '0';
			} else if($(btnObj).hasClass("btn-red")){
				
				
				var mstate = '1';
				
				
					// 회원아이디 : mid >> number 타입 변환 O:: 카카오 회원 mstate =2
					// 회원아이디 : mid >> number 타입 변환 x:: 일반 회원 mstate = 1
					
				
			}
			console.log(mstate)
			
			$.ajax({
				type : "get",
				url : "adminModifyMemberState",
				data : { "mid" : mid, "mstate" : mstate },
				success : function(result){
					console.log("result : " + result);
					if( result == '1' ){
						
						if( mstate == '0'){
							
							$(btnObj).text("계정중지")
						} else if( mstate == '1'){
							$(btnObj).text("계정사용")
						}
						$(btnObj).toggleClass("btn-primary");
						$(btnObj).toggleClass("btn-red");
					}
				}
			});
		}

	</script>

</body>

</html>