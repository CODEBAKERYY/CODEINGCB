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
<link href="resources/css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="csss/loginstyle.css" rel="stylesheet">

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<%@ include file="header.jsp" %>  
  <div class="center">
    <h1>Login</h1>
    <form method="post">
        <div class="txt_field">
          <input type="text" required>
          <span></span>
          <label>id</label>
        </div>
        <div class="txt_field">
          <input type="password" required>
          <span></span>                                        
          <label>password</label>
        </div>
        <div class="pass"> Forgot password</div>
        <input type="submit" value="Login">
     
        <input type="submit" class="google" value="Google Login">
        <div class="signup_link">
          Not a member? <a href="#">Singup</a>
        </div>
    </form>
  </div>

</body>
</html>
