<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/csss/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/csss/fonts/fonts.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="resources/csss/signstyle.css" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">

	function idcheckz() {
		
		var idCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		if (!idCheck.test($("#userid").val())) {
			alert("4~12자리의 영문 대소문자와 숫자로만 입력해주세요");
			$("#userid").val("");
			$("#userid").focus();
			return false;
		}
	}

	
	function pwcheckz() {
		var passwdCheck = RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/);
		if (!passwdCheck.test($("#userpw").val())) {
			alert("8~16자리의 영문 소문자, 숫자, 특수문자를 하나 이상 포함하여 입력해주세요");
			$("#userpw").val("");
			$("#userpw").focus();
			return false;
		}
	}


	function idchk() {
		var user_Id = $('#userid').val();
		var idchk = {
			"user_Id" : user_Id
		};
		$.ajax({
			type : "POST",
			url : "idcheck.do",
			data : JSON.stringify(idchk),
			contentType : "application/json",
			dataType : "json",
			success : function(msg) {
				console.log(msg);
				if (msg.check == false) {
					alert("사용 가능한 아이디입니다.");
				} else {
					alert("사용할 수 없는 아이디입니다.");
				}
			},
			error : function() {
				alert("ajax 통신 실패!");
			}

		});
	}

	$(function() {
		
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#userpw").val();
			var pwd2 = $("#userpwcheck").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
				}
			}
		});
		
		$("#signupform").submit(
				
				function() {
					
					var id = $("#userid").val();
					var pw = $("#userpw").val();
					var username = $("#username").val();
					var userphone = $("#userphone").val();
					var usermail = $("#usermail").val();
					var pic = $("#photo").val();
					
					if ((id == null || id == "") || (pw == null || pw == "")
							|| (username == null || username == "")
							|| (userphone == null || userphone == "")
							|| (usermail == null || usermail == "")
							|| (pic == null || pic == "")) {
						alert("모든 값을 입력해주세요");
						return false;
					} else {
						alert(username+"님 회원가입을 축하드립니다.");
						return true;
					}
				});
			});
	
	
	/* 휴대폰 본인인증 */	
	function sendSMS(){
		
         var phoneNumber = $("#userphone").val();
         
         if(phoneNumber == null || phoneNumber == ""){
        	 alert("전화번호를 입력해주세요!");
        	 return false;
         }

         $("#getPhoneBtn").css('display', 'none');
         $("#verCode").css('display', 'block');
         $("#checkBtn").css('display', 'block');
		
         $.ajax({
             type: "GET",
             url: "sendSms.do",
             data: {
                 "phoneNumber" : phoneNumber
             },
             success: function(res){
            	 
                 $('#checkBtn').click(function(){
                	 var noChk = $("#noChk").val();
                	 
                     if(res == noChk){
							
                    	 alert("휴대폰 인증이 정상적으로 완료되었습니다.");
                    	 $("#checkBtn").prop('disabled', true);
                    	 
                         
                     }else{
                         alert("인증번호가 올바르지 않습니다!");
                         return false;
                     }
                 })

             },
				error: function(request, status, error){
					alert("ajax 통신 실패!");
				}
	         });
		 }
		
		
</script>
<style type="text/css">
.alert alert-success {
	color: red;
}

.alert-danger {
	color: red;
}


	#verCode, #checkBtn{
		display: none;
	}
</style>
</head>
<body>

	<%@ include file="header.jsp"%>
	<div class="center">
		<h1>Signup</h1>
		<form:form method="post" enctype="multipart/form-data"
			modelAttribute="uploadFile" id="signupform" action="signup.do">
			<input type="hidden" name="user_Point" value="0" />
			<div class="txt_field">
				<input type="text" name="user_Id" id="userid" /> <span></span> 
				<label>id</label>
			</div>
			<input type="button" onclick="idchk();" value="아이디 체크" />
			<div id="id_chk"></div>
			<div class="txt_field">
				<input type="password" name="user_Pw" id="userpw" onfocus="idcheckz();" /> <span></span> 
				<label>password</label>
			</div>
			<div class="txt_field">
				<input type="password" id="userpwcheck" onfocus="pwcheckz();" /> <span></span>
				<label>password check</label>
			</div>
			<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>

			<div class="txt_field">
				<input type="text" name="user_Name" id="username" /><span></span> 
				<label>user name</label>
			</div>

			<div class="txt_field">
				<input type="text" name="user_Phone" id="userphone" style="width: 200px;"/> <span></span>
				<label>phone</label>
			</div>
			<span style="text-align: right;"><input type="button" value="인증번호받기" onclick="sendSMS();" id="getPhoneBtn"/></span>
			<div class="txt_field" id="verCode">
				<input type="text" style="width: 200px;" id="noChk"/> <span></span> <label>verification code</label>
			</div>
				<input type="button" id="checkBtn" value="인증번호 확인"/>
			<div class="txt_field">
				<input type="text" name="user_Mail" id="usermail" /> <span></span>
				<label>email</label>
			</div>
			<div class="txt_field">
				<input type="file" id="photo" name="pic" /><span></span>
			</div>
			<div class="language">
				<div>Preferred language</div>
				<input type="checkbox" name="user_Lang" value="1" />java 
				<input type="checkbox" name="user_Lang" value="2" />python 
				<input type="checkbox" name="user_Lang" value="3" />c++
				<input type="checkbox" name="user_Lang" value="4" />c
				<input type="checkbox" name="user_Lang" value="5" />javascript 
				<!-- <input type="hidden" name="user_Lang" value="java" /> -->
			</div>
			<input type="submit" value="회원가입" style="margin-top: 20px" />
				<div class="signup_link">
					회원이세요? <a href="login.do">로그인</a>
				</div>
		</form:form>
	</div>
	<div style="height: 100px;"></div>
</body>
</html>
