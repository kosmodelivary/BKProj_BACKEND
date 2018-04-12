<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<!-- *********************************************************** HEAD *********************************************************** -->
<head>
<!-- ******************************************* -->	  
<c:import url="/admin/include/loginCheck.jsp" />
<c:import url="/admin/include/head.jsp" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/loading-bar.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/loading-bar.min.js"></script>
<!-- ******************************************* -->  
<script type="text/javascript">
	var isSending = false;

 	$(function () {
 	 	var mailBar = new ldBar("#sendmail");

/* 		if (isSend == true) { 	 		
			console.log("isSend: " + isSend);
 */ 			
 			pollInterval = setInterval(function () {
	 			console.log("run... : " + isSending);
 				poll();
 			}, 700);
 			
 			poll = function() {
 				$.ajax({
 					url: '<c:url value="/admin/member/json/sendState.json"/>',
					type: 'post',
					dataType: 'json',
					async:false,
					success: function(data) {
						console.log("data.total: " + data.total);
						console.log("data.complete: " + data.complete);
						
						// mailBar 수치 변경
						if (isSending == true) {
							if (data.complete > 0) {
								mailBar.set(parseInt(data.complete / data.total * 100.0));
							}
				 			document.getElementById("mailtext").innerHTML = '메일 전송 완료로 가는 중..';
						}
						// 메일이 모두 보내지면 polling 종료
						if (data.complete > 0 && data.complete == data.total) {
				 			document.getElementById("mailtext").innerHTML = '메일 전송 완료';
							clearInterval(pollInterval);
						}
					},
					error: function() {
						console.log('fail');
					}
 				}); // $.ajax
 			}; // poll = function() {
 			poll();
 		// } // if (isSend == true) 
 	}); // $(function () {
	
 	function isCancel() {
		if (confirm('정말 취소하시겠습니까?') == true) {
			window.close();
		} else {
			return;
		}
	}
	function isValidate(form){
		if(form.title.value.length==0){
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}			
		if(form.content.value.length==0){
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
		
		if (confirm('Email 수신 동의 회원님들께 메일을 정말 보내시겠습니까?') == true) {
			alert('메일 보냅니다.');

			isSending = true;
			return true;
		} else {
			return false;
		}
	} // isValidate
</script>
</head>
<!-- *********************************************************** HEAD *********************************************************** -->
<!-- *********************************************************** BODY *********************************************************** -->
<body>
<div id="wrapper">
<div id="page-wrapper" style="padding:0px 0px 0px 0px; margin:0px 0px 0px 0px">
			
	<div class="row" style="border:2px solid gold; padding:10px; height:auto; min-height:100px; overflow:auto; width:86%; margin:20px 20px 20px 30px;">
        <img alt="공지사항 작성" width="100" src="${pageContext.request.contextPath}/Images/pencil.png"> 
        <span style="font-family:Impact; font-size:5.0em; vertical-align:bottom;">&nbsp;&nbsp;Send E-Mail</span>
    </div>
	
    <div class="row" style="padding:10px; height:auto; min-height:100px; overflow:auto; width:95%; margin:3px;">
                
    <div class="col-lg-12">
    	<div class="panel panel-default">
        	<div class="panel-heading">
            	<font size="6pt" color="gray" face="Impact">Write</font>
			</div>

            <form action="<c:url value='/ADMIN/MEMBER/EmailSend.do'/>" 
			      method="post"				      
			      onsubmit="return isValidate(this)">
             
         		<div class="panel-body" style="padding-bottom:15px">
                   <table class="table table-striped table-bordered table-hover" id="dataTables-example" style="margin-bottom:10px">
                   <thead>
		             <tr>
		                <td>
							<input value="${title}" name="title" type="text" class="form-control" width="100%" placeholder="제목을 입력하세요."/>
						</td>
		             </tr>
       			  </thead>
       			  <tbody>         
		            <tr>					
						<td>
							<textarea name="content" class="form-control" rows="15" placeholder="내용을 입력하세요.">${content}</textarea>
						</td>  						
				    </tr>
				 </tbody>
			 </table>
			 <div class="col-sm-3 text-center">
			 	<span id="mailtext">메일 전송 준비</span>
			 	<div class="ldBar" id="sendmail" data-preset="stripe" data-value="0" style="width:100%;height:40px;margin:0px;"></div>
			 </div>

			 <div class="text-center" style="padding-top:10px;margin-top: 20px">
			   <span style="float:inherit;">
				<a class="btn btn-default" href="javascript:void(0);" role="button" style="a" onclick="isCancel();">취소</a>
			  </span>
			  <span style="float:inherit;">
				<button type="submit" id="sendSubmit" class="btn btn-default">메일 발송</button>
			  </span>
			 </div>
<!-- 			 <script type="text/javascript">
			 	var mailBar = new ldBar("#sendmail");

			 	$(function () {
			 		var mailPolling = function () {
						console.log("isSend: " + isSend);
			 			if (isSend == false) {
							return;			 			
						}
			 			
			 			pollInterval = setInterval(function () {
				 			console.log("run... : " + isSend);
				 			document.getElementById("mailtext").innerHTML = '메일 전송중...';
			 				poll();
			 			}, 2000);
			 			
			 			poll = function() {
			 				$.ajax({
			 					url: '<c:url value="/admin/member/json/sendState.json"/>',
								type: 'post',
								dataType: 'json',
								async:false,
								success: function(data) {
									console.log("data.total: " + data.total);
									console.log("data.complete: " + data.complete);
									
									// ldBar 수치 변경
									mailBar.set(parseInt(data.total / data.complete * 100.0));
									if (data.complete > 0 && data.complete == data.total) {
							 			document.getElementById("mailtext").innerHTML = '메일 전송 완료';
										clearInterval(pollInterval);
									}
								},
								error: function() {
									console.log('fail');
								}
			 				}); // $.ajax
			 			}; // poll = function() {
			 			poll();
			 		}; // $('#sendSubmit').click(function (){
			 	}); // $(function () {
			 </script>
 -->			 </div>
			</form>
		   </div>
		 </div>
		 </div>
	</div>
</div>
</body>
<!-- *********************************************************** BODY *********************************************************** -->
</html>
