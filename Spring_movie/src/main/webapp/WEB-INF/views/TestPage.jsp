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

    <title>TestPage</title>
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
                        <h1 class="h3 mb-0 text-gray-800">테스크페이지 - TestPage.jsp</h1>
                    </div>
						<h2 class="h3 mb-0 text-gray-800">로그인 아이디 : ${sessionScope.LoginMid }</h2>
                        <h2 class="h3 mb-0 text-gray-800">로그인 프로필 : ${sessionScope.LoginProfile }</h2>
                    <!-- Content Row -->
                    	<input type="text" id="userName">
                    	<input type="text" id="Comment">
					 	<button class="btn1" onclick="msgSendTest()">테스트버튼</button>

					 	<div style="color:white;" class="btn btn-red" id="receiveMsg"></div>
					 	
					 	<hr>
					 	
					 	
					 	
					
					 	
					 	
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
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">
var testUrl = 'testWskMessage';
var sock = new SockJS(testUrl);
sock.onopen = function() {
    console.log('open');

};

sock.onmessage = function(e) { // message를 받으면 실행되는 부분
    console.log('message', e.data);
 	var receiveData = JSON.parse(e.data);
 	console.log(receiveData)
 	var output = "<p>"+e.data+"<p>";
 	$("#receiveMsg").append(output); // append: 기존에 있던 글을 그대로 두고 글을 추가하는 방식
 	
 	
};

sock.onclose = function() {
    console.log('close');
};

</script>
<script type="text/javascript">
function msgSendTest(){
	var userName = ${sessionScope.LoginMid};
	var Comment = $("#Comment").val();
	$("#Comment").val("");
	
	var msgData = {
			"msgUserId" : userName,
			"msgComment" : Comment
			
	}
	console.log(msgData.msgUserId);
	console.log(JSON.stringify(msgData)); // json형식/형태를 문자열로 형변환시켜준다.
	sock.send(JSON.stringify(msgData)); // client - server간에 전달하는 데이터 형식 : 문자열
						// >> client <-> server :json형식의 문자열
	
}
</script>



</html>