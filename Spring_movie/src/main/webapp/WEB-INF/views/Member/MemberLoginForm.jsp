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

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" rel="stylesheet">

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

        <div class="card o-hidden border-0 shadow-lg my-5" style="margin-left: auto; margin-right: auto; background-color: white;">
            
                <!-- Nested Row within Card Body -->
                <div class="row">
                 
                    <div class="col-lg-7" style="margin-left: auto; margin-right: auto; background-color: white;">
                        <div class="p-5">
                            <div class="text-center" style="padding-bottom: 20px;">
                                <h1 style="font-size: 30px;">로그인</h1>
                            </div>


                            <form class="user" action="memberLogin" method="post">
                                <div class="form-group">
                                	
                                    <div class="form-group">
                                    <label for="loginId" class="text-lg font-weight-bold" >아이디</label>
                                        <input type="text" class="form-control form-control-user"  style="border: 1px solid white;" id="loginId"
                                        name="LoginMid" placeholder="아이디">
                                            <span style="font-size: 10px;"></span>
                                    </div>
                                    <div class="form-group" >
                                    <label for="loginPw" class="text-lg font-weight-bold" >비밀번호</label>
                                        <input type="password" class="form-control form-control-user" style="border: 1px solid white;" id="loginPw"
                                           name="LoginMpw" placeholder="비밀번호">
                                    </div>
                                </div>
                               
                                <button type="submit" class="btn btn-user btn-block"  style="background-color: black;">
                                    로그인
                                </button>
                                
                            </form>
                            
                            <br>

                            <div class="text-center">
                                <a class="small" id="kakaoBtn"></a>
                           
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
<script type="text/javascript">
var checkMsg = '${msg}';
console.log(checkMsg);


if(checkMsg.length > 0){
	
	alert(checkMsg);
	
}
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('7a625a0351d76f9adb1de5e64de01df5');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
</script>
<script type="text/javascript">
Kakao.Auth.createLoginButton({
  container: '#kakaoBtn',
  size: 'large',
  success: function(response) {
    console.log(response);
    
    Kakao.API.request({
        url: '/v2/user/me',
        success: function(res) {
            console.log(res);
            
            console.log("res.id : "+res.id);
            console.log("res.kakao_account.email : "+res.kakao_account.email);
            console.log("res.kakao_account.profile.nickname : "+res.kakao_account.profile.nickname);
            console.log("res.kakao_account.profile.profile_image_url : "+res.kakao_account.profile.profile_image_url);
			location.href="kakaoLogin?kakaoId="+res.id+"&kakaoEmail="+res.kakao_account.email+"&kakaonickname="+res.kakao_account.profile.nickname+"&kakaoprofileurl="+res.kakao_account.profile.profile_image_url;
            // 아이디, 이메일, 닉네임, 프로필
            // controller -> service 아이디로 회원정보 조회
            // 조회되는 회원 정보가 있으면 로그인 처리 후 메인페이지로
            // 조회되는 회원 정보가 없으면 아이디, 이메일, 닉네임, 프로필, 회원가입 처리 >> 로그인페이지로
        
            
            
            
        },
        fail: function(error) {
            console.log(error);
        }
    });
    
    
  },
  fail: function(error) {
    console.log(error);
  },
});

</script>



</html>