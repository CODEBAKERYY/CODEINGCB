<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
function passwordCheckk(){
	alert("자바스크립트 돌아감");
    var password = document.getElementById("user_Pw").value;
    var passwordCheck = document.getElementById("user_Pwchk").value;
    
    alert("값 잘 받아옴"+password+"/"+passwordCheck);
   
    if( (passwordCheck =="" && password=="") || (passwordCheck == null && password == null)){
       alert("수정되었습니다.");
       return true;
       
    }else if(password != passwordCheck){
          alert("비밀번호가 일치하지 않습니다.")
          return false;
    }else{
  	  return true;
    }
    
 }

function deactivate(){
	var url="deactivatepopup.do";
	window.open(url,"","width=400,height=300,left=400,top=100");
}

</script>
</head>
<body>
<%@ include file="header.jsp"%>
	
		<div class="title" style="margin-bottom: 20px; margin-top: 20px">
			<h2>마이페이지 수정</h2>
		</div>
		<form action="modify.do" method="post">
		<table class="tableForm" style="margin: auto; width: 60%; height: 800px; text-align: center; font-size: 22px">
			<tr>
				<th>ID</th>
				<td>
				<label style="height: 22px; margin-top: 10px; width: 40%;">${User.user_Id}</label>
				<input type="hidden" id="user_Id" name="user_Id" value="${User.user_Id}"/>
				</td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td><input type="text" name="user_Pw" id="user_Pw"   placeholder="비밀번호를 입력하세요" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>PASSWORD CHECK</th>
				<td><input type="password" id="user_Pwchk" placeholder="비밀번호를 다시 입력해주세요" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="user_Name" id="user_Name" value="${User.user_Name}" placeholder="${User.user_Name}" style="height: 22px; margin-top: 10px; width: 40%;" ></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="text" name="user_Phone" id="user_Phone" value="${User.user_Phone}" placeholder="${User.user_Phone}" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="user_Mail" id="user_Mail" value="${User.user_Mail}" placeholder="${User.user_Mail}"    style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>PREFERRED LANGUAGE</th>
				<td>
					<input type="checkbox" id="java"><label for="java">java</label>
					<input type="checkbox" id="python"><label for="python">python</label>
					<input type="checkbox" id="c++"><label for="c++">c++</label>
					<input type="checkbox" id="c"><label for="c">c</label>
					<input type="checkbox" id="javascript"><label for="javascript">javascript</label>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				
		<%-- 그냥 수정 <input type="submit" class="button" value="수정" onclick="location.href='modify.do?user_id=${dto.user_id}'"> --%>
		<!-- ajax -->
					<input type="submit" class="button" value="수정" onclick="passwordCheckk();">
					<input type="button" class="button" value="취소" onclick="">
					<input type="button" class="button" value="탈퇴" onclick="deactivate();">
				
					
				</td>
			</tr>
		</table>
		</form>
<%@ include file="footer.jsp"%>
</body>
</html>