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
<<<<<<< HEAD
 
=======
  
<style type="text/css">
	.comment-list{
		display: none;
	}
</style>
  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">


		//댓글보기 버튼 클릭
		function showComment(){
			
			if($(".comment-list").css("display") == "none"){
				$(".comment-list").css("display", "block");
				$("#shwComm").val("댓글 숨기기");
			} else{
				$(".comment-list").css("display", "none");
				$("#shwComm").val("댓글 더보기");
			} 
		}
		
		




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
			
			if(user_Id == "" || user_Id == null){
				alert("로그인후 이용가능합니다");
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
				}
			}); 
			
		}

	

	// 답변수정
	 function modifyAnswer(question_No, answer_No, answer_Title, answer_Content){
			
		
		var setting = "width=400, height=450"
		var url = "answer_modify.do?question_No="+question_No+"&answer_No="+answer_No+"&answer_Title="+answer_Title+"&answer_Content="+answer_Content;
		
		window.open(url, "", setting);
		window.close();
		
		
		  /* $.ajax({
			url: "answer_modify.do",
			type: 'POST',
			data: {"question_No":question_No, "answer_No":answer_No, "answer_Title":answer_Title, "answer_Content":answer_Content},
			success: function(data){
				window.close();
				window.opener.location.reload();
			},
			error: function(request, status, error){
				alert("ajax 통신 실패!");
		        //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});   */ 
		

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
	
	
		$(function(){
			$("#commentForm").submit(function(){
				var user_Id = document.getElementsByName("user_Id")[0].value;
				var Content = document.getElementById("inputComment")[0].value;
				
				
				if(Content == "" || Content == null){
					alert("내용을 입력해 주세요.");
					return false;
				}
				
				if(user_Id == "" || user_Id == null){
					alert("로그인이 필요합니다.");
					return false;
				}
				
			});
		});	
	
	
		
	
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
		
		//댓글수정 폼열기
		function modifyComment(comment_No, comment_Content){
			//alert(comment_No + ": "+comment_Content);
			
				var a = "";
				
				a += '<div class="input-group">';
			    a += '<input type="text" class="form-control" name="comm_Content" value="'+comment_Content+'"/>';
			    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdate('+comment_No+','+comment_Content+');">수정</button> </span>';
			    a += '</div>';
			
			$("#result").html(a);
		}
		
		//댓글수정
		function commentUpdate(comment_No,comment_Content){
			
			var comm = $('input[name=comm_Content]').val();
			
			
			console.log(comment_No + ": " + comm);
			
			$.ajax({
				url: "updateComment.do",
				type: "POST",
				data: {"comment_No":comment_No, "comment_Content" : comm},
				success:function(data){
						alert("댓글이 수정되었습니다.")
						location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			
		}
	
		
	// ------------------------ 댓글 ------------------------------

        

	
</script>
>>>>>>> parent of 4d88b8a... 승연이꺼 추가

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
<<<<<<< HEAD
					<p> Tags: <a href="#">#html</a>, <a href="#">#trends</a></p>
				</div>
			<!--------- 질문글 End ----------->	
				
			<!--------- 리뷰 START ----------->
				<div class="pt-5">
					<h3 class="mb-5">${clist.size() } Comments</h3>
=======
					<p> Tags: <a href="#">${qlist.question_Tag }</a></p>
				</div>
				<div style="text-align: right;">
					<c:if test="${!empty User && (User.user_Id eq qlist.user_Id) }">
					<input type="button" value="수정" onclick="location.href='qna_update.do?question_No=${qlist.question_No}'"/>
					<input type="button" value="삭제" onclick="location.href='qna_delete.do?question_No=${qlist.question_No}'"/>
					</c:if>
					<input type="button" value="목록" onclick="location.href='qna.do'"/>
				</div>
			<!--------- 질문글 End ----------->	
					<br></br><br></br>
			<!--------- 댓글 START ----------->
					<form action="writeComment.do" id="commentForm" method="post">
						<input type="hidden" name="user_Id" value="${User.user_Id }" />
						<input type="hidden" name="question_No" value="${qlist.question_No }" />
	                    <div>
	                        <div>
	                            <table class="table">                    
	                       			 <tr>
	                       			 	<td style="font-weight: bold; font-size: 20px; font-family: initial;" >${clist.size() } Comments</td>
	                       			 	<td><input type="button" class="btn btn-outline-secondary" value="댓글 더보기" onclick="showComment();" id="shwComm"/></td>
	                       			 </tr>
	                                <tr>
	                                    <td>
	                                        <textarea class="form-control" style="width: 1000px; resize: none;" rows="2" cols="30" id="inputComment" name="comment_Content" placeholder="댓글을 입력하세요"></textarea>
	                                    </td>
	                                    <td style="text-align: right; mdisplay:table-cell; vertical-align:middle;">
	                                    	<input type="submit" class="btn btn-primary" value="등록" style="width: 90px; height: 50px;"/>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>  
	                </form>
	                <br></br>
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
					<ul class="comment-list">
						<c:choose>
							<c:when test="${empty clist }">
								<li>---------- 작성된 댓글이 없습니다. ----------</li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${clist }" var="dto">
<<<<<<< HEAD
								<li class="comment">
=======
								<li class="comment" id="onecomm">
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
									<div class="vcard bio">
										<img src="resources/csss/images/person_4_sq.jpg" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>${dto.user_Id }</h3>
<<<<<<< HEAD
										<div class="meta">${dto.comment_Date }</div>
										<p>${dto.comment_Content }</p>
										<p>
											<a href="#" onclick="#" class="reply">Reply</a>
											<br/>
											<textarea class="form-control" style="width:80%; display:none;" placeholder="댓글을 입력해주세요."></textarea>
=======
										<span class="meta"><fmt:formatDate value="${dto.comment_Date }" pattern="yyyy.MM.dd HH:mm:ss"/></span>&nbsp;&nbsp;
										<c:if test="${!empty User && (User.user_Id eq dto.user_Id) }">
										<input type="button" value="수정" onclick="modifyComment(${dto.comment_No}, '${dto.comment_Content }');"/>
										<input type="button" value="삭제" onclick="deleteComment(${dto.comment_No}, ${qlist.question_No });"/>
										</c:if>
										<p>${dto.comment_Content }</p>
										<p>
											<a href="#" class="reply">Reply</a>
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
										</p>
									</div>
								</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
<<<<<<< HEAD
				<!--------- 리뷰 END ----------->
=======
				<br />
            	<div class="container" style="margin-bottom: 70px;">
                <div id="result"></div> 
				<!--------- 댓글 END ----------->
				
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
				
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
<<<<<<< HEAD
									<span class="date">${dto.answer_Date }</span>
									<!-- 자신의 글일때
									<span><a href="#">수정</a></span>
									<span><a href="#" onclick="#">삭제</a></span> -->
=======
									<span class="date"><fmt:formatDate value="${dto.answer_Date }" pattern="yyyy.MM.dd HH:mm"/></span>
									<c:if test="${!empty User && (User.user_Id eq dto.user_Id) }">
									<input type="button" value="수정" onclick="modifyAnswer(${qlist.question_No }, ${dto.answer_No}, '${dto.answer_Title }', '${dto.answer_Content }');"/>
									<input type="button" value="삭제" onclick="deleteAnswer(${dto.answer_No}, ${qlist.question_No });"/>
									</c:if>
>>>>>>> parent of 4d88b8a... 승연이꺼 추가
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
