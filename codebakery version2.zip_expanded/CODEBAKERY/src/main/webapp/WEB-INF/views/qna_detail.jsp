<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--waterboat css-->

  <link href="https://fonts.googleapis.com/css?family=Oswald:400,700|Dancing+Script:400,700|Muli:300,400" rel="stylesheet"type="text/css" media="all"/>
  <link  href="fonts/icomoon/style.css" rel="stylesheet" type="text/css" media="all"/>

  <link href="resources/csss/bootstrap.min.css" rel="stylesheet"  type="text/css" media="all"/>
  <link href="resources/csss/jquery-ui.css" rel="stylesheet" />
  <link rel="stylesheet" href="resources/csss/owl.carousel.min.css"/>
  <link rel="stylesheet" href="resources/csss/owl.theme.default.min.css"/>
  <link rel="stylesheet" href="resources/csss/owl.theme.default.min.css"/>

  <link rel="stylesheet" href="resources/csss/jquery.fancybox.min.css"/>

  <link rel="stylesheet" href="resources/csss/bootstrap-datepicker.css"/>

  <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css"/>

  <link rel="stylesheet" href="csss/aos.css"/>
  <link href="resources/csss/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css"/>

  <link href="resources/csss/style.css" rel="stylesheet" />
  <link href="resources/csss/board-detail.css" rel="stylesheet" />
 

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<%@ include file="header.jsp" %>  
	<div id="logo" class="container">
		<h1>
			<a href="#" class="icon icon-tasks"><span>질문 게시판</span></a>
		</h1>
	</div>

	<section class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 blog-content">
			
			<!--------- 질문글 START ----------->
				<span class="title">${qlist.question_Title }</span>
				<div class="post-meta">
								<span class="author">${qlist.user_Id }</span>
								<span class="date">${qlist.question_Date }</span>
								<!-- 자신의 글일때
								<span><a href="#">수정</a></span>
								<span><a href="#" onclick="#">삭제</a></span> -->
				</div>
				<hr />
				<p class="lead">${qlist.question_Content }</p>
				<div class="pt-5">
					<p> Tags: <a href="#">#html</a>, <a href="#">#trends</a></p>
				</div>
			<!--------- 질문글 End ----------->	
				
			<!--------- 리뷰 START ----------->
				<div class="pt-5">
					<h3 class="mb-5">${clist.size() } Comments</h3>
					<ul class="comment-list">
						<c:choose>
							<c:when test="${empty clist }">
								<li>---------- 작성된 댓글이 없습니다. ----------</li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${clist }" var="dto">
								<li class="comment">
									<div class="vcard bio">
										<img src="resources/csss/images/person_4_sq.jpg" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>${dto.user_Id }</h3>
										<div class="meta">${dto.comment_Date }</div>
										<p>${dto.comment_Content }</p>
										<p>
											<a href="#" onclick="#" class="reply">Reply</a>
											<br/>
											<textarea class="form-control" style="width:80%; display:none;" placeholder="댓글을 입력해주세요."></textarea>
										</p>
									</div>
								</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!--------- 리뷰 END ----------->
				
				<!--------- 답글 START ----------->
				<div class="pt-5">
					<h3 class="mb-5">${alist.size()} Answers</h3>
					<c:choose>
						<c:when test="${empty alist }">
							<p>------------------- 작성된 리뷰가 없습니다. -------------------</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${alist }" var="dto">
								<span class="title">RE: ${dto.answer_Title }</span>
								<div class="post-meta">
									<span class="author">${dto.user_Id }</span>
									<span class="date">${dto.answer_Date }</span>
									<!-- 자신의 글일때
									<span><a href="#">수정</a></span>
									<span><a href="#" onclick="#">삭제</a></span> -->
								</div>
								<hr />
								<p class="lead">${dto.answer_Content }</p>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<!--------- 답글 END ----------->
				
				
				<!--------- 답글작성칸 START ----------->
				<div class="pt-5">
					<h3 class="mb-5">Your Answer</h3>
					<textarea class="answer" style="width:100%"></textarea>
					<button type="button" class="btn btn-secondary btn-sm">Post Your Answer</button>			
				</div>
				<hr />
				<!--------- 답글작성칸 END ----------->
				
				
				</div>
			</div>
		</div>
	</section>



	<%@ include file="footer.jsp" %>  
</body>
</html>
