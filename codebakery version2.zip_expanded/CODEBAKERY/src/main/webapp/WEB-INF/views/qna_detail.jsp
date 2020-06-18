<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.lang.String.*" %>
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
  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">

	// ------------------------ 답변 -------------------------------
	
		//답변쓰기
		function writeAnswer(){
			
			var user_Id = '<c:out value="${User.user_Id}"></c:out>';
			var question_No = ${qlist.question_No}
			var answer_Title = $("#answer_Title").val();
			var answer_Content = $("textarea#answer_Content").val();
			
			if(answer_Title == "" || answer_Title == null){
				alert("제목을 작성해주세요!");
			 	return false;
			}
			
			if(answer_Content == "" || answer_Content == null){
				alert("내용을 작성해 주세요!");
				return false;
			}
			
			
			 $.ajax({
				url: "answer_write.do",
				type: 'POST',
				data: {"answer_Title":answer_Title, "answer_Content":answer_Content, "user_Id":user_Id, "question_No":question_No},
				success: function(data){
					alert("답변이 작성 완료되었습니다.")
					location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
			        //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			        location.reload();
				}
			}); 
			
		}


	// 답변수정
	function modifyAnswer(question_No, answer_No, answer_Title, answer_Content){
		var a = '';
		
		a += '<div class="input-group">';
	    a += '<input type="text" name="answer_Title" style="width:400px; height:40px;" value="'+answer_Title+'"/>';
	   	a += '<textarea class="answer" name="answer_Content" style="width:600px; height:150px; resize:none;">'+answer_Content+'</textarea>';
	    a += '<span class="input-group-btn">'
	    //a += '<button class="btn btn-default" type="button" onclick="saveAnswer('+question_No+','+answer_No+',\"'+answer_Title+'\", \"'+answer_Content+'\");">저장</button> </span>';
	    a += '<button class="btn btn-default" type="button" onclick="saveAnswer('+answer_No+');">저장</button> </span>';
	    a += '</div>';
	    
	    var size = ${alist.size()} 
	    
	    for(var i=0; i<size; i++){
	    	//alert($('.commentContent')[0]); //[object HTMLDivElement]
	    	console.log($('.commentContent').val());
	    }
	    
	    $('.commentContent').html(a)
	    	


	}
	
	
	
	// 수정된 답변 저장
	function saveAnswer(answer_No/* question_No, answer_No, answer_Title, answer_Content */){
		alert(answer_No);
		
		$.ajax({
			url: "answer_modify.do",
			type: 'POST',
			data: {"question_No":question_No, "answer_No":answer_No, "answer_Title":answer_Title, "answer_Content":answer_Content},
			success:function(data){
				if(data == "ture"){
					alert("답변이 수정되었습니다.")
					location.reload();
				} else{
					alert("답변 수정을 실패하였습니다.")
				}
			},
			error: function(request,status,error){
				alert("ajax 통신 실패!");
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		       
			}
			
		});
	}



	// 답변삭제
	function deleteAnswer(answer_No, question_No){
		
		var msg = confirm("해당 답변을 삭제하시겠습니까?");
		
		if(msg){
			
			$.ajax({
				url: "answer_delete.do",
				type: 'POST',
				data:{"answer_No":answer_No, "question_No":question_No},
				success:function(data){
						alert("답변이 삭제되었습니다.")
						location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		} else{
			return false;
		} 
	}
	
	// ------------------------- 답변 -----------------------------
	
	
	// ------------------------ 댓글 ------------------------------
	
	
	//댓글삭제
	function deleteComment(comment_No, question_No){
		
		var msg = confirm("댓글을 삭제하시겠습니까?");
		
		if(msg){
			
			$.ajax({
				url: "qcomment_delete.do",
				type: "POST",
				data: {"comment_No":comment_No, "question_No":question_No},
				success:function(data){
						alert("댓글이 삭제되었습니다.")
						location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		} else{
			return false;
		} 
	}
	
	// ------------------------ 댓글 ------------------------------

</script>

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
								<span class="date"><fmt:formatDate value="${qlist.question_Date }" pattern="yyyy.MM.dd"/></span>
				</div>
				<hr />
				<p class="lead">${qlist.question_Content }</p>
				<div class="pt-5">
					<p> Tags: <a href="#">${qlist.question_Tag }</a></p>
				</div>
				<div style="text-align: right;">
					<input type="button" value="수정" onclick="location.href='qna_update.do?question_No=${qlist.question_No}'"/>
					<input type="button" value="삭제" onclick="location.href='qna_delete.do?question_No=${qlist.question_No}'"/>
					<input type="button" value="목록" onclick="location.href='qna.do'"/>
				</div>
			<!--------- 질문글 End ----------->	
				
			<!--------- 댓글 START ----------->
				<div class="pt-5">
					<h3 class="mb-5">${clist.size() } Comments</h3>
					<form action="writeComment.do" id="commentForm" method="post">
						<input type="hidden" name="user_Id" value="${User.user_Id }" />
						<input type="hidden" name="question_No" value="${qlist.question_No }" />
	                    <div>
	                        <div>
	                            <table class="table">                    
	                                <tr>
	                                    <td>
	                                        <textarea class="form-control" style="width: 1100px; resize: none;" rows="2" cols="30" id="inputComment" name="comment_Content" placeholder="댓글을 입력하세요"></textarea>
	                                        <br />
	                                        <div style="text-align: right;">
	                                           <input type="submit" class="btn pull-right btn-success" value="등록" />
	                                        </div>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>  
	                </form>
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
										<span class="meta"><fmt:formatDate value="${dto.comment_Date }" pattern="yyyy.MM.dd HH:mm:ss"/></span>&nbsp;&nbsp;
										<input type="button" value="수정" onclick="modifyComment();"/>
										<input type="button" value="삭제" onclick="deleteComment(${dto.comment_No}, ${qlist.question_No });"/>
										<p>${dto.comment_Content }</p>
										<p>
											<a href="#" class="reply">Reply</a>
										</p>
									</div>
								</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<br />
            	<div class="container" style="margin-bottom: 70px;">
                <div id="result"></div>
				<!--------- 댓글 END ----------->
				
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
									<span class="date"><fmt:formatDate value="${dto.answer_Date }" pattern="yyyy.MM.dd HH:mm"/></span>
									<input type="button" value="수정" onclick="modifyAnswer(${qlist.question_No }, ${dto.answer_No}, '${dto.answer_Title }', '${dto.answer_Content }');"/>
									<input type="button" value="삭제" onclick="deleteAnswer(${dto.answer_No}, ${qlist.question_No });"/>
								</div>
								<hr />
								<p class="lead" id="comm">${dto.answer_Content }</p>
								<div class="container">
									<div class="commentContent" ></div>
								</div>
								<br></br>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<!--------- 답글 END ----------->
				
				
				<!--------- 답글작성칸 START ----------->
				<div class="pt-5">
					<h3 class="mb-5">Your Answer</h3>
						<table>
							<tr>
								<th style="text-align: center">TITLE</th>
								<td><input type="text" id="answer_Title" style="width:400px; height:40px;"/></td>
							</tr>
							<tr>
								<th style="text-align: center">CONTENT&nbsp;&nbsp;&nbsp;</th>
								<td><textarea class="answer" id="answer_Content" style="width:600px; height:150px; resize:none;" ></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="button" class="btn btn-secondary btn-sm" value="Post Your Answer" onclick="writeAnswer();"/>	
								</td>
							</tr>
						</table>
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
