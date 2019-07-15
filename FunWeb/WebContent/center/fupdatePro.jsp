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
// center/fupdatePro.jsp
String realPath = request.getRealPath("/upload");
System.out.println(realPath);

// 업로드 파일크기 제한
int maxSize = 5*1024*1024; // 5MB

// MultipartRequest 객체생성 => 파일업로드, multi정보저장
MultipartRequest multi = new MultipartRequest(
		request,realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());



String pageNum = multi.getParameter("pageNum");
int num = Integer.parseInt(multi.getParameter("num"));
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");


BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setPass(pass);
bb.setSubject(subject);

if(file!=null){
bb.setFile(file);
}else {
	bb.setFile(multi.getParameter("orifile"));
}

bb.setContent(content);

BoardDAO bdao = new BoardDAO();
int check = bdao.numCheck(num, pass);
if(check == 1){
	bdao.updateBoard(bb);
	%>
	<script type="text/javascript">
	alert("게시물 수정완료!");
	location.href="fcontent.jsp?num=<%=num %>&pageNum=<%=pageNum %>";
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