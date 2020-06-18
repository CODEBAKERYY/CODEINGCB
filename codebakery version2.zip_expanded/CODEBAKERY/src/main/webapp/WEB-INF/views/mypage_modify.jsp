<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<% MemberDto user = (MemberDto)session.getAttribute("login"); %> 

<script type="text/javascript">
	
	  $("input:checkbox[id='java']").prop("checked", true);

</script>

 
<script type="text/javascript">
function passwordCheckk(){
    var password = document.getElementById("user_pw").value;
    var passwordCheck = document.getElementById("user_pwchk").value;
  
    /* if(password != null && password != ""){
       if(password != passwordCheck){
          alert("비밀번호를 다시 한번 입력해주세요");
          
       }
    } */
    if(passwordCheck =="" && password=="" && passwordCheck == null && password == null){
       alert("수정되었습니다.");
       return true;
    }else if(password != passwordCheck){
          alert(password+"/"+passwordCheck+"비밀번호가 일치하지 않습니다.")
          return false;
    }else{
  	  return true;
    }
    
 }
function confirm(){
    var url="pwcheckpopup.do";
    	window.open(url,"","width=250,height=150,left=400,top=100");
	}
function deactivate(){
	var url="deactivatepopup.do";
	window.open(url,"","width=400,height=300,left=400,top=100");
}

</script>


</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	
		<div class="title" style="margin-bottom: 20px; margin-top: 20px">
			<h2>마이페이지 수정</h2>
		</div>
		
		<form action="modify.do" method="post">
			
		<table class="tableForm" style="margin: auto; width: 60%; height: 800px; text-align: center; font-size: 22px">
			<tr>
				<th>ID</th>
				<td>
				<label style="height: 22px; margin-top: 10px; width: 40%;"><%=user.getUser_id() %></label>
				<input type="hidden" id="user_id" name="user_id" value="<%=user.getUser_id() %>"/>
				</td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td><input type="text" name="user_pw" id="user_pw"   placeholder="비밀번호를 입력하세요" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			<!-- value="<%=user.getUser_pw() %>" 잠시 삭제 -->
			</tr>
			<tr>
				<th>PASSWORD CHECK</th>
				<td><input type="password" name="user_pwchk" id="user_pwchk" placeholder="비밀번호를 다시 입력해주세요" style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="user_name" id="user_name" value="<%=user.getUser_name() %>" placeholder=<%=user.getUser_name() %> style="height: 22px; margin-top: 10px; width: 40%;" ></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="text" name="user_phone" id="user_phone" value="<%=user.getUser_phone()%>" placeholder=<%=user.getUser_phone()%> style="height: 22px; margin-top: 10px; width: 40%;"></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="user_mail" id="user_mail" value="<%=user.getUser_mail() %>" placeholder=<%=user.getUser_mail() %> "   style="height: 22px; margin-top: 10px; width: 40%;"></td>
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
					<input type="button" class="button" value="취소" onclick="#">
					<input type="button" class="button" value="탈퇴" onclick="deactivate();">
				
					
				</td>
			</tr>
		</table>
		</form>
		
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>