<%@page import="board.CommentDAO"%>
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
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		CommentDAO cdao = new CommentDAO();
		cdao.deleteComment(idx);
	%>
	<script type="text/javascript">
	location.href = "fcontent.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
	</script>
</body>
</html>