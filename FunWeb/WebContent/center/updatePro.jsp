<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
String pageNum = request.getParameter("pageNum");
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");


BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

BoardDAO bdao = new BoardDAO();
int check = bdao.numCheck(num, pass);
if(check == 1){
	bdao.updateBoard(bb);
	%>
	<script type="text/javascript">
	alert("게시물 수정완료!");
	location.href="content.jsp?num=<%=num %>&pageNum=<%=pageNum %>";
	</script>--
<%
}else if(check == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호 불일치!");
	history.back();
	</script>
<%
} 

%>

</body>
</html>