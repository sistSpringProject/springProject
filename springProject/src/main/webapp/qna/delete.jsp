<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Q&A</h2>
                            <p>Q&A <span>-</span> 질문하기</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    <!--================Blog Area =================-->
	<section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
				       <form method="post" action="../qna/delete_ok.do">
					       <table class="table">
					         <tr class="text-center">
					           <td class="inline">
				                      비밀번호: <input type=password name=pwd size=20 class="input-sm" id="pwd">
					                  <input type=hidden name=no value="${no }" id="no">
					                  <input type=hidden name=page value="${page }" id="page">
					           </td>
					         </tr>
					         <tr>
					           <td class="text-center">
					             <button class="btn btn-sm btn-success">삭제</button>
					             <input type=button value="취소" class="btn btn-sm btn-success"
					             onclick="javascript:history.back()">
					           </td>
					         </tr>
					       </table>
				       </form>
     				</div>
     			</div>
     		</div>
     	</div>
     </section>
</body>
</html>