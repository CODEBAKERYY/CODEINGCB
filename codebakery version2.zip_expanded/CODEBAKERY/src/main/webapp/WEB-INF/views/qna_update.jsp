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

<style type="text/css">
	#btnSave, #btnList{
		  background-color: #e7e7e7; 
		  border: none;
		  color: balck;
		  padding: 10px 24px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		}
</style>
</head>

<body>
	<%@ include file="header.jsp"%>
	
	<div id="logo" class="container">
		<h1><a class="icon icon-tasks"><span>질문 수정하기</span></a></h1>
	</div>
	
	<article>
		<div class="container" role="main">
			<form name="form" id="form" role="form" method="post" action="update_question.do">
			<input type="hidden" name="question_No" value="${dto.question_No }" />
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="question_Title" value="${dto.question_Title }">
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<!-- <input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요"> -->
					<p>${dto.user_Id }</p>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="9" name="question_Content" style="width:100%; resize:none;">${dto.question_Content }</textarea>
				</div>
				<div class="mb-3">
					<label for="tag">TAG</label>
					<input type="text" class="form-control" name="question_Tag" placeholder="태그를 입력해 주세요" >
				</div>
			<div >
				<input type="submit" id="btnSave" value="수정완료" />
				<input type="button" id="btnList" value="목록" onclick="location.href='qna_detail.do?question_No=${dto.question_No}'" />
			</div>
			</form>
		</div>
	</article>

	<%@ include file="footer.jsp"%>
</body>
</html>