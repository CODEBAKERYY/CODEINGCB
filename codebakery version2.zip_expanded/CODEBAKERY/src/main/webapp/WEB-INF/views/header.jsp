<%@page import="com.mvc.cb.model.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	UserDto user = (UserDto) session.getAttribute("User");
UserDto admin = (UserDto) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- Toastr -->
<link href="resources/css/toastr.min.css" rel="stylesheet">
<script src="resources/css/toastr.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".alram").click(function() {
			alert("알람 누름");
			toastr.options = {
				"preventDuplicates" : true, // 중복실행 방지, false일 경우 여러번 실행 가능, true면 하나만 띄운다(없어지면 다시 띄우기 가능)
				closeButton : true,
				progressBar : false,
				"hideDuration" : 500, // 사라질때 걸리는 시간, 공식 홈에서 문자로 되어있지만 숫자로 해야 먹힌다.
				showMethod : 'slideDown',
				"extendedTimeOut" : 100000, // 토스트에 호버링 했다 땠을 때 사라지는 시간(마우스를 올렸다가 땠을 때)
				timeOut : 100000
			};
			<%for(int i = 0; i<5; i++){
				%>
				toastr.info('${answerlist}', 'ss');
				<%
			}
			%>

		});
	});
</script>
<style type="text/css">
/* 드롭 다운 버튼 CSS */
.dropbtn {
	background-color: #3F3F3F;
	color: white;
	padding: 16px;
	border: none;
	display: block;
	letter-spacing: 1px;
	text-decoration: none;
	text-transform: uppercase;
	font-size: 1em;
	font-weight: 700;
	color: #FFF;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #3F3F3F;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

/* 드롭 다운 버튼 CSS  끝*/
</style>
</head>
<body>
	<div id="header">
		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="main.do" accesskey="1"
					title="">Home</a></li>
				<li><a href="mentor_detailAll.do" accesskey="1" title="">멘토소개</a></li>
				<li><a href="qna.do" accesskey="2" title="">질의응답</a></li>
				<li><a href="quiz.do" accesskey="3" title="">퀴즈</a></li>
				<li><a href="notice.do" accesskey="4" title="">공지사항</a></li>
				<%
					if (admin != null) {
				%>
				<li><a href="admin.do">마이페이지</a></li>
				<li><a href="logout.do">로그아웃</a></li>
				<%
					} else if (user != null) {
				%>
				<li><div class="dropdown">
						<button class="dropbtn">마이페이지</button>
						<div class="dropdown-content">
							<a href="mypoint.do">나의 포인트</a> <a href="mypage_modify.do">회원정보</a>
							<a href="apply.do">멘토 신청</a>
						</div>
					</div></li>
				<li><a href="logout.do">로그아웃</a></li>
				<%
					} else if (admin == null || user == null) {
				%>
				<li><a href="login.do" accesskey="5" title="">로그인</a></li>
				<%
					}
				%>
				<li class="alram"><img src="resources/images/dd.png"></li>
			</ul>
		</div>
	</div>
</body>
</html>