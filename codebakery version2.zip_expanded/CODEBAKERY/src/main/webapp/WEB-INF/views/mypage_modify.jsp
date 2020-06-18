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
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<%@ include file="header.jsp"%>
	
		<div class="title" style="margin-bottom: 20px; margin-top: 20px">
			<h2>마이페이지 수정</h2>
		</div>
		
		<table class="tableForm" style="margin: auto; width: 60%; height: 800px; text-align: center; font-size: 22px">
			<tr>
				<th>ID</th>
				<td><input type="text" name="userid" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td><input type="password" name="userpw" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="username" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="text" name="phone" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="email" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>PREFERRED LANGUAGE</th>
				<td>
					<input type="checkbox" id="java"><label for="java">java</label>
					<input type="checkbox" id="python"><label for="python">python</label>
					<input type="checkbox" id="c++"><label for="c++">c++</label>
					<input type="checkbox" id="c"><label for="c">c</label>
					<input type="checkbox" id="javascript"><label for="javascript">javascript</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="button" value="수정" onclick="#">
					<input type="button" class="button" value="취소" onclick="#">
					<input type="button" class="button" value="탈퇴" onclick="#">
				</td>
			</tr>
		</table>
		
<%@ include file="footer.jsp"%>
</body>
</html>