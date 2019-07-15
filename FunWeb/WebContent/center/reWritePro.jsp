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
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져와서 변수에 저장
int num=Integer.parseInt(request.getParameter("num"));
int re_ref=Integer.parseInt(request.getParameter("re_ref"));
int re_lev=Integer.parseInt(request.getParameter("re_lev"));
int re_seq=Integer.parseInt(request.getParameter("re_seq"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// 패키지 board 자바파일 BoardBean 만들기
// BoardBean bb 객체생성 
// BoardBean 변수 <- 파라미터 저장
BoardBean bb=new BoardBean();
bb.setNum(num);
bb.setRe_ref(re_ref);
bb.setRe_lev(re_lev);
bb.setRe_seq(re_seq);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

// 패키지 board 자바파일 BoardDAO 만들기
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// reInsertBoard(bb) 메서드 만들고 호출
bdao.reInsertBoard(bb);
// list.jsp 이동
response.sendRedirect("fnotice.jsp");
%>
</body>
</html>