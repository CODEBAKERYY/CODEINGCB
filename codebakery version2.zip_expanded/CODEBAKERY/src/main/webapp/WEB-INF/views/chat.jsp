<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   	<meta charset="UTF-8">
    <!-- <script src="http://192.168.130.43:82/socket.io/socket.io.js"></script> -->
    <script src="http://localhost:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
   	<title>CODEBAKERY</title>
   	<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
   	<style type="text/css">
   		#chat {
   			padding-left: 20%;
   		} 
		#chat_box {
		    width: 800px;
		    min-width: 800px;
		    height: 400px;
		    min-height: 400px;
		    border: 1px solid black; 
		}
		#msg {
		    width: 700px;
		    height: 40px;
		}
		#msg_process {
		    width: 90px;
		    height: 45px;
		}
		#main_chat {
			padding-left: 20%;
		}
		#name{
			width: 60px;
		}
	</style>
</head>
<body>
<div id = "main_chat">
	<h4><i >1:1 채팅</i></h4>
</div>
<div id = "chat">
	<div id="chat_box"></div>
	<input type="text" id="name" value="${User.user_Id }" readonly><br>
	<input type="text" id="msg" placeholder="메세지를 입력하세요">
	<button id="msg_process">전송</button>
</div>
	
	<script>
	$(document).ready(function(){
    	// var socket = io("http://192.168.130.43:82");
    	var socket = io("http://localhost:82");
    	var time;
    
        //msg에서 키를 누를떄
        $("#msg").keydown(function(key){
        	//해당하는 키가 엔터키(13) 일떄
            if(key.keyCode == 13){
            	//msg_process를 클릭해준다.
            	msg_process.click();
            }
		});
        
        //msg_process를 클릭할 때
        $("#msg_process").click(function(){
        	//소켓에 send_msg라는 이벤트로 input에 #msg의 value를 담고 보내준다.
			//socket.emit("send_name", $("#name").val());
        	socket.emit("send_msg", $("#name").val() + " : " + $("#msg").val());
			//#msg에 value값을 비워준다.
        	$("#msg").val("");
		});
        
		// socket server로부터 send_msg를 통해 event를 받을 경우
		
		/* socket.on('send_name', function(name){
			$('<div> </div>').text(name + " : ").appendTo("#chat_box");
		}); */
       	socket.on('send_msg', function(msg){
			$('<div> </div>').text(msg).appendTo("#chat_box");
		});
	});
	</script>
</body>
</html>