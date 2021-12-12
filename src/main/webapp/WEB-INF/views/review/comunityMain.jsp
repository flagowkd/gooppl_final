<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html lang="en">

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
</head>
<style>
    #pagepath span {
        font-size: x-small;
    }
    #title label {
        font-size: xx-large;
        font-weight: lighter;
        padding-left: 88px;
    }
    </style>
<body>
    <!-- Navigation-->
<%@include file="/WEB-INF/views/member/header.jsp" %>
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 3rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">


            <div class="row">

                <!--     ��������� -->

                <div id="pagepath" class="col-md-4" style="height: 128px;">
                    <span> Ŀ�´�Ƽ </span>
                </div>
                <!--         ���� -->

                <div id="title" class="col-md-4">
                    <label>Ŀ�´�Ƽ</label>
                </div>
                <div class="col-md-4"></div>
            </div>
            <!--     ���������Խ��� ������ �̵�  -->

            <div class="row justify-content-md-center">
                <div class="col-xs-12" style="height: 32px;"></div>
            </div>
            <div class="row">
                <div class=" col-md-8">
                    <div class="card bg-dark text-white" style="border: ghostwhite 0.5px solid;">
                        <img src="https://t1.daumcdn.net/cfile/blog/244C94505523281305" class="card-img" alt="..."
                            style="width: auto; height:360px;">
                        <div class="card-img-overlay">
                            <h5 class="card-title">���� �����Խ���</h5>
                            <p class="card-text">�ٸ� ������ �Բ� ���� ������ �����ϼ���.</p>
                            <p class="card-text " style="margin-top: -64px; margin-left: 800px; "><a href="share.do" style="color:whitesmoke; text-decoration: none;">�̵��ϱ�</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <!--     �ı�Խ��� ������ �̵�  -->
            <div class="row justify-content-md-center">
                <div class="col-xs-12" style="height:32px;">&nbsp;&nbsp;&nbsp;</div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="card bg-dark text-white" style="border: ghostwhite 0.5px solid;">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoO8SWIR4rq_qHOOplxFU7R5tU3k42XdEqkw&usqp=CAU"
                            class="card-img" alt="..." style="width: auto; height: 360px;">
                        <div class="card-img-overlay">
                            <h5 class="card-title">���� �ı�Խ���</h5>
                            <p class="card-text">���� ������ ������ ��ſ��� �ٸ������� �Բ� ��������.</p>
                            <p class="card-text " style="margin-top: -64px; margin-left: 800px; "><a href="reivew.do" style="color:whitesmoke; text-decoration: none;">�̵��ϱ�</a></p>
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
<%@include file="/WEB-INF/views/member/faq.jsp" %>
<%@include file="/WEB-INF/views/member/footer.jsp" %>
</body>

</html>