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

    <title>회원가입</title>
	 <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
					 <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5" style="margin-left: auto; margin-right: auto; background-color: black;">
            
                <!-- Nested Row within Card Body -->
                <div class="row">
                 
                    <div class="col-lg-7" style="margin-left: auto; margin-right: auto; background-color: black;">
                        <div class="p-5">
                            <div class="text-center" style="color:white; padding-bottom: 20px;">
                                <h1 style="font-size: 30px;">회원가입</h1>
                            </div>
                            <form class="user" action="memberJoin" method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck()">
                                <div class="form-group">
                                	
                                    <div class="form-group">
                                    <label for="inputMid" class="text-lg font-weight-bold">아이디</label>
                                        <input type="text" class="form-control form-control-user"  style="border: 1px solid white;" id="inputMid"
                                        name="mid" placeholder="아이디">
                                            <span style="font-size: 10px;" id="idCheckMsg"></span>
                                    </div>
                                    <div class="form-group">
                                    <label for="inputMpw" class="text-lg font-weight-bold">비밀번호</label>
                                        <input type="text" class="form-control form-control-user" id="inputMpw"
                                           name="mpw" placeholder="비밀번호">
                                    </div>
                                </div>
                                <div class="form-group">
                                	
                                    <div class="form-group">
                                    <label for="inputMname" class="text-lg font-weight-bold">이름</label>
                                        <input type="text" class="form-control form-control-user" id="inputMname"
                                        name="mname" placeholder="이름">
                                    </div>
                                    <div class="form-group">
                                    <label for="inputMbirth" class="text-lg font-weight-bold">생년월일</label>
                                        <input type="date" class="form-control form-control-user" id="inputMbirth" name="mbirth" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                <label for="inputemail" class="text-lg font-weight-bold">이메일</label>
                                    <input type="email" class="form-control form-control-user" id="inputemail"
                                        name="memail" placeholder="이메일" required="required">
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                
                                </div>
                                <div class="form-group row">
                                    <div class="col-12 mb-3 mb-sm-0">
                                    <label for="inputMaddress" class="text-lg font-weight-bold">주소</label>
                                    <br>
                                    </div>
                                    
                                    <div class="col-sm-6 mb-3 mb-sm-0"> 
                                        <input type="text" class="form-control form-control-user"
                                           name="mpostcode" id="sample6_postcode" placeholder="우편번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="button" class="btn btn-primary btn-user btn-block" 
                                        onclick="sample6_execDaumPostcode()" value="우편찾기">
                                    </div>
                                    
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="sample6_address"
                                       name="maddr" placeholder="주소입력">
                                </div>
                                  <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="mdetailAddr"
                                           id="sample6_datailAddress" placeholder="상세주소">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="mdetailAddrtip"
                                           id="sample6_extraAddress" placeholder="참조항목">
                                    </div>

                                </div>
								<div class="form-group">
									 
                                    <label for="inputMfilename" class="text-lg font-weight-bold">프로필이미지</label>
                                    
                                        <input type="file" style="padding-top: 10px; padding-bottom: 38px;" class="form-control form-control-user" id="inputMfilename"
                                        name="mfile" >

                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    회원가입
                                </button>
                                
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
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


    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>



</body>
<!-- 다음 우편번호 서비스 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/resources/Member.js/daumPostCode.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	console.log("스크립트 확인");	
		$("#inputMid").focusout(function(){
			var inputId = $("#inputid").val();
			console.log("inputId : "+inputId);
			
			if(inputId.length == 0){
				$("#idCheckMsg").text("아이디를 입력하시오.").css("color", "deeppink");		
				
			}else{
				
				$.ajax({
					type : "get",
					url : "memeberIdCheck",
					data : { "inputId" : inputId },
					success : function(result){
						if(result == "ok"){
						$("#idCheckMsg").text("사용가능").css("color", "greenyellow");
						
						}else{		
							
						$("#idCheckMsg").text("ID already in use!").css("color", "greenyellow");					
						
						}
					}
				})
			}
		});
});
</script>

<script type="text/javascript">
function joinFormCheck(){
	
	/* 아이디 입력 확인 */
	if(!inputMId){
		
		alert("아이디를 입력 해주세요!");
		$("#inputMId").focus();
		
		return false;
		
		
	}
	
	if($("#inputMpw").val().length == 0){
		
		alert("비밀번호를 입력해주세요!");
		$("#inputMpw").focus();
		
		return false;
		
		
	}
	if($("#inputMname").val().length == 0){
		
		alert("이름을 입력 해주세요!");
		$("#inputMname").focus();
		
		return false;
		
	}
	
	
}
</script>



</html>