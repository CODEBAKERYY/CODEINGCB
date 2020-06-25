<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text:html; charset=UTF-8"); %>
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
	<header>
		<%@ include file="header.jsp" %>
	</header>
		<form action="quiz_Answer.do">
			<div class="major">
				<select name="quiz_type">
					<option value="java">Java</option>
					<option value="c">C</option>
					<option value="c++">C++</option>
				</select>
			</div>
			<div class="major">
				<textarea rows="30" cols="80" name="quiz_answer"></textarea>
			</div>
			<!-- <input type="hidden" name="quiz_type" value="java"/> -->
			<div class="major">
				<input type="submit" class="button" value="제출"/>
			</div>
		</form>
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>