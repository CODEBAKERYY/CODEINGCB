<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="resources/css/defaultQuestion.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="major">
		<h2 style="padding-top: 10px">문제 게시판</h2>
	</div>

	<!-- SpringMVC01에서 boardlist 그대로 가져옴 기능구현할 때 변경해야함 -->
	<div align="center">
	<table border = "1" class="tableForm">
		<colgroup>
			<col width="70" />
			<col width="400" />
			<col width="70" />
			<col width="100" />
			<col width="100"/>
			<col width="100"/>
		</colgroup>
		<tr>
			<th>문제 번호</th>
			<th>제목</th>
			<th>결과</th>
			<th>정답</th>
			<th>제출</th>
			<th>정답 비율</th>
			
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="6" align="center">------------- 작성된 글이 없습니다.
						-------------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
<<<<<<< HEAD
						<td>${dto.quiz_No }</td>
						<td><a href="quiz_detail.do?quiz_No=${dto.quiz_No}">${dto.quiz_Title }</a></td>
=======
>>>>>>> origin/parkjuhyeok
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<!-- 작성 버튼은 등급이 멘토일때만 보이게 구현 c:if사용-->
		<tr>
			<td colspan="6" align="right"><input type="button"
				value="문제 작성" class="button" onclick="location.href='quiz_write.do'" /></td>
		</tr>
	</table>
	</div>
	<br>
	<br>
	<hr size="2px" color="#3f3f3f" width="93%">


	<%@ include file="footer.jsp"%>

</body>
</html>