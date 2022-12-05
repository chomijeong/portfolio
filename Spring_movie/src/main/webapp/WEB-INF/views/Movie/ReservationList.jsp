<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>예매내역</title>
	 <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Gowun+Dodum&display=swap" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/2f771efc6f.js" crossorigin="anonymous"></script>

	
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

                    </div>
                    <!-- Content Row -->
					   <div class="card shadow mb-4" style="background-color: red; padding-bottom: 20px;">
                        <div class="card-header py-3 text-center" style="background-color: red;">
                            <h6 style="background-color: red;">영화예매내역</h6>
                        </div>
                        <div class="card-body1" style="background-color: white;">
                            <div class="table-responsive">
                      			
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="background-color: white; border: 1px solid black;">
                                    <thead style="border: 1px solid black;">
                                        <tr>
                                        	<th style="color: black;"></th>
                                        	<th style="color: black; ">영화제목</th>
                                            <th style="color: black;">극장</th>
                                            <th style="color: black;">상영관</th>
                                            <th style="color: black;">일시</th>
                                            <th style="color: black;">예매인원</th>
                                            <th style="color: black;">내역</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                
                                   	<c:set var="today" value="<%=new Date() %>"></c:set>
                                    <c:forEach items="${reservList }" var="reList">
                                        <tr>
                                        
                                        	<td style="color: black;"><a href="MovieView?mvcode=${reList.mvcode}"><img class="img-fluid" style="height: 70px; width: auto;"src="${reList.mvposter }" alt="${reList.mvname }"></a></td>
                                            <td style="color: black;"><a href="MovieView?mvcode=${reList.mvcode}">${reList.mvname }</a></td>
                                            <td style="color: black;">${reList.thname }</td>
                                            <td style="color: black;">${reList.scroom }</td>
                                            <td style="color: black;">${reList.scdate }</td>
                                            <td style="color: black;">${reList.reamount }</td>
                                            
                                            <th>
                                            <fmt:parseDate value="${reList.scdate }" var="scdate_fm" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
                                            <c:choose>
                                            <c:when test="${scdate_fm > today}">
                                            <a href="reservationCancel?recode=${reList.recode }" class="btn btn-red">예매취소</a>
                                            </c:when>
                                            <c:otherwise>
                                            
                                            <c:choose>
                                            <c:when test="${reList.review == null}">
                                            
                                            <button class="btn btn-red" onclick="reviewWriteForm('${reList}')">관람평작성</button>
                                          	</c:when>
                                           	<c:otherwise>
                                            <button class="btn btn-secondary" onclick="reviewView('${reList}','${reList.review }')">관람평보기</button>
                                           	</c:otherwise>
                                           	
                                           	
                                         	 </c:choose>
                                            </c:otherwise>
                                            
                                            
                                            
                                            </c:choose>
                                            
                                           
                                            
                                            
                                            
                                            </th>
                                            
                                        </tr>
                                        
                                    
									</c:forEach>
									 
                                    </tbody>
                                </table>
                               
                            </div>
                        </div>
                    </div>

                </div>
</div>
                    <!-- Content Row -->
  
    <!-- Logout Modal-->
    <div class="modal fade" id="reviewWriteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="padding-bottom: 20px; background-color: red;">
            <form class="user" action="reviewWrite" method="post">
                <div class="modal-header" style="background-color: red;">
                    <h5 class="modal-title" id="exampleModalLabel">REVIEW</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: white;">
                <div class="row">
                <div class="col-5">
                <div class="text-gray-900" style="text-align: center;">
                <img src="" style="height: 200px;" id="review_mvposter">
               	</div>
                </div>
                <div class="col-7">
                <div class="text-gray-900">
                	<div style="color: black;" class="p-2 font-weight-bold" id="review_recode"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="review_mvname"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="review_thname"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="review_scdate"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="review_reamount"></div>
                	
                </div>
                </div>
                </div>
                <br>
                
                <div class="text-gray-900">
       
                	<input type="radio" name="rvcommend" id="recommendGood" value="1" checked="checked">
                	<label id="recommendGood" class="text-lg font-weight-bold text-gray-900"><i class="fa-regular fa-thumbs-up"></i>좋아요</label> 
					<input type="radio" name="rvcommend" id="recommendBad" value="0">
					<label id="recommendBad" class="text-lg font-weight-bold text-gray-900"><i class="fa-regular fa-thumbs-down"></i>별로에요</label>
					<br> 
                	<textarea rows="5" cols="62px" name="rvcontents" id="rvcontents" placeholder="리뷰내용작성"></textarea>
                	<input type="hidden" id="rvrecode" name="rvrecode">
                	<input type="hidden" id="rvmvcode" name="rvmvcode">
                	<input type="hidden" id="rvmid" name="rvmid" value="${sessionScope.LoginMid }">
                	
                	</div>

                
                <div class="text-gray-900" style="text-align: center;">
                    <input type="submit" class="btn btn-secondary" style="border: 0px" value="리뷰작성">
                    <button class="btn btn-secondary" style="border: 0px" type="button" data-dismiss="modal">취소</button>
                </div>
                
                
                </div>
                </form>
                </div>
                
                
            </div>
        </div>

    
    
     <!-- Logout Modal-->
    <div class="modal fade" id="reviewViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="padding-bottom: 20px; background-color: red;">
           
                <div class="modal-header" style="background-color: red;">
                    <h5 class="modal-title" id="exampleModalLabel">REVIEW</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: white;">
                <div class="row">
                <div class="col-5">
                <div class="text-gray-900" style="text-align: center;">
                <img src="" style="height: 200px;" id="reviewView_mvposter">
               	</div>
                </div>
                <div class="col-7">
                <div class="text-gray-900">
                	<div style="color: black;" class="p-2 font-weight-bold" id="reviewView_recode"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="reviewView_mvname"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="reviewView_thname"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="reviewView_scdate"></div>
                	<div style="color: black;" class="p-2 font-weight-bold" id="reviewView_reamount"></div>
                	
                <br>
                </div>
                </div>
                
                
                
                <div class="col-12">
       
					<div class="text-lg font-weight-bold text-gray-900" id="reviewView_rvcommend"></div>
                	<textarea rows="5" cols="63px"  readonly="readonly" id="reviewView_rvcontents"></textarea>
                	
                	</div>

                </div>
                <div class="text-gray-900" style="text-align: center;">
                   
                    <button class="btn btn-secondary" style="border: 0px" type="button" data-dismiss="modal">확인</button>
                </div>
                
                
                </div>
                
                </div>
                
                
            </div>
        </div>

                    <!-- Content Row -->



                <!-- /.container-fluid -->


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
 </div>       
         

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
<script type="text/javascript">	
var checkMsg = '${msg}';
console.log(checkMsg);


if(checkMsg.length > 0){
	
	alert(checkMsg);
	
}
</script>


	<!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>



<script type="text/javascript">
function reviewWriteForm(reList){	
	var row = reList.split('(')[1].split(')')[0].split(', ');
	// ","콤마를 기준으로 나눠서 저장.
	var reserveDate = {}; // 데이터값을 하나로 모아줄 변수
	for(var i = 0; i < row.length; i++){
		var key = row[i].split('=')[0];
		// mvcode
		var val = row[i].split('=')[1];
		// MV001
		reserveDate[key] = val;
		
	}
	console.log("reserveDate : "+reserveDate);
	
	$("#review_mvposter").attr("src", reserveDate.mvposter);
	$("#review_recode").text("예매코드 : "+reserveDate.recode);
	$("#review_mvname").text("영화 : "+reserveDate.mvname);
	$("#review_thname").text("극장 : "+reserveDate.thname+" "+reserveDate.scroom);
	$("#review_scdate").text("일시 : "+reserveDate.scdate);
	$("#review_reamount").text("인원 : "+reserveDate.reamount+"명");

	
	$("#rvcontents").val("");
	$("#rvrecode").val(reserveDate.recode);
	$("#rvmvcode").val(reserveDate.mvcode);
	
	$("#reviewWriteModal").modal('show');
	
	

}
function reviewView(reList, reviewList ){
	console.log("reviewView() 호출" );
	console.log("예매정보 : " + reList);
	var row_re = reList.split('(')[1].split(')')[0].split(', ');
	var reserveData = {};
	for(var i = 0; i < row_re.length; i++ ){
		var key = row_re[i].split('=')[0];  // mvcode
		var val = row_re[i].split('=')[1]; // MV001
		reserveData[key] = val;
	}
	console.log(reserveData);
	
	
	console.log("관람평 정보 : "+reviewList);
	
	var row_rv = reviewList.split('(')[1].split(')')[0].split(', ');
	var reviewData = {};
	for(var i = 0; i < row_rv.length; i++ ){
		var key = row_rv[i].split('=')[0];  // mvcode
		var val = row_rv[i].split('=')[1]; // MV001
		reviewData[key] = val;
	}
	console.log(reviewData);
	$("#reviewView_mvposter").attr("src", reserveData.mvposter);
	$("#reviewView_recode").text("예매코드 : "+reserveData.recode);
	$("#reviewView_mvname").text("영화 : "+reserveData.mvname);
	$("#reviewView_thname").text("극장 : "+reserveData.thname+" "+reserveData.scroom);
	$("#reviewView_scdate").text("일시 : "+reserveData.scdate);
	$("#reviewView_reamount").text("인원 : "+reserveData.reamount+"명");
	
	
	
	if(reviewData.rvcommend == '1'){
		
		$("#reviewView_rvcommend").html("<i class=\"fa-regular fa-thumbs-up\"><i>좋아요")
		
		
	}else{
		
		$("#reviewView_rvcommend").html("<i class=\"fa-regular fa-thumbs-down\"><i>별로에요")
	}
	

	
	
	
	
	$("#reviewView_rvcontents").text(reviewData.rvcontents.replaceAll("<br>","\r\n"));

	
	
	$("#reviewViewModal").modal('show');
	
	
}
</script>




</html>