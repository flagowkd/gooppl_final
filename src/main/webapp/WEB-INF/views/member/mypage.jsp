<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>GooPPl - Mypage</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
		crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Varela+Round"
		rel="stylesheet" />
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/finalpj/resource/css/styles.css" rel="stylesheet" />
	<link href="/finalpj/resource/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- jquery -->
	<script type="text/javascript"
	  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.do">GooPPl</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Plan</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Community</a></li>
                    <c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend">
								  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								    <label class="bg-primary text-center"
								    	style="
                                        width: 30px;
                                        border-radius: 50%;
                                        color: #fff;
                                        font-weight: 600;
                                        font-size: 1.2rem;">${profileNick}</label>
								  </a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item" href="mypage.do">myPage</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout.do">Logout</a></li>
							</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a id="login_bt" class="nav-link" href="#"
								role="button" data-bs-toggle="modal" data-bs-target="#loginmd">LogIn</a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 10rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">
            <div class="row justify-content-md-center">
                <div class="col col-lg-2 mb-4">
                    <div style="display: flex;
                                justify-content: center;
                                align-items: center;
                                width: 50px;
                                height: 50px;
                                border-radius: 50%;
                                background-color: #717171;
                                color: #fff;
                                margin: 0px auto;
                                font-weight: 700;">${profileNick}
                    </div>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col col-lg-2 mb-4">
                    <h4 class="display-6 fw-bolder text-center">${sessionScope.sessionNickname}</h1>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col col-lg-3 text-center mb-5">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                        프로필수정
                    </button>
                    <c:if test="${sessionScope.sessionMemberType=='M'}">
                    	<button type="button" class="btn btn-primary">광고주 등록</button>
                    </c:if>
                </div>
            </div>
			
            <div class="row justify-content-md-center">
                <div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-1 text-center">나의 일정</h5>
                    <h4 class="fw-bolder mb-3 text-center"><a href="#">2</a></h4>
                </div>
                <div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-1 text-center">나의 후기</h5>
                    <h4 class="fw-bolder mb-3 text-center"><a href="#">3</a></h4>
                </div>
            </div>
        </div>
    </section> 
    <!--모달-->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary mb-4">
                    <h5 class="modal-title" id="staticBackdropLabel">프로필 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <br>
                <div class="modal-body p-2 pt-0">
                    <div class="row justify-content-md-center mb-2">
                        <div class="col text-center">
                            <div style="display: flex;
                                        justify-content: center;
                                        align-items: center;
                                        width: 80px;
                                        height: 80px;
                                        border-radius: 50%;
                                        background-color: #717171;
                                        color: #fff;
                                        margin: 0px auto;
                                        font-weight: 700;
                                        font-size: 1.5rem;
                                        
                                        "
                                        >${profileNick}
                                        
                            </div>
                            <br>
                        </div>
                    </div>
                    <div class="row justify-content-md-center">
                        <div class="col-md-5 text-center">
                            <h6 class="fw-bolder text-center" style="font-size: 18px;">${sessionScope.sessionNickname}
                                <a class="mx-2" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"><i class="fas fa-pen"></i></a>
                            </h6>
                        </div>
                    </div>
                    <div class="collapse" id="collapseExample">
                        <div class="row justify-content-md-center mb-3">
                            <div class="col-md-6 text-center">
                                <input type="text" class="form-control" placeholder="수정할 닉네임을 입력하세요">
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-md-center mb-3">
                        <div class="col-md-8 text-center mb-4">
                        	<c:choose>
                            	<c:when test="${sessionScope.sessionJoinType=='goo'}">
                          		  <p class="mb-2"><i class="fa fa-envelope mr-2"></i> ${sessionScope.sessionId}</p>
                        		</c:when>
                        		<c:when test="${sessionScope.sessionJoinType=='naver'}">
                        			 <p class="mb-2"><img width="80%" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></p>
                        		</c:when>
                        		<c:otherwise>
                        			<p class="mb-2"><img width="80%" src="/finalpj/resource/img/kakaologo/kakao_login_large_narrow.png" /></p>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">수정하기</button>
                </div>
            </div>
        </div>
    </div>
    <!--모달 끝-->
    <section>
        <!--일정 영역-->
        <c:if test="${sessionScope.sessionMemberType=='O'}">
        	<div class="container-sm mb-5" style="padding:3rem 0;">
        		<div class="row justify-content-md-center">
        			<div class="row">
        				<div class="col-md-2 text-center">
        					<h5 class="fw-bolder mb-2 text-center">나의 업장</h5>
        				</div>
        			</div>
        		</div>
	        	<div class="row justify-content-md-center">
	                <div class="card mb-3" style="max-width: 700px;">
	                    <div class="row align-items-center ">
	                        <div class="col-md-6">
	                            <img src="/finalpj/resource/img/혜수네.jpg" class="img-fluid rounded-start rounded-end" alt="...">
	                        </div>
	                        <div class="col-md-6">
	                            <div class="card-body">
	                                <h5 class="card-title fw-bolder" style="font-size:30px;">연신내 싸갈s 바갈s</h5>
	                                <p class="card-text mb-4">02-9999-9999</p>
	                                <p class="card-text mb-1">서울 은평구 통일로 885</p>
	                                <p class="card-text mb-3">혜수스타디움 2층</p>
	                                <button class="btn btn-info" type="button">문의</button>
	                                <button class="btn btn-info" type="button">수정</button>
	                                <hr>
	                                <p class="card-text">바른생각을 가진 사람들이 만드는 요리 신선한 재료와 성실한 조리로 요리를 대접합니다 가장 바른 돈까스 프랜차이즈 쑝쑝돈까스</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        	</div>
        </c:if>
        <div class="container-sm mb-5" style="padding: 5rem 0;">
            <div class="row justify-content-md-center">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <h5 class="fw-bolder mb-2 text-center">나의 일정</h5>
                    </div>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="card text-center" style="max-width: 860px;">
                    <div class="row g-0">
                        <div class="col-md-3">
                            <img src="/finalpj/resource/img/gapyeong.jpg" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-3">
                            <div class="card-body align-items-center">
                                <h4 class="card-title">GaPyeong</h4>
                                <h6 class="card-text" style="font-size:12px;">대한민국 가평</h6>
                                <div class="card-text mb-4" style="display: flex;
                                            justify-content: center;
                                            align-items: center;
                                            width: 50px;
                                            height: 50px;
                                            border-radius: 50%;
                                            background-color: #717171;
                                            color: #fff;
                                            margin: 0px auto;
                                            font-weight: 700;">H
                                </div>
                                <p class="card-text"><small class="text-muted">Day-50</small></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card-body">
                                <div class="cardDiv">
                                    <div class="row mb-2">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            여행명
                                        </div>
                                        <div class="col-md-9">
                                            신나는 가평 여행
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            여행일자
                                        </div>
                                        <div class="col-md-9">
                                            2021-11-20 - 2021-11-21
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            여행유형
                                        </div>
                                        <div class="col-md-9">
                                            커플끼리
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            방문장소
                                        </div>
                                        <div class="col-md-9">
                                            12곳
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;">공유</button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;">수정</button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--후기 영역 -->
        <div class="container-sm mb-5" style="padding: 5rem 0;">
            <div class="row justify-content-md-center">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <h5 class="fw-bolder mb-2 text-center">나의 리뷰</h5>
                    </div>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0 ">
                        <div class="col-md-4">
                            <img src="daejeon.jpg" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">너무 재밌었습니다~</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural
                                    lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-md-3 ">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#">&laquo;</a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">&raquo;</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </section>
    <!-- Contact-->
    <section class="contact-section bg-primary align-items-center">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-md-center">
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">Address</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50">은평구 동서로 101-2</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-envelope text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">1:1상담</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">문의하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-mobile-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">FAQ</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">자주하는 질문</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer bg-primary small text-center text-white-50" style="padding: 2.3rem 0;">
        <div class="container px-4 px-lg-5">Copyright &copy; Ezen Academy & Team3 2021</div>
    </footer>
      <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <!-- sweetalert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
	<script src="/finalpj/resource/js/scripts.js"></script>
</body>

</html>