<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Shop Category</h2>
							<p>
								인기상품 <span><i class="ti-arrow-right"></i></span> ${cate1 } <span><i
									class="ti-arrow-right"></i></span> ${cate2 }
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>대분류</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">
									<c:forEach var="c1" items="${cateList }">
										<c:if test="${c1==cate1 }">
											<c:set var="style" value="style='color: #ff3368'" />
										</c:if>
										<c:if test="${c1!=cate1 }">
											<c:set var="style" value="" />
										</c:if>
										<li><a href="../new/list.do?cate1=${c1 }&sort=0"><span
												${style }>${c1 }</span></a></li>
									</c:forEach>
								</ul>
							</div>
						</aside>

						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>소분류</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">
									<c:forEach var="c2" items="${cate2List }">
										<c:if test="${c2==cate2 }">
											<c:set var="style" value="style='color: #ff3368'" />
										</c:if>
										<c:if test="${c2!=cate2 }">
											<c:set var="style" value="" />
										</c:if>
										<li><a href="../new/list.do?cate1=${cate1 }&cate2=${c2 }&sort=0"><span
												${style }>${c2 }</span></a></li>
									</c:forEach>
								</ul>
							</div>
						</aside>

						<!-- <aside class="left_widgets p_filter_widgets price_rangs_aside">
							<div class="l_w_title">
								<h3>Price Filter</h3>
							</div>
							<div class="widgets_inner">
								<div class="range_item">
									<div id="slider-range"></div>
									<input type="text" class="js-range-slider" value="" />
									<div class="d-flex">
										<div class="price_text">
											<p>Price :</p>
										</div>
										<div class="price_value d-flex justify-content-center">
											<input type="text" class="js-input-from" id="amount" readonly />
											<span>to</span> <input type="text" class="js-input-to"
												id="amount" readonly />
										</div>
									</div>
								</div>
							</div>
						</aside> -->
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-12">
							<div
								class="product_top_bar d-flex justify-content-between align-items-center">
								<div class="single_product_menu">
									<p>
										<span>${cnt } </span> 개의 상품이 검색되었습니다.
									</p>
								</div>
								<!-- 아직 정렬 구현 안됨 -->
								<form method="get" action="../new/list.do?">
									<div class="single_product_menu d-flex">
										<h5>정렬&nbsp;:&nbsp;</h5>
										<input type=hidden name=cate1 value=${cate1 }> <select
											name="sort" class="default-select" id="default-select_2">
											<option value=0>default</option>
											<option value=1>낮은 가격순</option>
											<option value=2>높은 가격순</option>
											<option value=3>리뷰 많은순</option>
											<option value=4>평점 높은순</option>
										</select> <input type=submit value=정렬 style="display: inline;"
											class="primary-border circle arrow">
									</div>
								</form>
								<form method="get" action="../new/list.do?" id=frm>
									<input type="hidden" name=sort value=0>
									<input type="hidden" name=cate1 value="${cate1}">
									<div class="single_product_menu d-flex">
										<input type="checkbox" value="T" class="input-sm" name="fs" checked="checked">이름 
										<input type="checkbox" value="C" class="input-sm" name="fs">내용
										<div class="input-group">
											<input type=text name=ss size=10 class="form-control" placeholder="search">
											<div class="input-group-prepend">												
												<i class="ti-search" onclick="document.getElementById('frm').submit();" style="cursor: pointer; margin-left:200px;"></i>												</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="row align-items-center latest_product_inner">
						<c:forEach var="vo" items="${nList }">
							<div class="col-lg-4 col-sm-6">
								<div class="single_product_item">
									<a href="../new/detail.do?no=${vo.no }&cate1=${cate1 }&cate2=${cate2 }">
										<img src="${vo.img }">
										<div class="single_product_text">
											<h4>${vo.title }</h4>
											<h3>${vo.price }원</h3>
										</div>
									</a>
									<div class="single_product_text">
										<a href="#" class="add_cart">+ add to cart<i
											class="ti-heart"></i></a>
									</div>
								</div>
							</div>
						</c:forEach>

						<div class="col-lg-12">
							<div class="pageination">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">

										<c:if test="${startPage>1 }">
											<li class="page-item"><a class="page-link"
												href="../new/list.do?cate1=${cate1 }&cate2=${cate2 }&sort=0&page=${startPage-1 }"
												aria-label="Previous"> <i class="ti-angle-double-left"></i>
											</a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage }" end="${endPage }">
											<c:if test="${i==curpage }">
												<c:set var="style" value="class='page-item active'" />
											</c:if>
											<c:if test="${i!=curpage }">
												<c:set var="style" value="class=page-item" />
											</c:if>
											<li ${style }><a class="page-link"
												href="../new/list.do?cate1=${cate1 }&cate2=${cate2 }&sort=0&page=${i }">${i }</a></li>
										</c:forEach>
										<c:if test="${endPage<totalpage }">
											<li class="page-item"><a class="page-link"
												href="../new/list.do?cate1=${cate1 }&cate2=${cate2 }&sort=0&page=${endPage+1 }"
												aria-label="Next"> <i class="ti-angle-double-right"></i>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Category Product Area =================-->

	<!-- 추천 -->
	<section class="product_list best_seller">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="section_tittle text-center">
						<h2>
							추천<span style="color: #ff3368">새상품</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center latest_product_inner">
				<c:forEach var="vo" items="${nlist }">
					<div class="col-lg-4 col-sm-6">
						<div class="single_product_item">
							<a href="#"> <img src="${vo.img }"
								style="width: 300px; height: 250px;">
								<div class="single_product_text">
									<h4>${vo.title }</h4>
									<h3>${vo.price }원</h3>
								</div>
							</a>
							<div class="single_product_text">
								<a href="#" class="add_cart">+ add to cart<i
									class="ti-heart"></i></a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 추천 -->
</body>
</html>