<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<style type="text/css">
	body{
		background: #F2EFEF;
	}
	
	h2{
		text-align: center;
	    padding: 8px;
       	font-size: 28px;
       	margin-top: 20px;
	}
	
	table{
		margin-left: 50px;		
	}
	
	form{
		margin-top: 40px;
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">

	function chkId(){
		
		var id = $("#nuser_Id").val();
		
		$.ajax({
			url: "chkNonUser.do",
			type: 'POST',
			data: {"nuser_Id":id},
			success: function(data){
				if(data == false){
					alert("등록 가능한 아이디 입니다.");
				} else{
					alert("다른 아이디로 등록해주세요.");
					return false;
				}
			},
			error: function(request, status, error){
				alert("ajax 통신 실패!");
			} 
		}); 
		
	}


	function nonUserForm(){
		
		var id = $("#nuser_Id").val();
		var pw = $("#nuser_Pw").val();
		var qno = $("#question_No").val();
		var title = $("#answer_Title").val();
		var content = $("#answer_Content").val();
		
		$.ajax({
			url: "nonUser.do",
			type: 'POST',
			data: {"nuser_Id":id, "nuser_Pw":pw, "question_No":qno, "answer_Title":title, "answer_Content":content},
			success: function(data){
				alert("답변이 등록되었습니다.")
				window.close();
				window.opener.location.reload();
			},
			error: function(request, status, error){
				alert("ajax 통신 실패!");
			} 
		}); 
		
	}

	
</script>
</head>
<body>
	<h2>비회원 등록하기</h2>
	<form method="post" id="userForm">
		<input type="hidden" id="question_No" value="${answer.question_No }" />
		<input type="hidden" id="answer_Title" value="${answer.answer_Title }"/>
		<input type="hidden" id="answer_Content" value="${answer.answer_Content }"/>
		<table>
			<tr>
				<th> 임시 아이디: </th>
				<td><input type="text" name="nuser_Id" id="nuser_Id"/></td>
			</tr>
			<tr>
				<th> 임시 비밀번호: </th>
				<td><input type="text" name="nuser_Pw" id="nuser_Pw" onfocus="chkId();"/></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="등록하기" onclick="nonUserForm();"/>
					<input type="button" value="닫기" onclick="javascript:window.close()"/>
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>