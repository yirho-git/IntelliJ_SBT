<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2>Register</h2>
	<form action="/member/register" name="memberForm" method="post">
		<table border="1">
			<tr>
				<th>userId</th>
				<td><input type="text" name="userId" id="userId" value=""></td>
			<tr>
			<tr>
				<th>userPw</th>
				<td><input type="text" name="userPw" id="userPw" value=""></td>
			<tr>
			<tr>
				<th>userName</th>
				<td><input type="text" name="userName" id="userName" value=""></td>
			</tr>
		</table>
		<div>
			<input type="button" id="registerBtn" value="등록">
			<input type="button" id="listBtn" value="목록">
		</div>
	</form>
</body>
<script type="text/javascript">
$(function(){
	const registerBtn = $("#registerBtn");
	const listBtn = $("#listBtn");
	
	registerBtn.on("click", function(){
		const userId = $("#userId").val();
		const userPw = $("#userPw").val();
		const userName = $("#userName").val();
		
		if(userId == null || userId == ""){
			alert("아이디를 입력해주세요");
			return false;
		}
				
		if(userPw == null || userPw == ""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		if(userName == null || userName == ""){
			alert("이름을 입력해주세요");
			return false;
		}
		memberForm.submit();
	});
	
	listBtn.on("click", function(){
		console.log("listBtn click...!");
		location.href="/member/list";
	});
});
</script>
</html>