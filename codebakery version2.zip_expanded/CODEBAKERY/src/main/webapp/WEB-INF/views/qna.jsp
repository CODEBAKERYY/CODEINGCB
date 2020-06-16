<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!--bootstrap css  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/csss/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/csss/boardstyle.css" rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body >
	<%@ include file="header.jsp"%>
	<div id="logo" class="container">
		<h1>
			<a href="qna.do"><span>질문 게시판</span></a>
		</h1>
	</div>

	<div id="mainbar">
		<div id="page" class="container">
			<div class="flush-left js-search-results">
				<div>
					<!-- 게시물 시작 -->
					<c:choose>
						<c:when test="${empty list }">
							<a href="qna_detail.do">------------- 작성된 글이 없습니다. -------------</a>
						</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<div class="question-summary search-result" id="question-summary-2194808" data-position="1" style="padding: 30px">
								<div class="statscontainer">
									<div class="stats">
										<div class="vote">
											<div class="votes ">
												<span class="vote-count-post " style="font-size: 20px"><strong>1898</strong></span>
												<div class="viewcount">votes</div>
											</div>
										</div>
									<div class="status answered-accepted">
										<strong style="font-size: 20px">17</strong><br /> answers
									</div>
									</div>
								</div>
							<div class="summary">
								<div class="result-link">
									<h3><a href="qna_detail.do?question_No=${dto.question_No }"> ${dto.question_Title }</a></h3>
									<div class="excerpt">${dto.question_Content }</div>
									
									<div class="tags user-tags t-android t-eclipse t-certificate">
										<a href="#" class="post-tag" title="" rel="tag">android</a> 
										<a href="#" class="post-tag" title="" rel="tag">eclipse</a> 
										<a href="#" class="post-tag" title="" rel="tag">certificate</a>
									</div>
									
									<div class="started fr">
									<span title="" class="relativetime">${dto.question_Date }</span> 
									Asked By <a href="#">${dto.user_Id }</a>
									</div>
								</div>
							</div>
							</div>
							<hr></hr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
							
					<!-- 페이징 -->
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>

		<div id="content"></div>
	</div>







	<%@ include file="footer.jsp"%>
</body>
</html>
