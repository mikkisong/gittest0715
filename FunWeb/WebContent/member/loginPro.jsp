<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");

MemberDAO mdao = new MemberDAO();
int check = mdao.userCheck(id, pass);
if(check == 1){
	session.setAttribute("id", id);
	%>
	<script type="text/javascript">
	alert("로그인 성공");
	location.href="../main/main.jsp";
	</script>
	<%
	} else if(check==0){
		%>
		<script type="text/javascript">
		alert("아이디/패스워드 불일치");
		history.back();
		</script>
		<%
	} else if(check==-1){
		%>
		<script type="text/javascript">
		alert("미가입 아이디");
		history.back();
		</script>
		<%
	}

%>



</body>
</html>