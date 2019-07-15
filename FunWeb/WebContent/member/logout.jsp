<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/logout.jsp</h1>
	<%
		session.invalidate();
	%>
	<script type="text/javascript">
		alert("로그아웃");
		location.href="../main/main.jsp";
	</script>
	<%
// 		response.sendRedirect("sessionMain.jsp");
	%>
</body>
</html>