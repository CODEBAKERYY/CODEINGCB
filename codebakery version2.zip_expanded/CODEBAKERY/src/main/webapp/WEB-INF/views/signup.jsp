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
<link href="resources/csss/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/csss/fonts/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/csss/signstyle.css" rel="stylesheet">

	<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
	<script src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
		$("#phototext").click(function(e) {
			e.preventDefault();
			$("#photo").click();
		});
	</script>
</head>
<body>

	<%@ include file="header.jsp"%>
	<div class="center">
		<h1>Signup</h1>
		<form method="post" action="signup.do">
		<input type="hidden" name="user_Point" value="0"/>
		<input type="hidden" name="user_Pic"/ value="her">
			<div class="txt_field">
				<input type="text" name="user_Id"> <span></span> <label>id</label>
			</div>
			<div class="txt_field">
				<input type="password" name="user_Pw"> <span></span> <label>password</label>
			</div>
			<div class="txt_field">
				<input type="password"> <span></span> <label>password
						check</label>
			</div>
			<div class="txt_field">
				<input type="text" name="user_Name"> <span></span> <label>user
						name</label>
			</div>
			<div class="txt_field">
				<input type="text" name="user_Phone"> <span></span> <label>phone</label>
			</div>
			<div class="txt_field">
				<input type="text" name="user_Mail"> <span></span> <label>email</label>
			</div>
			<div class="txt_field">
				<input type="file" id="photo" name="user_Pic" value="classpath" style="display: none">
					<input type="text" id="phototext" required> <span></span> <label>photo</label>
			</div>
			<div class="language">
				<div>Preferred language</div>
				<input type="checkbox" name="java" value="java">java</input> <input
					type="checkbox" name="python" value="python">python</input> <input
					type="checkbox" name="c++" value="c++">c++</input> <input
					type="checkbox" name="c" value="c">c</input> <input type="checkbox"
					name="javascript" value="javascript">javascript</input>
					<input type="hidden" name="user_Lang" value="java"/>
			</div>
			
			<input type="submit" value="회원가입" style="margin-top: 20px">

				<div class="signup_link">
					회원이세요? <a href="login.do">로그인</a>
				</div>
		</form>
	</div>
	<div style="height: 100px;"></div>
</body>
</html>
