<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">
<script src="http://192.168.130.43:82/socket.io/socket.io.js"></script>
<!-- <script src="http://localhost:82/socket.io/socket.io.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green">1:1 채팅</i>
								</h4>
							</div>
							<div>
								<button type="button" class="btn btn-default pull-right"
									onclick="location.href='main.do'">종료</button>
							</div>
							<div>
								<button type="button" class="btn btn-default pull-right" onclick="location.href='main.do'">호출</button>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget" id="chat_box"
								style="overflow-y: auto; width: auto; height: 400px;"></div>
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<input type="text" style="width: 80px; height: 30px;"
											class="form-control" id="name" value="${User.user_Id }"
											readonly>
									</div>
								</div>
								<div class="row" style="height: 80px">
									<div class="form-group col-xs-10">
										<input type="text" style="height: 60px;" class="form-control"
											id="msg" placeholder="메세지를 입력하세요">
									</div>
									<div class="from-group col-xs-2">
										<button type="button" class="btn btn-default pull-right"
											id="msg_process">전송</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(
				function() {
					var socket = io("http://192.168.130.43:82");
					//var socket = io("http://localhost:82");

					//msg에서 키를 누를떄
					$("#msg").keydown(function(key) {
						//해당하는 키가 엔터키(13) 일떄
						if (key.keyCode == 13) {
							//msg_process를 클릭해준다.
							msg_process.click();
						}
					});

					//msg_process를 클릭할 때
					$("#msg_process").click(
							function() {
								//소켓에 send_msg라는 이벤트로 input에 #msg의 value를 담고 보내준다.
								socket.emit("send_msg", $("#name").val()
										+ " : " + $("#msg").val());
								//#msg에 value값을 비워준다.
								$("#msg").val("");
							});

					// socket server로부터 send_msg를 통해 event를 받을 경우
					socket.on('send_msg', function(msg) {
						$('<div> </div>').text(msg).appendTo("#chat_box");
					});
				});
	</script>
</body>
</html>