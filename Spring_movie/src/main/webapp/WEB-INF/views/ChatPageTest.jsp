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

    <title>ChatPage</title>
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
                        <h1 class="h3 mb-0 text-gray-800">채팅 - ChatPage.jsp</h1>
                    </div>
						<h2 class="h3 mb-0 text-gray-800">로그인 아이디 : ${sessionScope.LoginMid }</h2>
                        
                    <!-- Content Row -->
                    	<div class="row">
                    	
                    	<div class="col-xl-4">
                    	<div class="card mb-5" style="padding-bottom: 20px; background-color: red;">
                    	<div class="card-header" style="background-color: red; text-align: center;">
                    	<h6>메세지 입력</h6>
                    	</div>
                    	<div class="card-body" style="background-color: white; text-align: center;">
                    	<input type="text" id="userName" placeholder="보내는 사람">
                    	<br>
                    	<input type="text" id="ChatMsg" placeholder="내용">
                    	<br>
                    	<br>
                    	<button class="btn btn-red" onclick="ChatMsgs()" style="width: 200px;">전송</button>                 	
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
var testUrl = "${pageContext.request.contextPath}/WebSocketTest";
// 우리가 직접 만드는 변수. url 경로
//servlet.context.xml의 path를 거쳐서 sockethandler로 연결 시켜준다.
var sock = new SockJS(testUrl);// 채팅방을 만드는 변수.
// 다른 채팅방을 만들기 위해서는 다른 변수를 만들면 된다.
// 단, 추가적으로 sock에 대한 변수에 맞게 변경해서 추가 선언해서 만들어야한다.
// servlet.context.xml의 path를 거쳐서 sockethandler로 연결 시켜준다.


sock.onopen = function() {
    console.log('open');

};

sock.onmessage = function(e) { // message를 받으면 실행되는 부분
    console.log('message', e.data);
 	var receiveData = JSON.parse(e.data);
 	console.log("receiveData : "+receiveData)
	var output = "<p>"+receiveData.msgUserId+"</p>";
	    output += "<p>"+receiveData.msgComment+"</p>";
 	$("#MsgResult").append(output); 
 	// append: 기존에 있던 글을 그대로 두고 글을 추가하는 방식
 	
 	// onopen / onclose는 내가 실행을 하는 것이 아니라 강제로 실행이 되는것.
 	
};

sock.onclose = function() {
    console.log('close');
};

</script>
<script type="text/javascript">
//메세지를 보내는 스크립트
function ChatMsgs(){
	var userName = '${sessionScope.LoginMid}';
	var ChatMsg	 = $("#ChatMsg").val();
	$("#ChatMsg").val("");
	
	var msgData = {
			"msgUserId" : userName,
			"msgComment" : ChatMsg
			
	};
	
	console.log(msgData.msgUserId);
	console.log(JSON.stringify(msgData));
	// json형식/형태를 문자열로 형변환시켜준다.
	sock.send(JSON.stringify(msgData)); 
	// client - server간에 전달하는 데이터 형식 : 문자열
	// >> client <-> server :json형식의 문자열
	
				
	}					
</script>
</html>