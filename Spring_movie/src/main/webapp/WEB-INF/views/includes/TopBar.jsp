<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <nav class="navbar navbar-expand navbar-light bg-black topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                     action="searchList" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                name="searchText" aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-red" type="submit">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
						
                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                           

                            <a class="nav-link dropdown-toggle" href="MemberLoginForm" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>

                            

                           	 
                     
                           	 
                           	 
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <c:choose>
                                <c:when test="${sessionScope.LoginMid != null }">
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </c:when>
                            <c:otherwise>

                            <a class="dropdown-item text-center small " style="color: white;" href="memberLoginForm">로그인 페이지 이동</a>
                            
                            
                            </c:otherwise>
                            
                            
                            </c:choose>
                            </div>

	
                      
                        </li>
                            
                            
                            
                            
                           
                            
 
						
						
                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <c:choose>
                                <c:when test="${sessionScope.LoginMid != null }">
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="${pageContext.request.contextPath }/resources/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="${pageContext.request.contextPath }/resources/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="${pageContext.request.contextPath }/resources/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                           </c:when>
                            <c:otherwise>

                            <a class="dropdown-item text-center small " style="color: white;" href="memberLoginForm">로그인 페이지 이동</a>
                            
                            
                            </c:otherwise>

                            
                            </c:choose>
                           
                           
                           
                           
                           
                           
                           
                            </div>
                        
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>
						
						
						
                        <!-- Nav Item - User Information -->
                       
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.LoginMid }</span>
                                
                                
                                
                                
                                <c:choose>
                                <c:when test="${sessionScope.LoginProfile != null }">
                                
                                
                                <c:choose>
                                <c:when test="${sessionScope.LoginMstate != 2 }">
								<img class="img-profile rounded-circle"
                                   src="${pageContext.request.contextPath }/resources/mprofileUpLoad/${sessionScope.LoginProfile}">
                           		</c:when>
                           		
                           		<c:otherwise>
                           		
                           		
                           		<img class="img-profile rounded-circle" src="${sessionScope.LoginProfile}">
                           		
                           		
                           		</c:otherwise>
                           
                           
                           
                          		</c:choose>
                           
                           
                           
                            </c:when>
                            
                            <c:otherwise>
                            
                            	 <img class="img-profile rounded-circle"
                                   src="${pageContext.request.contextPath }/resources/img/undraw_profile.svg">
                            	
                            </c:otherwise>
                            
                            
                            </c:choose>

                            </a>
                            
                      
                            <!-- Dropdown - User Information -->
							 
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                
                               	<c:choose>
                               	
                               	
                               	<c:when test="${sessionScope.LoginMid != null}">
                                <a class="dropdown-item" href="memberView">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    내정보
                                </a>
                                <a class="dropdown-item" href="MovieReservationPage">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    영화예매
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    예매내역
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                                </c:when>
                                <c:otherwise>
                                 <a class="dropdown-item" href="memberLoginForm">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그인
                                </a>
                                
                                
                                </c:otherwise>
                                
                            </c:choose>
                           
                            </div>
                            
                           
                        </li>
 
                    </ul>

                </nav>
                
               
                
                
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="padding-bottom: 20px; background-color: red;">
                <div class="modal-header" style="background-color: red;">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: white;">
                <div class="row">
                <div class="col-12">
                <div class="text-gray-900">
                
                "확인"을 선택하면 로그아웃 됩니다.
                </div>
                </div>
                </div>
                </div>
                <div class="modal-footer" style="background-color: white;">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="memberLogout">확인</a>
                </div>
            </div>
        </div>
    </div>                
    
              
  <!-- Logout Modal-->
    <div class="modal fade" id="ReservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="padding-bottom: 20px; background-color: red;">
                <div class="modal-header" style="background-color: red;">
                    <h5 class="modal-title" id="exampleModalLabel">영화가 예매되었습니다.</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: white;">
                <div class="row">
                <div class="col-5">
                <div class="text-gray-900">
                <img src="" style="height: 200px;" id="reserMsg_mvposter">
               	</div>
                </div>
                <div class="col-7">
                <div class="text-gray-900">
                	<div class="p-2 font-weight-bold" id="reserMsg_recode"></div>
                	<div class="p-2 font-weight-bold" id="reserMsg_mvname"></div>
                	<div class="p-2 font-weight-bold" id="reserMsg_thname"></div>
                	<div class="p-2 font-weight-bold" id="reserMsg_scdate"></div>
                	<div class="p-2 font-weight-bold" id="reserMsg_reamount"></div>
                </div>
                </div>
                </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>       
   
                
                
                
                
                
                