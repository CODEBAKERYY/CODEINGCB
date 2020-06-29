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
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/csss/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/csss/fonts/fonts.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="resources/csss/loginstyle.css" rel="stylesheet" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#loginform").submit(function() {
			var flag = true;
			var user_Id = $('#userId').val();
			var idchk = {
				"user_Id" : user_Id
			};
			$.ajax({
				type : "POST",
				url : "idcheck.do",
				data : JSON.stringify(idchk),
				contentType : "application/json",
				dataType : "json",
				async : false,
				success : function(msg) {
					console.log(msg);
					if (msg.check == false) {
						alert("아이디 및 비밀번호를 확인해주세요");
						flag = false;
					} else {
						alert(user_Id + "님 환영합니다");
						flag = true;
					}
				},
				error : function() {
					alert("ajax 통신 실패!");
				}

			});
			return flag;
		});
	});
	
</script>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="center">
		<h1>Login</h1>
		<form method="post" action="loginchk.do" id="loginform">
			<div class="txt_field">
				<input type="text" name="user_Id" id="userId"> <span></span>
					<label>id</label>
			</div>
			<div class="txt_field">
				<input type="password" name="user_Pw" id="userPwS"> <span></span>
					<label>password</label>
			</div>
			<div class="pass">Forgot password</div>
			<input type="submit" value="Login"> <input type="submit"
				class="google" value="Google Login">
					<div class="signup_link">
					Forgot ID Password? <a href="findidpw.do">Find ID Password</a>
					</div>
					<div class="signup_link">
						Not a member? <a href="sign.do">Singup</a>
					</div>
		</form>
	</div>

</body>
</html>
