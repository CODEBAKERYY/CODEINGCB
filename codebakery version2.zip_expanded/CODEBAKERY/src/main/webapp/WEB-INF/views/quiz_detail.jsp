<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="css/defaultQuestion.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	
	<div id="contact" class="container" style=" border-bottom: solid 1px #eee">
		<div class="page-header" style="margin: 40px 0 20px">
			<h2 style="padding-top: 20px;">Hello World!!!</h2>
		</div>
	</div>
	
	<div id="contact" class="container">
		<table style="width: 100%; max-width: 100%; margin-top: 20px; margin-bottom: 20px;">
			<thead id="table-bottom-border">
				<tr>
					<th width="10%" style="text-align: left;">제출</th>
					<th width="10%" style="text-align: left;">정답자</th>
					<th width="10%" style="text-align: left;">정답 비율</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>10000</td>
					<td>3000</td>
					<td>3000/10000</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="contact" class="container">
		<section id="description">
			<div class="headline">
				<h2>문제</h2>
			</div>
			<div>
				<p>
					문제 설명 어쩌구 저쩌구
				</p>
			</div>
		</section>
	</div>
	
	<div id="contact" class="container">
		<section id="input">
			<div class="headline">
				<h2>입력</h2>
			</div>
			<p>
				입력값
			</p>
		</section>
	</div>
	
	<div id="contact" class="container">
		<section id="output">
			<div class="headline">
				<h2>출력</h2>
			</div>
			<p>
				출력값
			</p>
		</section>
	</div>
	
	<div id="contact" class="container">
		<div class="samplediv">
			<section id="sampleinput1" style="margin-right: 25px;">
				<div class="headline">
					<h2>예제 입력 1</h2>
				</div>
				<pre class="sampledata">
				</pre>
			</section>
		</div>
		<div class="samplediv">
			<section id="sampleoutput1" style="margin-left: 25px;">
				<div class="headline">
					<h2>예제 출력 1</h2>
				</div>
				<pre class="sampledata">Hello World!!!
asdf
				asd
				fas
				dfa
				sfd
				</pre>
			</section>
		</div>
	</div>		
	
	<div id="contact" class="container" style="text-align: right;">
		<input type="button" value="문제 풀기" class="button" style="border-radius: 12px; margin-top: 30px;"/>
	</div>
	
	<footer style="clear: both; margin-top: 40px;">
		<%@ include file="footer.jsp"%>
	</footer>
	
</body>
</html>