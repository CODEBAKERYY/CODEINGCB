<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="./css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="./css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />

<style type="text/css">

	.form{
		background-color: white;
		width: 70%;
		margin: auto;
		margin-top: 10%;
		margin-botton: 10%;
		box-shadow: 5px 5px 5px 5px gray;
	}
	.up{
		background:black;
		margin: auto;
	}
	.charge{
	    background:#3F3F3F;
	    font-size: 25px;
	    color:white;
	}
	.pointtable{
		margin-left:auto;
		margin-right:auto;
	}
	.pointtable tr td{
		margin-left:auto;
		margin-right:auto;
		font-size:30px;
	}
	.title{
	
	}
	.holdingpoint{
		font-size: 30px;
		color:#2691d9; 
		font-weight:bold
	}
	.sub_title{
		margin-top:10px;
	}
	
</style>
</head>
<body>
<%@ include file="header.jsp"%>
	
<div class="form">
		<div class="title" style="margin-bottom: 20px; margin-top: 50px; height:250px;">
			<div class="sub_title">
				<h2>마이 포인트</h2>
			</div>
			<hr>
			<br>
	
			<table class="pointtable">
				<tr>
					<td colspan = "2" class="holdingpoint">보유 포인트</td>
				</tr>
				<tr>
					<td colspan = "2" >${User.user_Point}</td>
				</tr>
				<tr>
					<td colspan = "2" ><input type="button" class="charge" value="포인트 충전하기" onclick="location.href='payment.do'"></input></td>
				</tr>
			</table>
			
			
		</div>
		
		
	</div>
	
	
	<br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>