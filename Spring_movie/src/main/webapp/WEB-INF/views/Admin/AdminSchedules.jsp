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
	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
>


<style type="text/css">
.ui-datepicker-inline,.ui-datepicker,.ui-widget,.ui-widget-content,.ui-helper-clearfix,.ui-corner-all
{
 width: auto;
 height: auto;

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
                        <h1 class="h3 mb-0 text-gray-800">관리자 스케쥴 등록 - AdminRegistSchedule.jsp</h1>
                    </div>
				<!-- Content Row -->
				<form action="adminSchedules" method="post" onsubmit="return registScFormCheck();">
				
				<div class="row text-gray-100 text-lg">


						<div class="col-xl-4">

							<div class="card mb-5" style="padding-bottom: 20px; background-color: red;">


								<div class="card-header" style="background-color: red; text-align: center;">
									<h6>영화</h6>
								</div>

								<div class="card-body1 text-gray-900 scrolle" id="MovieList" style="background-color: white;">
									<c:forEach items="${MovieList }" var="Movie">
										<div class="p-2 font-weight-bold text-lg" id="${Movie.mvcode }" onclick="mvSelect(this,'${Movie.mvcode }')" style="background-color: white;">${Movie.mvname }</div>
									</c:forEach>
								</div>

							</div>

						</div>


						<div class="col-xl-4">

							<div class="card mb-5" style="padding-bottom: 20px; background-color: red;">


								<div class="card-header" style="background-color: red; text-align: center;">
									<h6>극장</h6>
								</div>

								<div class="card-body1 text-gray-900" id="thList" style="background-color: white; height: 331px;">
								  <c:forEach items="${thList }" var="thList">		
									<div class="p-2 font-weight-bold text-lg" id="${thList.thcode }" onclick="thSelect(this,'${thList.thcode }')" style="background-color: white;">${thList.thname }</div>
								  </c:forEach>
						
								</div>
							</div>

						</div>


						<div class="col-xl-4">

							<div class="card mb-5" style="padding-bottom: 20px; background-color: red;">


								<div class="card-header" style="background-color: red; text-align: center;">
									<h6 style="color:white;">날짜</h6>
								</div>

								<div class="card-body1 text-gray-900" style="background-color: white;">
									<div id="datepicker" ></div>
								</div>

							</div>

						</div>

						</div>
						
						<div class="row">

						<div class="col-xl-5">

							<div class="card mb-6" style="padding-bottom: 20px; background-color: red;">


								<div class="card-header" style="background-color: red;  text-align: center;">
									<h6 style="color:white;">상영관 및 시간</h6>
								</div>

								<div class="card-body1 text-gray-900 scrolle" style="background-color: white;" id="roomTimeList" >

								
								
								</div>


							</div>

						</div>

					
				
				
				<!-- Content Row -->
						<div class="col-xl-4 col-lg-4" >
                            <div class="card mb-2" style="background-color: red; padding-bottom: 20px;">
                                <div class="card-header py-3 text-center" style="background-color: red;" >
                                    <h6 class="m-0 font-weight-bold h5 text-white" style="background-color: red;">선택 확인
                                    </h6>
                                </div>
                                <div class="card-body listArea text-gray-900"  style="background-color: white;">
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control" id="scmvcode" name="scmvcode" type="text"  readonly="readonly" placeholder="영화코드">
                                </div>
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control" id="scthcode" name="scthcode" type="text"  readonly="readonly" placeholder="극장코드">
                                </div>
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control" id="scdate" name="scdate" type="text"  readonly="readonly" placeholder="날짜">
                                </div>
                                <br>
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control btn-red" type="submit"  value="스케쥴등록">
                                </div>                                
                                </div>
                            </div>
						</div>
										
										</div>	
										</form>
									</div>

								</div>
				
					</div>
					
				<!-- Content Row -->
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</div>


			<!-- /.container-fluid -->


		<!-- End of Main Content -->

		
		
<footer class="sticky-footer bg-black font-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto font-white">
					<span>Copyright &copy; Your Website 2022</span>
				</div>
			</div>
		</footer>

	<!-- End of Content Wrapper -->


	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> 
	<i class="fas fa-angle-up"></i>
	</a> 

 

<!-- Footer -->
		
		<!-- End of Footer -->




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
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">

$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
});

$(function() {
    $("#datepicker").datepicker({
    	onSelect:function(selDate){
    		selectSchedulesDate = selDate;
    		$("#scdate").val(selectSchedulesDate);
    		getScroomList();
    	}
    	
    	
    	
    });
  } );

</script>

<script type="text/javascript">
var selectMovieCode = "";
var selectTheaterCode = "";
var selectSchedulesDate = "";


function mvSelect(selObj,mvcode){
	/* 영화목록 CSS 변경 */
	$("#MovieList div").css("background-color","").css("color","");
	$(selObj).css("background-color","red").css("color","white");
	$("#scmvcode").val(mvcode);
	
	selectMovieCode = mvcode;
	getScroomList();
	
}

function thSelect(selObj,thcode){
	/* 극장목록 CSS 변경 */
	$("#thList div").css("background-color","").css("color","");
	$(selObj).css("background-color","red").css("color","white");
	$("#scthcode").val(thcode);
	
	selectTheaterCode = thcode;
	
	
	getScroomList();
}




function selectScroomList(selObj){
	if($(selObj).hasClass("bg-a")){
		$(selObj).removeClass("bg-a").css("color","");
	} else {
		$(selObj).addClass("bg-a").css("color","white");
	}
}


function getScroomList(){
	if(selectMovieCode.length > 0 && selectTheaterCode.length > 0 && selectSchedulesDate.length >0){
	
	var thRoomList = ['1관','2관','3관','4관','5관','6관','7관','8관'];
	var thTimeList = ['09:00', '11:30', '14:00', '16:30', '19:00', '21:30'];
	console.log(scdate);
	
	var output = "";
	
	$.ajax({
		type : "get",
		url : "adminScRoomTimeList",
		data : {"thcode" : selectTheaterCode, "scdate" : selectSchedulesDate},
		dataType : "json",
		success : function(result){
			for(var roomIdx = 0; roomIdx < thRoomList.length; roomIdx++){
				output += "<div class=\"p-1 font-weight-bold text-lg\">"+thRoomList[roomIdx]+"</div>"
				var registTime = []; // 09:00 , 13:00
				var registMvName = [];
				for(var i =0; i < result.length; i++){
					
					if(thRoomList[roomIdx] == result[i].scroom){
						registTime.push(result[i].scdate);
						registMvName.push(result[i].scmvcode);
						
					}
					
					
				}
				
				for(var timeIdx = 0; timeIdx < thTimeList.length; timeIdx++){
					if(registTime.includes(thTimeList[timeIdx])){
						var mvNameIdx = registTime.indexOf(thTimeList[timeIdx]);
						output += "<button title\""+registMvName[mvNameIdx]+"\"disabled class=\"btn btn-sm btn-danger scTimeBtn font-weight-bold mx-1 my-2\">"+thTimeList[timeIdx]+"</button>";
						
					
					}else{
						output += "<input class=\"d-none\" id=\""+thRoomList[roomIdx]+thTimeList[timeIdx]+"\" type=\"checkbox\" name=\"scRoomTime\" value=\""+thRoomList[roomIdx]+" "+thTimeList[timeIdx]+"\">"
						output += "<label class=\"btn2 btn-sm scTimeBtn font-weight-bold mx-1 my-2\" style=\"border: 1px solid black;\" for=\""+thRoomList[roomIdx]+thTimeList[timeIdx]+"\" onclick=\"selectScroomList(this)\">"+thTimeList[timeIdx]+"</label>";
						
					}
					
				}
				
				
			}
			
			$("#roomTimeList").html(output);
			
		}
		
		
		
		
	});

}
	
	
	}


function registScFormCheck(){
	console.log($(".testBtn").is(":disabled"));
	
	
	if(selectMovieCode.length == 0){
		alert("영화가 선택되지 않았습니다.");
		return false;
	}
	
	if(selectTheaterCode.length == 0){
		alert("극장이 선택되지 않았습니다.");
		return false;				
	}
	
	if(selectSchedulesDate.length == 0){
		alert("날짜가 선택되지 않았습니다.");
		return false;				
	}

	var checkBox = $("input[name=scRoomTime]").is(":checked");
	console.log(checkBox);
	if(!checkBox){
		alert("상영관 및 시간이 선택되지 않았습니다.");
		return false;				
	}
	
	         
	
	
}

</script>








</html>