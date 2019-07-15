<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		BoardDAO bdao = new BoardDAO();
		BoardBean bb = new BoardBean();
		bb.setNum(num);
		bdao.delContent(num);
	%>
	<script type="text/javascript">
	alert("게시글 삭제 완료");
	location.href = "notice.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>";
	</script>

</body>
</html>