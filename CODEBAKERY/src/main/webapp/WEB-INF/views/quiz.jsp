<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
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
	<%int i  = 0; %>
	<div class="major">
		<h2 style="padding-top: 10px">문제 게시판</h2>
	</div>
	<input type="hidden" name="user_Id" value="${User.user_Id }"/>
	
	<div align="center">
	<table border = "1" class="tableForm">
		<colgroup>
			<col width="70" />
			<col width="400" />
			<col width="100" />
			<col width="100" />
			<col width="100"/>
			<col width="70"/>
		</colgroup>
		<tr>
			<th>문제 번호</th>
			<th>제목</th>
			<th>정답</th>
			<th>제출</th>
			<th>정답 비율</th>
			<th>결과</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="6" align="center">------------- 작성된 글이 없습니다.-------------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.quiz_No }</td>
						<td><a href="quiz_detail.do?quiz_No=${dto.quiz_No}">${dto.quiz_Title }</a></td>
					<c:choose>
						<c:when test="${empty resultList }">
							<td></td>
							<td>${dto.correct_User }</td>
							<td>${dto.try_User }</td>
							<td>${dto.correct_Rate }%</td>
						</c:when>
						<c:otherwise>
							
								<td>${dto.correct_User }</td>
								<td>${dto.try_User }</td>
								<td>${dto.correct_Rate }%</td>
								
								<c:forEach items="${resultList }" var="resultdto">
								<c:choose>
									<c:when test="${(dto.quiz_No == resultdto.quiz_No) and (resultdto.quiz_Result eq '성공')}">
										<td><label class="successResult">${resultdto.quiz_Result }</label></td>
										<%i = 1 ;%>
									</c:when>
									<c:when test="${(dto.quiz_No == resultdto.quiz_No) and (resultdto.quiz_Result eq '실패')}">
										<td><label class="failResult">${resultdto.quiz_Result }</label></td>
										<%i = 1 ;%>
									</c:when>
									<c:otherwise>
										<%i = 0; %>
										<c:forEach items="${resultList }" var="resultdto2">
											<c:choose>
												<c:when test="${dto.quiz_No == resultdto2.quiz_No }">
													<% i = 1; %>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</c:forEach>
								<%
										if(i == 1){
												System.out.println("i : "+i);
										%>
										<%
											}else if(i == 0){
												System.out.println("i : "+i);
										%>
											<td></td>		
										<%		
											}
									%>
						</c:otherwise>
					</c:choose>						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<!-- 작성 버튼은 등급이 멘토일때만 보이게 구현 c:if사용-->
		<div class="major">
			<input type="button"
				value="문제 작성" class="button" onclick="location.href='quiz_write.do'" />
		</div>
	</div>
	<br>
	<br>
	<hr size="2px" color="#3f3f3f" width="93%">

	<%@ include file="footer.jsp"%>

</body>
</html>