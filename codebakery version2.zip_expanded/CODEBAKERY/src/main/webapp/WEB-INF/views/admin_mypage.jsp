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
<link href="resources/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
function adjust(){
    var url="adjust_rating.jsp";
    	window.open(url,"","width=250,height=150,left=400,top=200");
	}
</script>
<style type="text/css">
	.line{
		border-bottom: 1px solid black;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="title" style="margin-bottom: 20px; margin-top: 20px">
			<h2>회원관리</h2>
	</div>
	 
	<table class="tableForm" style="margin: auto; width: 60%; height: 800px; text-align: center; font-size: 22px">
		<tr class="line">
			<th>회원아이디</th>
			<th>회원이름</th>
			<th>회원등급</th>
			<th>등급조정</th>
		</tr>
		<tr>
			<td>minseokZzang</td>
			<td>권민석</td>
			<td>일반회원</td>
			<td><input type="button" value="조정하기" class="button" onclick="adjust();"></td>
		</tr>
		<tr>
			<td>stella</td>
			<td>정승연</td>
			<td>일반회원</td>
			<td><input type="button" value="조정하기" class="button" onclick="adjust();"></td>
		</tr>
		<tr>
			<td>LakinRad</td>
			<td>이재익</td>
			<td>멘토</td>
			<td><input type="button" value="조정하기" class="button" onclick="adjust();"></td>
		</tr>
		<tr>
			<td>soo</td>
			<td>주수현</td>
			<td>멘토</td>
			<td><input type="button" value="조정하기" class="button" onclick="adjust();"></td>
		</tr>
		<tr>
			<td>ju</td>
			<td>박주혁</td>
			<td>일반회원</td>
			<td><input type="button" value="조정하기" class="button" onclick="adjust();"></td>
		</tr>
		<tr>
			<td>geon)</td>
			<td>김건영</td>
			<td>멘토</td>
			<td><input type="button" value="조정하기" class="button" onclick="adjust();"></td>
		</tr>
	</table>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>