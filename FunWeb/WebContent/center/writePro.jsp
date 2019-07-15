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
// center/writePro.jsp
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터값 가져오셔서 변수에 저장
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// BoardBean bb 객체생성
// 멤버변수 <= 파라미터값 저장
BoardBean bb=new BoardBean();
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// insertBoard(bb) 메서드 호출
bdao.insertBoard(bb);
// notice.jsp 이동
response.sendRedirect("notice.jsp");
%>
</body>
</html>






