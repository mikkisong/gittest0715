<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDAO2"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="notice.jsp">공지사항</a></li>
<li><a href="fnotice.jsp">자료실</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<%
// num , pageNum 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
//BoardDAO bdao 객체생성
BoardDAO2 bdao2=new BoardDAO2();
// 조회수 증가
// updateReadcount(num)
bdao2.updateReadcount(num);
//BoardBean bb  =  getBoard(num) 메서드호출
BoardBean2 bb2=bdao2.getBoard(num);
String content2=bb2.getContent();
if(content2!=null){
	//   /r/n => <br> 바꾸기   문자열.replace("old문자열","new문자열")
	content2=content2.replace("\r\n","<br>");		
}
%>
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td class="twrite">글번호</td><td><%=bb2.getNum() %></td>
<td class="twrite">조회수</td><td><%=bb2.getReadcount() %></td></tr>
<tr><td class="twrite">작성자</td><td><%=bb2.getName() %></td>
<td class="twrite">작성일</td><td><%=bb2.getDate() %></td></tr>
<tr><td class="twrite">제목</td><td colspan="3"><%=bb2.getSubject() %></td></tr>
<tr><td class="twrite">내용</td><td colspan="3"><%=bb2.getContent() %></td></tr>
</table>
<div id="table_search">
<%
String id = (String)session.getAttribute("id");
if(id!=null){
	if(id.equals(bb2.getName())){
	%>
	<input type="button" value="글수정" class="btn" 
 	onclick="location.href='updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
 	<input type="button" value="글삭제" class="btn" 
	 onclick="del()">
	 
	<%	
	}
}

%>
<script type="text/javascript">
function del(){
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

	     location.href="deletePro.jsp?num=<%=num %>&pageNum=<%=pageNum %>";

	 }else{   //취소

	     return false;

	 }
}



</script>
<input type="button" value="글목록" class="btn" 
 onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'" >
</div>



<div class="clear"></div>

</article>


<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>