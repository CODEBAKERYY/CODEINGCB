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
<link href="./csss/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="./csss/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link  href="csss/signstyle.css" rel="stylesheet" >

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

<%@ include file="header.jsp" %>  


  <div class="center" >
    <h1>Signup</h1>
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
        <div class="txt_field">
          <input type="password" required>
          <span></span>                                        
          <label>password check</label>
        </div>
        <div class="txt_field">
          <input type="text" required>
          <span></span>                                        
          <label>user name</label>
        </div>
        <div class="txt_field">
          <input type="text" required>
          <span></span>                                        
          <label>phone</label>
        </div>
         <div class="txt_field">
          <input type="text" required>
          <span></span>                                        
          <label>email</label>
        </div>
        <div class="txt_field">
          <input type="file" id="photo" name="photo" style="display:none"  required>
          <input type="text" id="phototext" required>
          <span></span>                                        
          <label>photo</label>
        </div>
        <div class="language">
        	<div>Preferred language</div>
        	<input type="checkbox" id="java" value="java">java</input>
        	<input type="checkbox" id="python" value="python">python</input>
        	<input type="checkbox" id="c++" value="c++">c++</input>
        	<input type="checkbox" id="c" value="c">c</input>
        	<input type="checkbox" id="javascript" value="javascript">javascript</input>
        </div>
 
     <!--    <div class="pass"> Forgot password</div> -->
        <input type="submit" value="Signup" style="margin-top:20px">
     	
        <div class="signup_link">
          Are you member? <a href="#">Login</a>
        </div>
        
    </form>
  </div>
<div style="height:100px;"></div>
</body>
</html>
