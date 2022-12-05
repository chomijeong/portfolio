<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>영화예매</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css"
	rel="stylesheet">



</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="../includes/SideBar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Topbar -->
				<%@ include file="../includes/TopBar.jsp"%>
				<!-- End of Topbar -->


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->

					<!-- 영화 / 극장 / 날짜 및 시간 / 상영관 선택 -->
					<div class="row text-gray-100 text-lg">


						<div class="col-xl-3">

							<div class="card mb-4" style="padding-bottom: 20px; background-color: white;">


								<div class="card-header mi bg-gradient-info1 font-weight-bold">
									<h6>영화</h6>
								</div>

								<div class="card-body1 text-gray-900" id="MovieList" style="background-color: red;">
									<c:forEach items="${reMvList }" var="MovieRe">
										<div class="p-2 font-weight-bold text-lg text-center" id="${MovieRe.mvcode }" onclick="mvSelect(this,'${MovieRe.mvcode }','${MovieRe.mvposter }')" style="background-color: red;">${MovieRe.mvname }</div>
									</c:forEach>
								</div>

							</div>

						</div>


						<div class="col-xl-3">

							<div class="card mb-4" style="padding-bottom: 20px; background-color: white;">


								<div class="card-header mi bg-gradient-info1 font-weight-bold">
									<h6>극장</h6>
								</div>

								<div class="card-body1 text-gray-900" style="background-color: red;">


									<div class="p-2 font-weight-bold text-lg text-center"
										id="thList" style="background-color: red;"></div>
								</div>
							</div>

						</div>


						<div class="col-xl-3">

							<div class="card mb-4" style="padding-bottom: 20px; background-color: white;">


								<div class="card-header mi bg-gradient-info1 font-weight-bold">
									<h6>날짜</h6>
								</div>

								<div class="card-body1 text-gray-900" style="background-color: red;">

									<div class="p-2 font-weight-bold text-lg text-center"
										id="scDateList" style="background-color: red;"></div>
								</div>

							</div>

						</div>


						<div class="col-xl-3">

							<div class="card mb-4" style="padding-bottom: 20px; background-color: white;">


								<div class="card-header mi bg-gradient-info1 font-weight-bold">
									<h6>상영관</h6>
								</div>

								<div class="card-body1 text-gray-900" style="background-color: red;">

									<div class="p-2 font-weight-bold text-lg"
										id="scroomList" style="background-color: red;"></div>
								</div>

							</div>z

						</div>

					</div>


					<!-- Content Row -->


					<!-- Content Row -->

					<!-- 선택 항목 확인 -->
					<div class="row text-gray-100 text-lg">

						<div class="col-xl-12" >

							<div class="card1 mb-1" style="border: 0px;">


								<div class="card-header"
									style="color: black; background-color: white; text-align: center;">선택 정보 확인</div>
									
									</div>
									
								
									<div class="row text-gray-100 text-lg">

										<div class="col-xl-3">

											<div class="card mb-4" >



												<div class="card-header"
													style="color: black; background-color: red; text-align: center;" id="viewSelMvName">
													<br>


												</div>
												<div class="card-body text-gray-900" style="background-color: white;">
													<img class="img-fluid" id="viewSelMvPoster">

												</div>

												<div class="p-2 font-weight-bold text-lg text-center"></div>
											</div>
										</div>
										<div class="col-xl-3" >

											<div class="card mb-4" style="padding-bottom: 20px;">

											  <div class="card-header"  style="background-color: red; color: black; border-bottom: 0px;">
												선택 극장 및 상영관 정보</div>
												<div class="card-body" style="background-color: white;">

													<div class="card-body1" >
														<span class="selectView" style="color: black;">극장 : </span> <span
															id="viewSelThName" style="color: black;"></span>

													</div>
													<div class="card-body" >
														<span class="selectView" style="color: black;" >일시 : </span> 
														<span id="viewSelScDate" style="color: black;"></span> <span id="viewSelScTime" style="color: black;"></span>

													</div>
													<div class="card-body" >
														<span class="selectView" style="color: black;" >상영관 : </span> <span
															id="viewSelScRoom" style="color: black;"></span>
													</div>
													<div class="card-body" >
														<span class="selectView" style="color: black;">인원 : </span> <span
															id="viewSelpeople"  style="color: black;"></span> <span id="viewpeopleText"
															style="display: none; color: black;"  >명</span>
													</div>
												</div>

											</div>


										</div>
										
										
										<div class="col-xl-3">

											<div class="card mb-4" style="padding-bottom: 20px;">
												<div class="card-header"
													style="color: black; background-color: red; border-bottom: 0px;" >인원수 선택</div>
												<div class="p-2 font-weight-bold text-lg text-center"  style="background-color: white;" >
													<div class="card-body1 text-gray-900" id="peopleList" style="background-color: white;">
														<button style="background-color: red;"
															class="btn btn-red" onclick="peopleSelect(this)">1</button>
														<button style="background-color: red;"
															class="btn btn-red" onclick="peopleSelect(this)">2</button>
														<button style="background-color: red;"
															class="btn btn-red" onclick="peopleSelect(this)">3</button>
														<button style="background-color: red;"
															class="btn btn-red" onclick="peopleSelect(this)">4</button>
														<button style="background-color: red;"
															class="btn btn-red" onclick="peopleSelect(this)">5</button>

													</div>
												</div>
											</div>
										</div>

										<div class="col-xl-3">

											<div class="card mb-4" style="padding-bottom: 20px;">
											<div class="card-header"
													style="color: black; background-color: red; border-bottom: 0px;">예매하기</div>
												<div class="p-2 font-weight-bold text-lg text-center" style="background-color: white;">	
												<form action="MovieReservation" method="post" onsubmit="return reservationFormCheck();">
													<br>
													<input type="text" name="remid" id="remid" value="${sessionScope.LoginMid }" placeholder="예매자아이디">
													<input type="text" name="rescthcode" id="rescthcode" placeholder="극장코드"> 
													<input type="text" name="rescroom" id="rescroom" placeholder="상영관"> 
													<input type="text" name="rescdate" id="rescdate" placeholder="날짜및시간">
													<input type="text" name="reamount" id="reamount" placeholder="예매인원">
													<input class="btn btn-red text-lg p-2"  type="submit" value="예매하기">
												</form>
												</div>
											</div>
										</div>
									</div>

								</div>
							
						
					</div>
				</div>

				<!-- Content Row -->
			</div>

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


	<!-- End of Content Wrapper -->


	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a> 


               






</body>


<!-- Bootstrap core JavaScript-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script
	src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
<script type="text/javascript">
	var checkMsg = '${msg}';
	console.log(checkMsg.length);
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
	
	
	
	
	
	
	
	
	
</script>

<script type="text/javascript">
	var selectReMvcode = ""; // 선택한 영화코드
	var selectReThcode = ""; // 선택한 극장코드
	var selectReScDate = "";

	function mvSelect(selObj, selMvcode, selMvposter) {
		selectReMvcode = selMvcode;
		/* 극장 선택 내용 초기화 */
		$("#viewSelThName").text("");
		/* 날짜 선택 내용 초기화 */
		$("#viewSelScDate").text("");
		/* 상영관 및 시간 선택 내용 출력 */
		$("#viewSelScTime").html("");
		$("#viewSelScRoom").html("");

		/* 날짜 목록 초기화 */
		$("#scDateList").html("");
		/* 상영관 및 시간 목록 초기화  */
		$("#scroomList").html("");

		/* 예매정보 form 초기화 */
		/* rescthcode rescroom rescdate */
		$("#rescthcode").val("");
		$("#rescroom").val("");
		$("#rescdate").val("");

		/* 영화목록 CSS 변경 */
		$("#MovieList div").css("background-color", "").css("color", "");
		$(selObj).css("background-color", "black").css("color", "white");

		console.log("선택 영화 코드 : " + selMvcode);

		var output = "";
		/* 극장 목록 조회 및 출력 */
		$.ajax({

					type : "get",
					url : "getThList",
					data : {
						"mvcode" : selMvcode
					},
					dataType : "json",
					async : false,
					success : function(thList) {

						console.log(thList)
						for (var i = 0; i < thList.length; i++) {
							console.log(thList[i].thname);
							output += "<div class=\"p-2 font-weight-bold text-lg mm\" onclick=\"thSelect(this, '"
									+ thList[i].thcode
									+ "')\">"
									+ thList[i].thname + "</div>"

						}

					}

				});
		$("#thList").html(output);

		console.log("선택 영화 제목 : " + $(selObj).text());
		console.log("선택 영화 포스터 : " + selMvposter);

		$("#viewSelMvPoster").attr("src", selMvposter);
		$("#viewSelMvName").text($(selObj).text());

	}

	function thSelect(selObj, selThcode) {
		selectReThcode = selThcode;
		
		selectReScDate = "";

		/* 날짜 선택 내용 초기화  */
		$("#viewSelScDate").text("");
		/* 상영관 및 시간 목록 초기화 */
		$("#scroomList").html("");
		/* 상영관 및 시간 선택 내용 초기화 */
		$("#viewSelScTime").text("");
		$("#viewSelScRoom").text("");

		/* 예매정보 form 초기화 */
		$("#rescroom").val("");
		$("#rescdate").val("");

		/* 극장목록 CSS변경 */
		$("#thList div").css("background-color", "").css("color", "");
		$(selObj).css("background-color", "black").css("color", "white");
		console.log("선택 극장 이름 : " + $(selObj).text());
		console.log("선택 극장 코드 : " + selThcode)

		/* 예매 가능한 날짜 목록 조회 및 출력 */
		var output = "";
		$.ajax({

					type : "get",
					url : "getScDateList",
					data : {
						"mvcode" : selectReMvcode,
						"thcode" : selectReThcode
					},
					dataType : "json",
					async : false,
					success : function(scDateList) {

						

						for (var i = 0; i < scDateList.length; i++) {
							
							output += "<div class=\"p-2 font-weight-bold text-lg mm\" onclick=\"scSelect(this, '"
									+ scDateList[i].scdate
									+ "')\">"
									+ scDateList[i].scdate + "</div>"

						}

					}

				});
		$("#scDateList").html(output);

		/* 선택 내용 출력 */
		$(".selectView").removeClass("selectView");
		$("#viewSelThName").text($(selObj).text());
		
		/* 예매정보 form */
		$("#rescthcode").val( selThcode );
		

	}

	function scSelect(selObj, selScDate) {
		
		selectReScDate = selScDate;
		
		/* 날짜목록 CSS변경  */
		$("#scDateList div").css("background-color", "").css("color", "");
		$(selObj).css("background-color", "black").css("color", "white");

		/* 선택 내용 초기화 */
		$("#viewSelScTime").text("");
		$("#viewSelScRoom").text("");

		/* 예매 정보 form 초기화*/
		$("#rescroom").val("");
		$("#rescdate").val("");

		/* 예매 가능한 상영관 및 시간 조회 및 출력 */
		var output = "";
		/* 극장 목록 조회 및 출력 */
		$
				.ajax({

					type : "get",
					url : "getScroomList",
					data : {
						"mvcode" : selectReMvcode,
						"thcode" : selectReThcode,
						"scdate" : selScDate
					},
					dataType : "json",
					async : false,
					success : function(scroomList) {

						console.log(scroomList);

						var scRoom = ""; // 상영관
						for (var i = 0; i < scroomList.length; i++) {

							if (scRoom != scroomList[i].scroom) {

								if (i != 0) {

									output += "<hr class\"my-1\">";
								}
								output += "<div class=\"p-1 font-weight-bold text-lg\">"
										+ scroomList[i].scroom + "</div>"
								scRoom = scroomList[i].scroom;

							}

							output += "<button class=\"btn font-weight-bold btn-primary ml-1 my-2 mr-1\" onclick=\"scroomTime(this, '"
									+ scroomList[i].scroom
									+ "')\">"
									+ scroomList[i].scdate + "</div>"

						}

					}

				});
		$("#scroomList").html(output);

		/* 선택 내용 출력 */
		$("#viewSelScDate").text($(selObj).text());

	}

	function scroomTime(selObj, scroom) {
		/* 상영관 및 시간 목록 CSS변경 */

		console.log("일자 : " +selectReScDate);
		
		$("#scroomTime button").css("background-color", "").css("color", "");
		$(selObj).css("background-color", "white").css("color", "black");

		/* 상영관 및 시간 선택 내용 출력 */
		$("#viewSelScTime").text($(selObj).text());
		$("#viewSelScRoom").text(scroom);

		/* 예약 정보 form */
		$("#rescdate").val(selectReScDate + " " + $(selObj).text());
		$("#rescroom").val(scroom);

	}

	function peopleSelect(selObj) {
		/* 인원수 선택 목록 Css 변경 */
		$("#peopleList button").css("background-color", "").css("color", "");
		$(selObj).css("background-color", "red").css("color", "white");

		/* 상영관 및 시간 선택 내용 출력 */
		$("#viewSelpeople").text($(selObj).text());
		$("#viewpeopleText").css("display","");

		/* 예약 정보 form */
		$("#reamount").val($(selObj).text());

		
	}
	function reservationFormCheck() {

		if (selectReMvcode.length == 0) {
			alert("영화를 선택해 주세요!");
			return false;
		}
		if ($("#rescthcode").val().length == 0) {
			alert("극장을 선택해 주세요!");
			return false;
		}
		if (selectReScDate.length == 0) {
			alert("날짜를 선택해 주세요!");
			return false;
		}
		if ($("#rescroom").val().length == 0
				|| $("#rescdate").val().length == 0) {
			alert("상영관 및 시간을 선택해 주세요!");
			return false;
		}
		if ($("#reamount").val().length == 0) {
			alert("예매인원을 선택해 주세요!");
			return false;
		}

		if ($("#remid").val().length == 0) {
			alert("로그인 후 이용 가능 합니다.");
			location.href= "memberLoginForm";
			
			return false;
		}

	}
</script>
<script type="text/javascript">
	var checkMvCode = '${param.mvcode}';
	console.log("checkMvCode: " + checkMvCode);
	if (checkMvCode.length > 0) {
		$("#" + checkMvCode).click();

	}
</script>



</html>