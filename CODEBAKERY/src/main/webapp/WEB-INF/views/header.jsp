<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!-- Toastr -->
<link href="css//toastr.min.css" rel="stylesheet">
<script src="css/toastr.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* $(".alram").click(function() {
			$(".alrimdiv").toggle();
		}); */
		$(".alram").click(function() {
			toastr.options = {
                "preventDuplicates" : true, // 중복실행 방지, false일 경우 여러번 실행 가능, true면 하나만 띄운다(없어지면 다시 띄우기 가능)
				closeButton : true,
				progressBar : false,
				 "hideDuration": 500, // 사라질때 걸리는 시간, 공식 홈에서 문자로 되어있지만 숫자로 해야 먹힌다.
				showMethod : 'slideDown',
				"extendedTimeOut": 100000, // 토스트에 호버링 했다 땠을 때 사라지는 시간(마우스를 올렸다가 땠을 때)
				timeOut : 100000
			};<%for(int i =0; i<10; i++){
			%>toastr.info('알림<%=i%>', '알림이다!');
			<%
			}
			%>
		});

	});
</script>
<style type="text/css">
.alrimdiv {
	z-index: 10;
}
</style>
</head>
<body>
	<div id="header">
		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="main.do" accesskey="1"
					title="">Home</a></li>
				<li><a href="mentor_detail.do" accesskey="1" title="">멘토소개</a></li>
				<li><a href="qna.do" accesskey="2" title="">질의응답</a></li>
				<li><a href="quiz.do" accesskey="3" title="">퀴즈</a></li>
				<li><a href="notice.do" accesskey="4" title="">공지사항</a></li>
				<li><a href="mypage_modify.do" accesskey="5" title="">마이페이지</a></li>
				<li class="alram" style="color:black;">알림확인</li>
			</ul>
		</div>
	</div>
</body>
</html>