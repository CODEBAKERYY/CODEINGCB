<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/boardstyle.css" rel="stylesheet" type="text/css" media="all" />

<!------- 페이징 효과때문에 추가 ------>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!------- 페이징 효과때문에 추가 ------>

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<style type="text/css">
	
	#notice>table>thead>tr { text-align: center; }
	#notice>table>tbody>tr { text-align: center; }
	.pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}
	
</style>

</head>

<body>

	<%@ include file="header.jsp"%>
	
	<div id="logo" class="container">
		<h1>
			<span>공지사항</span>
		</h1>
	</div>

	<!--============== 공지사항 게시글 리스트 START ==============-->
 	<div class="container" id="notice">
                <table class="table table-hover">
                  <thead style="background-color: #DCDCDC;">
                    <tr style="text-align: center;">
                    	<td style="width: 100px;">No</td>
                        <td style="width: 300px;">Title</td>
                        <td style="width: 150px;">Writer</td>
                        <td style="width: 150px;">Date</td>
                        <td style="width: 150px;">View</td>
                    </tr>
                    </thead>
                <tbody>
                    <c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="7" align="center">--- 공지사항이 없습니다. ----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ list }" var="list" begin="${ count }" end="${ count + 9 }">
								<tbody class="tbody">
									<tr>
										<td>${ list.notice_No }</td>
										<td><a href="notice_view.do?notice_No=${list.notice_No }">${ list.notice_Title }</a></td>
										<td>${ list.user_Id }</td>
										<td>${ list.notice_Date }</td>
										<td>${ list.notice_Views }</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:otherwise>
					</c:choose>
    				<c:set var="count" value="${ count + 10 }" />
                    </tbody>
            </table>
                <br><br>
                <div class="text-right">
                    <button type="button" class="btn btn-secondary pull-right" onclick="location.href='notice_write.do'" style="width: 8%;" >글쓰기</button>
                </div>
				<br><br>
			<!--============== 공지사항 게시글 리스트 END ==============-->
			
			<!--============== 페이지 버튼 STATRT ==============-->
            <div style="width: 100%; height:100%;  text-align: center;">
                <div style="margin: 0 auto; display: inline-block;">
	                <div class="container">
						<ul class="pagination">
							  <li><a href="#">«</a></li>
				              <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
				              <li><a href="#">2</a></li>
				              <li><a href="#">3</a></li>
				              <li><a href="#">4</a></li>
				              <li><a href="#">5</a></li>
				              <li><a href="#">»</a></li>
						 </ul>
					</div>
                </div>
            </div>
            <!--============== 페이지 버튼 END ==============-->
        </div>
        <br><br><br><br><br><br><br>


	<%@ include file="footer.jsp"%>
</body>
</html>
