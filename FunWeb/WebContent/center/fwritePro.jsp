<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
// center/fwritePro.jsp

// 업로드 프로그램 설치 cos.jar
// WebContent 에 upload폴더 생성

// upload 물리적 경로
String realPath = request.getRealPath("/upload");
System.out.println(realPath);

// 업로드 파일크기 제한
int maxSize = 5*1024*1024; // 5MB

// MultipartRequest 객체생성 => 파일업로드, multi정보저장
MultipartRequest multi = new MultipartRequest(
		request,realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());


// 파라미터값 가져오셔서 변수에 저장
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file = multi.getFilesystemName("file");
// BoardBean bb 객체생성
// 멤버변수 <= 파라미터값 저장
BoardBean bb=new BoardBean();
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);

// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// insertBoard(bb) 메서드 호출
bdao.insertBoard(bb);
// notice.jsp 이동
response.sendRedirect("fnotice.jsp");
%>
</body>
</html>






