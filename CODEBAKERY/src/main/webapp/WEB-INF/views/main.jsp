<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : TwoColours 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130811

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css" media="all"  />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
/* #portfolio-wrapper{
background-color: white;
} */
/* .newthings1, .newthings2, .newthings3, .newthings4 {
	width: 17%;
	height: 400px;
	border: 2px solid black;
	border-radius: 10px;
	float: left;
	margin-left: 6.5%;
} */

/* 리뷰 배너 스타일 */

/* slideul */
.slideWrap {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 300px;
	text-align: center;
	background-color: red;
	border: 1px solid;
}

.slideUl {
	display: inline-block;
}

.slideUl li {
	display: none;
	list-style: none;
	font-size: 30pt;
	margin-top: 130px;
}
</style>

<!-- 리뷰 배너 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#reviewclass").hide();
		$(".button").click(function() {
			$("#reviewclass").show();
		});
	})
	$(document).ready(function() {
		/* 배너 롤링 */
		var nowNum = 0;
		var bannerObj = $('.slideUl li');
		var maxLength = bannerObj.length;
		var timer = 4000; // 자동 롤링되는 타임 설정
		var autoRun = setInterval(function() {
			rollingFn('right');
		}, timer);
		bannerObj.eq(nowNum).fadeIn();
		function rollingFn(direction) {
			if (direction == 'right') {
				nowNum = nowNum + 1;
				if (nowNum > maxLength - 1) {
					nowNum = 0;
				}
			} else {
				nowNum = nowNum - 1;
				if (nowNum < 0) {
					nowNum = maxLength - 1;
				}
			}
			bannerObj.hide().eq(nowNum).fadeIn();
		}
	});

	/* 숫자 카운팅 */
	$(document).ready(
			function() {
				function numberCounter(target_frame, target_number) {
					this.count = 0;
					this.diff = 0;
					this.target_count = parseInt(target_number);
					this.target_frame = document.getElementById(target_frame);
					this.timer = null;
					this.counter();
				}
				;
				numberCounter.prototype.counter = function() {
					var self = this;
					this.diff = this.target_count - this.count;

					if (this.diff > 0) {
						self.count += Math.ceil(this.diff / 5);
					}

					this.target_frame.innerHTML = this.count.toString()
							.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

					if (this.count < this.target_count) {
						this.timer = setTimeout(function() {
							self.counter();
						}, 20);
					} else {
						clearTimeout(this.timer);
					}
				};

				new numberCounter("counter1", 99999);
				new numberCounter("counter2", 21565748);
				new numberCounter("counter3", 121554864865);
				new numberCounter("counter4", 16050403405050);
			});
</script>

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
	<%@ include file="./header.jsp"%>
	<div id="logo" class="container">
		<h1>
			<a href="#" class="icon icon-tasks"><span>Code-Bakery</span></a>
		</h1>
	</div>
	<hr></hr>
	<div id="portfolio-wrapper" class="mento">
		<div id="portfolio" class="container">
			<div class="major">
				<h2>자랑스러운 멘토</h2>
				<span class="byline">국내 최고의 멘토진들을 소개합니다</span>
			</div>
			<div class="column1">
				<a href="#" class="image image-full"><img src="resources/images/pic01.jpg"
					height="150" alt="" /></a>
				<div class="box">
					<p>구글 경력 10년 지려버렸다!</p>
					<a href="#" class="button">리뷰보기</a>
				</div>
			</div>
			<div class="column2">
				<a href="#" class="image image-full"><img src="resources/images/pic02.jpg"
					height="150" alt="" /></a>
				<div class="box">
					<p>구글 경력 10년 지려버렸다!</p>
					<a href="#" class="button">리뷰보기</a>
				</div>
			</div>
			<div class="column3">
				<a href="#" class="image image-full"><img src="resources/images/pic03.jpg"
					height="150" alt="" /></a>
				<div class="box">
					<p>구글 경력 10년 지려버렸다!</p>
					<a href="#" class="button">리뷰보기</a>
				</div>
			</div>
			<div class="column4">
				<a href="#" class="image image-full"><img src="resources/images/pic04.jpg"
					height="150" alt="" /></a>
				<div class="box">
					<p>구글 경력 10년 지려버렸다!</p>
					<a href="#" class="button">리뷰보기</a>
				</div>
			</div>
		</div>
	</div>
	<div id="reviewclass">
		<div class="slideWrap">
			<ul class="slideUl">
				<%
					for (int i = 0; i < 10; i++) {
				%>
				<li class="banner<%=i%>">리뷰내용+<%=i%></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>

	<div id="featured-wrapper">
		<div id="featured" class="container">
			<div class="major">
				<h2>코드베이커리</h2>
				<span class="byline">실시간 통계</span>
			</div>
			<div class="column1">
				<span class="icon icon-bar-chart"></span>
				<div class="title">
					<h2>현재 답변 수</h2>
					<p id="counter1"></p>
				</div>
			</div>
			<div class="column2">
				<p id="counter2" style="font-size: 30pt; margin-left: 50px;"></p>
				<!-- 	<span class="icon icon-qrcode"></span> -->
				<div class="title">
					<h2>현재 올라온 문제</h2>

				</div>
			</div>
			<div class="column3">
				<span class="icon icon-building"></span>
				<div class="title">
					<h2>현재 올라온 질문</h2>
					<p id="counter3"></p>
				</div>
			</div>
			<div class="column4">
				<span class="icon icon-picture"></span>
				<div class="title">
					<h2>현재 가능한 언어</h2>
					<p id="counter4"></p>
				</div>
			</div>
		</div>
	</div>



	<!-- <div id="portfolio-wrapper">
		<div id="portfolio" class="container">
			<div class="newthings1">
				<div class="content">
					<a href="#" class="new read"><span class="label">Icon</span></a>
					<h3>새로 올라온글</h3>
					<p>300</p>
				</div>
			</div>
			<div class="newthings2">
				<div class="content">
					<a href="#" class="new read"><span class="label">Icon</span></a>
					<h3>새로 달린 댓글</h3>
					<p>300</p>
				</div>
			</div>
			<div class="newthings3">
				<div class="content">
					<a href="#" class="new read"><span class="label">Icon</span></a>
					<h3>새로 나온 문제</h3>
					<p>300</p>
				</div>
			</div>
			<div class="newthings4">
				<div class="content">
					<a href="#" class="new read"><span class="label">Icon</span></a>
					<h3>공지사항</h3>
					<p>300</p>
				</div>
			</div>
		</div>
	</div> -->
	<div id="portfolio-wrapper" class="mento">
		<div id="portfolio" class="container">
			<div class="major">
				<h2>새로운 글</h2>
			</div>
			<div class="column1">
				<div class="box">
					<p>새로운 질문</p>
				</div>
			</div>
			<div class="column2">
				<div class="box">
					<p>새로운 댓글</p>
				</div>
			</div>
			<div class="column3">
				<div class="box">
					<p>멘토 추천</p>
				</div>
			</div>
			<div class="column4">
				<div class="box">
					<p>공지사항</p>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./footer.jsp"%>
</body>
</html>
