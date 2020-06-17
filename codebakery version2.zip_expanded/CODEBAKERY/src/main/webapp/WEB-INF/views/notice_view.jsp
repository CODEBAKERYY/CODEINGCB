<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!--bootstrap css  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/boardstyle.css" rel="stylesheet" type="text/css" media="all" />


<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

<style type="text/css">

	#btnUpdate, #btnDelete, #btnList{
		font-size: 14px;
		width: 60px;
	}
	
	
	
</style>


</head>

<body>
	<%@ include file="header.jsp"%>

	
	<div id="logo" class="container">
		<h1>
			<a class="icon icon-tasks"><span>공지사항</span></a>
		</h1>
	</div>

 	<!--============== 공지사항 내용 START ==============-->
        <div>
            <form method="post">
                <div>
                    <div>
                        <table style="margin: 0px auto;">
                            <tr>
                                <th>제목</th>
                                <td style="padding:10px;"><input style="width: 821px; height: 35px;" type="text" value="${detail.notice_Title }" readonly/></td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td style="padding:10px;"><input style="width: 821px; height: 35px;" type="text" value="${detail.user_Id }" readonly/></td>
                            </tr>
                            <tr>
                                <th style="display: table-cell; vertical-align: middle;">내용</th>
                                <td style="padding:10px;"><textarea style="resize: none;" rows="15" cols="100" readonly>${detail.notice_Content }</textarea></td>
                            </tr>
                        </table>
                        
                        <div style="width: 850px; margin: 0 auto; text-align: right;" >
                            <button type="button" class="btn btn-light pull-right" id="btnUpdate" onclick="location.href='notice_edit.do?notice_No=${detail.notice_No}'">수정</button>
                            <button type="button" class="btn btn-light pull-right" id="btnDelete" onclick="location.href='notice_delete.do?notice_No=${detail.notice_No}'">삭제</button>
                            <button type="button" class="btn btn-light pull-right" id="btnList" onclick="location.href='notice.do'">목록</button>
                        </div>
                    </div>
                </div>
            </form>
          </div>
       	<!--============== 공지사항 내용 END ==============-->
       	
       <br></br>
       
        <!--============== 공지사항 디테일 댓글 쓰기 START ==============-->
        <div class="container">
           <form method="post">
               <div>
                   <div style="margin-top: 70px;">
                       <span style="font-weight: bold;">Comments</span>
                   </div>
                   <div>
                       <table>                    
                           <tr>
                               <td>
                                   <textarea style="resize: none;" rows="5" cols="140" placeholder="댓글을 입력하세요."></textarea>
                                   <div style="text-align:right;"><button class="btn btn-primary pull-right" style="width:70px; height:35px;" onclick="notice_comment.do">등록</button></div>
                               </td>
                           </tr>
                       </table>
                   </div>
               </div>
           </form>
       </div>
       <!--============== 공지사항 디테일 댓글 쓰기 END ==============-->
            
            <br></br>
            
        <!--============== 공지사항 디테일 댓글 리스트 START ==============-->
           <div class="container">
               <form method="post">
                   <div>
                       <div>
                           <div>
                               <table class='table'>
                               	<tr>
                                   	<span style="font-size: 18px;">user3</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       <span style="color:grey; font-size: 14px;">2020.04.23 17:16</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       <a href="#" style="width:45px; height:30px; font-size: 15px;">답글</a>
                                  	 </tr>
                                  	 <tr>
                                       <td>공지사항 댓글입니다.333333</td>
                                   </tr>
                               </table>
                           </div>
                       </div>
                   </div>
               </form>
           </div>
           <br><br><br><br><br><br>
   <!--============== 공지사항 디테일 댓글 리스트 END ==============-->


	<%@ include file="footer.jsp"%>
</body>
</html>
