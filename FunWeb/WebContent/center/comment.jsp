<%@page import="board.CommentDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="board.CommentBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
String id = request.getParameter("id");
String content = request.getParameter("content");
int parent_num = Integer.parseInt(request.getParameter("parent_num"));
Timestamp date=new Timestamp(System.currentTimeMillis());

CommentBean cb = new CommentBean();
cb.setContent(content);
cb.setId(id);
cb.setParent_num(parent_num);
cb.setDate(date);
 
CommentDAO cdao = new CommentDAO();
cdao.insertComment(cb);

%>
<script type="text/javascript">
location.href="fcontent.jsp?num=<%=num%>&pageNum=<%=pageNum %>";
</script>

</body>
</html>