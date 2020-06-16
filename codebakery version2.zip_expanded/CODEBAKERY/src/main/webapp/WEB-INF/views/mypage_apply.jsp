<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="./css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="./fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />

<style type="text/css">

	h1{
		text-align: center;
		padding: 40px;
		text-decoration: underline;
		text-underline-position: under;
		text-decoration-color: green;
		font-family: serif;
	}

	.form{
		background-color: white;
		width: 70%;
		height: 100%;
		margin: auto;
		margin-top: 10%;
		margin-botton: 10%;
		box-shadow: 5px 5px 5px 5px gray;
	}
	
	.introduce{
		background-color: whitesmoke;
		width: 60%;
		margin: auto;
		height: 100px;
		text-align: center;
		
	}
	
	button{
		width: 120px;
		height: 44px;
		background-color: #4CAF50; /* Green */
	  	border: none;
	  	color: white;
	  	padding: 15px 32px;
	  	text-align: center;
	  	text-decoration: none;
	  	display: inline-block;
	  	font-size: 16px;
		
	}
	
	#content{
	    background-color: lightgrey;
	    height: 40%;
	    width: 70%;
	    margin: auto;
	    text-align: center;
    	margin-left: 15%;
	}
</style>
</head>
<body>
<%@ include file="header.jsp"%>

	<div class="form">
		<h1>멘토 신청하기</h1>
			
		<div class="introduce">
			<br>
			안녕하세요. 환영니다.<br>
			멘토 신청 관련 공지사항.<br>
			감사합니다.<br>
		</div>
			
		<div style="text-align:center;">
			<div style="padding: 2%;">신청자 &nbsp;&nbsp;
				<input type="text" style="width:200px; height: 20px;"/><br>
			</div>
			<div >멘토경력&nbsp;&nbsp;
				<textarea rows="5" cols="70" style="text-align: center; resize:none;"></textarea>
			</div>	
			<div style="padding: 2%;">멘토소개&nbsp;&nbsp;
				<textarea rows="15" cols="70" style="text-align: center; resize:none;"></textarea>
			</div>	
			<div>
				<br>
				<button>신청하기</button>
				<button>취소</button>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>