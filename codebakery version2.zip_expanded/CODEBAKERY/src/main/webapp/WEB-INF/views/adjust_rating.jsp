<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
</style>
<script type="text/javascript">
function gradeChk() {
	   // select 태그의 선택된 value
	   var grade = $("#grade").val();
	   // input hidden의 value
	   var gradeChk = $("#gradeChk").val();
	   
	   if(grade == "" || grade == null) {
	      gradeChk = "";
	   } else {
	      gradeChk = grade;
	   }
	}
</script>
</head>
<body>
	<div class="title" style="margin-bottom: 20px; margin-top: 20px;">
			<h2>등급조정</h2>
	</div>
	
	<form action="adjustres.do">
	<table>
		<tr>
			<td>
				<input type="hidden" id="gradeChk" name="gradeChk"/>
				<select class="grade" id="grade" style="display: inline-block; width: 150px; height: 25px; margin-left: 60px;" onchange="gradeChk();">
				   <option value="">등급선택</option>
				   <option value="user">일반회원</option>
				   <option value="mentor">멘토</option>
				</select>
			</td>
			<td>
				<input type="submit" class="confirm" value="확인">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>