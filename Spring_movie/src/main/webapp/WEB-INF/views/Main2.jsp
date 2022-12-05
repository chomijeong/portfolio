<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="bg-gradient-primary" style="background-color: black;">
	
	<!-- 외부에서는 바로 WEP-INF안에 View폴더로 바로 접근이 불가능하다. -->
	<!-- 그러므로 page에서 page로 이동할 경우에도 controller에 요청하여 이동하게 된다. -->
	
	<!--  <a href="${pageContext.request.contextPath}/memberJoinForm">회원가입페이지</a>-->
	<!-- /memberJoinForm이면 ip:포트/memberJoinForm -->
	<!-- memberJoinForm이면 ip:포트/controller/memberJoinForm -->
	<!-- 둘 중 어떤것을 페이지를 지정해야할지 헷갈린다고 하면 ${pageContext.request.contextPath}를 붙여서 페이지를 지정해주면 된다. -->
	<!-- Tomcat server에 path가 /controller 이므로 "ip:포트/controller/memberJoinForm"형식으로 접속-->
	
	
	
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
							<button class="btn" style="background-color: black; height: 100px;">일반회원페이지</button>
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
<script type="text/javascript">
	function adminMain(){
		var confirmVal = confirm("확인");
		console.log(confirm);
		
		
		
		var inputPw = prompt("비밀번호 입력");
		console.log(inputPw);
		
		
	}
</script>

</html>