<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Grayscale - Start Bootstrap Theme</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
    <style>
        #pagepath a {
            font-size: x-small;
            color: #198754fa;
            text-decoration: none;
        }

        #pagepath span {
            font-size: x-small;
        }

        #readnum span {
            font-size: x-small;
        }

        #title label {
            font-size: xx-large;
            font-weight: lighter;
            padding-left: 88px;
        }

        .replycon {
            margin-top: 24px;
        }
    </style>
</head>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#page-top">GooPPl</a>
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
                    <li class="nav-item"><a class="nav-link" href="#">MyPage</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">LogIn</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 3rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">


            <div class="row">
                <div class="col-md-4" style="height: 128px;">
                    <!-- 페이지 경로 -->
                    <div id="pagepath">
                        <span> <a href="#">커뮤니티</a>
                            <a href="#">&gt;후기게시판</a>
                            &gt;~의 여행후기or게시글 제목
                        </span>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <!-- 	제목 -->
                    <div id="title">
                        <h5 class="display-6 fw-bolder text-center">후기 게시글 제목</h5>
                    </div>
                </div>
                <!--   작성자 조회수 게시글 번호-->
                <div class="col-md-2"></div>
                <div id="readnum" class="col-md-1">
                    <div class="row">
                        <div class="col-xs-12">
                            <span>
                                작성자
                            </span>
                        </div>
                        <div class="col-xs-12">
                            <span>
                                조회수
                            </span>
                        </div>
                        <div class="col-xs-12">
                            <span>
                                게시글 번호
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!--    본문내용-->
            <div class="container" style="margin-top: 64px;">

                <!--    여행 인트로?-->
                <div class="row justify-content-md-center mb-5">
                    <h6 class="display-7 text-center  mb-3">
                        " 프롤로그 "
                    </h6>
                    <p class="fw-bold text-center">
                        이번후기는 속초 여행을 다녀온 후 작성한 후기에요 재밌게 봐주세요~^^
                    </p>
                </div>


                <div class="row justify-content-md-center">
                    <!--    이미지-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <img class="img-fluid" style="width: 100%;"
                                src="https://t1.daumcdn.net/cfile/tistory/99EFA3485ADEDC7404">
                        </div>
                    </div>
                    <!--    사진에대한 글-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <p style="text-align: center; margin: 64px 0px;">
                                <small class="text-muted">
                                    속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이
                                    보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도
                                    시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요
                                    ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변
                                    풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도
                                    시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ
                                </small>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <!--    이미지-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <img class="img-fluid" style="width: 100%;"
                                src="http://www.alpacaworld.co.kr/uploadimages/135%25281%2529.jpg">
                        </div>
                    </div>
                    <!--    사진에대한 글-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <p style="text-align: center; margin: 64px 0px;">
                                <small class="text-muted">
                                    속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ
                                </small>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <!--    이미지-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <img class="img-fluid" style="width: 100%;"
                                src="https://t1.daumcdn.net/cfile/tistory/99EFA3485ADEDC7404">
                        </div>
                    </div>
                    <!--    사진에대한 글-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <p style="text-align: center; margin: 64px 0px;">
                                <small class="text-muted">
                                    속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ
                                </small>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <!--    이미지-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <img class="img-fluid" style="width: 100%;"
                                src="https://mblogthumb-phinf.pstatic.net/MjAxNzA1MTBfNyAg/MDAxNDk0MzQzNDk4NjE5.1iKfhS6jxayFe9K1BFEtZ_1Mx3NgzPJg7APbYIk_KGcg.56561BPuGnsOU0wyAMqF1XmttZZS5ONl5CinIh6L4Nkg.JPEG.kkyul_/DSC05400.JPG?type=w800">
                        </div>
                    </div>
                    <!--    사진에대한 글-->
                    <div class="row justify-content-md-center">
                        <div class="col-md-8 col-xs-12">
                            <p style="text-align: center; margin: 64px 0px;">
                                <small class="text-muted">
                                    속초 해변 풍경이 보기만해도 시원해지네요 ㅎㅎ
                                </small>
                            </p>
                        </div>
                    </div>
                </div>
                <!--    에필로그-->
                <div class="row mb-3">
                    <h6 class="display-7 text-center " style="font-size: 26px;">
                        " 에필로그 "
                    </h6>
                    <p class="fw-bold text-center">
                        이번후기는 속초 여행을 다녀온 후 작성한 후기에요 재밌게 봐주세요~^^
                    </p>
                </div>
                <!--본문 경계선-->
            </div>

            <!--    댓글 영역-->

            <div class="container">
                <!--style="background-color: white; border: whitesmoke solid 1px; border-radius: 4px; margin-top: 128px;">
                    -->
                <div class="row justify-content-md-center">
                    <div class="wrap col-md-9 "
                        style="border: lightgray solid 0.5px; border-radius: 10px; background-color: white;">


                        <!-- 목록 -->
                        <div class="row justify-content-md-center" style="margin-top: 16px;">
                            <!-- 댓글 목록 해더-->
                            <div class="row mb-5">
                                <div class="col-md-1 fw-bold" style="font-size: larger;">
                                    댓글
                                </div>
                                <div class="col-md-10"></div>
                                <div class="col-md-1" style="font-size: small;">
                                    3개
                                </div>
                            </div>
                            <!--댓글 메인-->
                            <div class="row justify-content-md-center mb-2" style="margin-top: 12px;">
                                <div class="col-md-10" style="border-top: solid 0.5px #78C2AD;">
                                    <div class="row replycon">
                                        <!--프로필 이미지-->
                                        <div class="col-md-1">
                                            <div class="row">
                                                <div style="display: flex;
                                                justify-content: center;
                                                align-items: center;
                                                width: 30px;
                                                height: 30px;
                                                border-radius: 50%;
                                                background-color: #78C2AD;
                                                color: #fff;
                                                margin: 0px auto;
                                                font-weight: 700;">홍
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-7" style="font-size: smaller;">
                                            <div class="row">
                                                <div class="fw-bold" style="margin-bottom: 16px;">
                                                    작성자
                                                </div>
                                                <div class="row" id="replycontent">
                                                    <p>
                                                        본문 내요임ㄴ;ㅇ럼;니앎ㄴ;이러ㅏ;ㅁ니아러ㅣ;ㅏㄴㅁ어리ㅏㅁ넝리ㅓ;<br>
                                                    </p>
                                                </div>
                                                <div class="row" style="font-size: x-small;">
                                                    <div class="col-md-3">
                                                        2021-11-30
                                                    </div>
                                                    <div class="col-md-9">
                                                        <a href="#" style="font-size: x-small;">답글 쓰기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="row justify-content-md-center">
                                                <div class="col-md-8"></div>
                                                <div class="col-md-4">
                                                    <a href="#" style="font-size: xx-small;">수정</a>
                                                    <a href="#" style="font-size: xx-small;">삭제</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--댓글 메인-->
                            <div class="row justify-content-md-center mb-2" style="margin-top: 12px;">
                                <div class="col-md-10" style="border-top: solid 0.5px #78C2AD;">
                                    <div class="row replycon">
                                        <!--프로필 이미지-->
                                        <div class="col-md-1">
                                            <div class="row">
                                                <div style="display: flex;
                                            justify-content: center;
                                            align-items: center;
                                            width: 30px;
                                            height: 30px;
                                            border-radius: 50%;
                                            background-color: #78C2AD;
                                            color: #fff;
                                            margin: 0px auto;
                                            font-weight: 700;">홍
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-7" style="font-size: smaller;">
                                            <div class="row">
                                                <div class="fw-bold" style="margin-bottom: 16px;">
                                                    작성자
                                                </div>
                                                <div class="row mb-4" id="replycontent">
                                                    <p>
                                                        본문 내요임ㄴ;ㅇ럼;니앎ㄴ;이러ㅏ;ㅁ니아러ㅣ;ㅏㄴㅁ어리ㅏㅁ넝리ㅓ;<br>
                                                    </p>
                                                </div>
                                                <div class="row" style="font-size: x-small;">
                                                    <div class="col-md-3">
                                                        2021-11-30
                                                    </div>
                                                    <div class="col-md-9">
                                                        <a href="#" style="font-size: x-small;">답글 쓰기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="row justify-content-md-center">
                                                <div class="col-md-8"></div>
                                                <div class="col-md-4">
                                                    <a href="#" style="font-size: xx-small;">수정</a>
                                                    <a href="#" style="font-size: xx-small;">삭제</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--댓글 작성-->
                            <div class="row justify-content-md-center mb-5" style="margin-top: 12px;">
                                <div class="col-md-10 " style="border: solid 3px #78C2AD; border-radius: 10px;">
                                    <div class="row replycon">
                                        <!--프로필 이미지-->
                                        <div class="col-md-1">
                                            <div class="row">
                                                <div style="display: flex;
                                            justify-content: center;
                                            align-items: center;
                                            width: 30px;
                                            height: 30px;
                                            border-radius: 50%;
                                            background-color: #78C2AD;
                                            color: #fff;
                                            margin: 0px auto;
                                            font-weight: 700;">홍
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-11">
                                            <div class="row">
                                                <div class="fw-bold" style="margin-bottom: 16px;">
                                                    작성자
                                                </div>
                                            </div>
                                            <div class="row mb-5" id="replycontent">
                                                <div class="col-md-10">
                                                    <textarea class="form-control" id="exampleTextarea" rows="3"
                                                        style="border: solid 1px lightgray; font-size: small;"
                                                        placeholder="댓글 작성시 비속어를 쓰지맙시다"></textarea>
                                                </div>
                                                <div class="col-md-2">
                                                    <a role="button" class="btn btn-success"
                                                        style="font-size: xx-small;">등록</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>



                            <!--경계선-->
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
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
</body>

</html>