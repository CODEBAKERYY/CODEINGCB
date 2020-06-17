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
<link href="resources/csss/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/csss/fonts.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
/* table.type03 {
	width: 90%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #369;
	margin: 20px 50px;
	border-collapse: collapse;
} */
.button {
	background-color: #f8585b;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 10px;
}

.button:hover {
	background-color: orange;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="page" class="container">
		<div id="content">
			<div class="title">
				<h2>이창진 멘토</h2>&nbsp;&nbsp;<input type="button" class="button" style="float: right;" value="1:1채팅" 
					onclick="location.href = 'chat.do'"/>  
					<span class="byline">최고를 자부합니다.</span>
			</div>
			<p>
				내가 <strong>개발자다</strong>,싶으면 와 <a href="http://templated.co"
					rel="nofollow">TEMPLATED</a>. The photos in this template are from
				<a href="http://fotogrph.com/"> Fotogrph</a>. This free template is
				released under the <a href="http://templated.co/license">Creative
					Commons Attribution</a> license, so you're pretty much free to do
				whatever you want with it (even use it commercially) provided you
				give us credit for it. Have fun :)
			</p>
		</div>
		<div id="sidebar">
			<a href="#" class="image image-full"><img src="images/pic05.jpg"
				alt="" /></a>
		</div>
	</div>
	<div class="container">
		<table class='table'>
			<tr>
				<span style="font-size: 18px;">user3</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="color: grey; font-size: 14px;">2020.04.23 17:16</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<hr></hr>
			</tr>
			<tr>
				<td>공지사항 댓글입니다.333333</td>
			</tr>
		</table>
	</div>
	<!-- 	<table class="type03">
		<tr>
			<th scope="row">항목명</th>
			<td>내용이 들어갑니다.</td>
		</tr>
		<tr>
			<th scope="row">항목명</th>
			<td>내용이 들어갑니다.</td>
		</tr>
		<tr>
			<th scope="row">항목명</th>
			<td>내용이 들어갑니다.</td>
		</tr>
	</table> -->
	<%@ include file="footer.jsp"%>
</body>
</html>
