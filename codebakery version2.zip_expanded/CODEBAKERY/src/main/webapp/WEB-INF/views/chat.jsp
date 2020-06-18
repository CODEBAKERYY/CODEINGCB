<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<meta charset="UTF-8">
    <script src="http://192.168.130.43:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
   	<title>socket server</title>
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
	</style>
</head>
<body>
<div id = "main_chat">
	<h4><i >1:1 채팅</i></h4>
</div>
<div id = "chat">
	<div id="chat_box"></div>
	<input type="text" id="msg" placeholder="메세지를 입력하세요">
	<button id="msg_process">전송</button>
</div>
	
	<script>
	$(document).ready(function(){
    	var socket = io("http://192.168.130.43:82");
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
			socket.emit("send_msg", $("#msg").val());
			//#msg에 value값을 비워준다.
			$("#msg").val("");
		});
		
		// socket server로부터 send_msg를 통해 event를 받을 경우
		socket.on('send_msg', function(msg){
			// div 태그를 만들어 텍스트를 msg로 지정을 한 뒤 #chat_box에 추가를 시켜준다.
			$('<div></div>').text(msg).appendTo("#chat_box");
			
		});
	});
	</script>
</body>
</html>